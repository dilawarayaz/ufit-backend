<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Payment;
use Illuminate\Support\Facades\Response;
use Barryvdh\DomPDF\Facade\Pdf;

class PaymentController extends Controller
{
    // List with filters
    public function index(Request $request)
    {
        
        $query = Payment::with(['user', 'gym']);

        if ($request->filled('user_id')) {
            $query->where('user_id', $request->user_id);
        }

        if ($request->filled('gym_id')) {
            $query->where('gym_id', $request->gym_id);
        }

        if ($request->filled('status')) {
            $query->where('status', $request->status);
        }

        if ($request->filled('start_date')) {
            $query->whereDate('created_at', '>=', $request->start_date);
        }

        if ($request->filled('end_date')) {
            $query->whereDate('created_at', '<=', $request->end_date);
        }

        $payments = $query->orderBy('created_at', 'desc')->paginate(15)->appends($request->all());
    //   dd($payments);
        return view('admin.payments.index', compact('payments'));
    }

    // Export filtered payments as CSV
    public function export(Request $request)
    {
        $query = Payment::with(['user', 'gym']);

        if ($request->filled('user_id')) {
            $query->where('user_id', $request->user_id);
        }

        if ($request->filled('gym_id')) {
            $query->where('gym_id', $request->gym_id);
        }

        if ($request->filled('status')) {
            $query->where('status', $request->status);
        }

        if ($request->filled('start_date')) {
            $query->whereDate('created_at', '>=', $request->start_date);
        }

        if ($request->filled('end_date')) {
            $query->whereDate('created_at', '<=', $request->end_date);
        }

        $payments = $query->orderBy('created_at', 'desc')->get();

        $filename = 'payments_report_'.date('Ymd_His').'.csv';

        $columns = ['ID', 'User', 'Gym', 'Amount', 'Status', 'Payment Method', 'Transaction ID', 'Date'];

        $callback = function () use ($payments, $columns) {
            $file = fopen('php://output', 'w');
            fputcsv($file, $columns);

            foreach ($payments as $payment) {
                
                
                fputcsv($file, [
                    $payment->id,
                    $payment->user ? $payment->user->name : 'N/A',
                    $payment->gym ? $payment->gym->name : 'N/A',
                    number_format($payment->amount, 2),
                    ucfirst($payment->status),
                    $payment->payment_method ?? '-',
                    $payment->transaction_id ?? '-',
                    $payment->created_at->format('Y-m-d H:i:s'),
                ]);
            }

            fclose($file);
        };

        return Response::stream($callback, 200, [
            'Content-Type' => 'text/csv',
            'Content-Disposition' => "attachment; filename={$filename}",
        ]);
    }

    // Show single payment invoice
    public function show($id)
    {
        $payment = Payment::with(['user', 'gym'])->findOrFail($id);
        return view('admin.payments.invoice', compact('payment'));
    }

    // Download invoice PDF
    public function downloadInvoice($id)
    {
        $payment = Payment::with(['user', 'gym'])->findOrFail($id);
        $pdf = PDF::loadView('admin.payments.invoice_pdf', compact('payment'));
        return $pdf->download('invoice_'.$payment->id.'.pdf');
    }

    // Stripe payment intent creation
    public function createStripePayment(Request $request)
    {
        
        \Stripe\Stripe::setApiKey(env('STRIPE_SECRET'));

        $request->validate([
            'amount' => 'required|numeric|min:1',
        ]);

        try {
            $paymentIntent = \Stripe\PaymentIntent::create([
                'amount' => $request->amount * 100, // cents
                'currency' => 'usd',
                'payment_method_types' => ['card'],
            ]);

            return response()->json(['clientSecret' => $paymentIntent->client_secret]);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 400);
        }
    }
}
