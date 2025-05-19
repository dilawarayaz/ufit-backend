@extends('layouts.app')

@section('content')
<div class="container mt-4">
    <h2>Payments & Invoices</h2>

    <form method="GET" action="{{ route('admin.payments.index') }}" class="row g-3 mb-3">
        <div class="col-md-2">
            <input type="text" name="user_id" class="form-control" placeholder="User ID" value="{{ request('user_id') }}">
        </div>
        <div class="col-md-2">
            <input type="text" name="gym_id" class="form-control" placeholder="Gym ID" value="{{ request('gym_id') }}">
        </div>
        <div class="col-md-2">
            <select name="status" class="form-select">
                <option value="">-- Status --</option>
                @foreach(['pending', 'completed', 'failed', 'refunded'] as $status)
                <option value="{{ $status }}" @if(request('status')==$status) selected @endif>
                    {{ ucfirst($status) }}
                </option>
                @endforeach
            </select>
        </div>
        <div class="col-md-2">
            <input type="date" name="start_date" class="form-control" value="{{ request('start_date') }}">
        </div>
        <div class="col-md-2">
            <input type="date" name="end_date" class="form-control" value="{{ request('end_date') }}">
        </div>
        <div class="col-md-2 d-grid">
            <button type="submit" class="btn btn-primary">Filter</button>
        </div>
    </form>

    <a href="{{ route('admin.payments-export', request()->query()) }}" class="btn btn-success mb-3">Export Financial Report (CSV)</a>

    <div class="table-responsive">
        <table class="table table-bordered table-hover">
            <thead class="table-dark">
                <tr>
                    <th>ID</th>
                    <th>User</th>
                    <th>Gym</th>
                    <th>Amount ($)</th>
                    <th>Status</th>
                    <th>Payment Method</th>
                    <th>Transaction ID</th>
                    <th>Date</th>
                    <th>Invoice</th>
                </tr>
            </thead>
            <tbody>
                @forelse ($payments as $payment)
                <tr>
                    <td>{{ $payment->id }}</td>
                    <td>
                        {{ $payment->user ? $payment->user->first_name . ' ' . $payment->user->last_name : 'N/A' }}
                    </td>
                    <td>{{ $payment->gym ? $payment->gym->name : 'N/A' }}</td>

                    <td>{{ number_format($payment->amount, 2) }}</td>
                    <td>{{ ucfirst($payment->status) }}</td>
                    <td>{{ $payment->payment_method ?? '-' }}</td>
                    <td>{{ $payment->transaction_id ?? '-' }}</td>
                    <td>{{ $payment->created_at->format('Y-m-d') }}</td>
                    <td>
                        <a href="{{ route('admin.payments.show', $payment->id) }}" class="btn btn-sm btn-info">View</a>
                        <a href="{{ route('admin.payments.invoice.download', $payment->id) }}" class="btn btn-sm btn-secondary">PDF</a>
                    </td>
                </tr>
                @empty
                <tr>
                    <td colspan="9" class="text-center">No payments found.</td>
                </tr>
                @endforelse
            </tbody>
        </table>
    </div>

    {{ $payments->links() }}
</div>
@endsection