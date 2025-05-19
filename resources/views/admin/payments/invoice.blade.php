@extends('layouts.app')

@section('content')
<div class="container mt-4">
    <h2>Invoice #{{ $payment->id }}</h2>
    <hr>

    <p><strong>Date:</strong> {{ $payment->created_at->format('d M, Y') }}</p>
    <p><strong>User:</strong> {{ $payment->user ? $payment->user->first_name . '' . $payment->user->last_name : 'N/A' }}</p>
    <p><strong>Gym:</strong> {{ $payment->gym ? $payment->gym->name : 'N/A' }}</p>
    <p><strong>Status:</strong> {{ ucfirst($payment->status) }}</p>

    <table class="table table-bordered mt-4">
        <tr>
            <th>Amount</th>
            <td>${{ number_format($payment->amount, 2) }}</td>
        </tr>
        <tr>
            <th>Payment Method</th>
            <td>{{ $payment->payment_method ?? '-' }}</td>
        </tr>
        <tr>
            <th>Transaction ID</th>
            <td>{{ $payment->transaction_id ?? '-' }}</td>
        </tr>
        <tr>
            <th>Notes</th>
            <td>{{ $payment->notes ?? '-' }}</td>
        </tr>
    </table>

    <a href="{{ route('admin.payments.invoice.download', $payment->id) }}" class="btn btn-primary">Download PDF</a>
    <a href="{{ route('admin.payments.index') }}" class="btn btn-secondary">Back</a>
</div>
@endsection
