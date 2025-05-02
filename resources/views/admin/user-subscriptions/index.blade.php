@extends('layouts.app')

@section('content')
<div class="container py-5">
    {{-- Header --}}
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2 class="fw-bold text-primary">User Subscriptions Management</h2>
        {{-- Uncomment if needed --}}
        {{-- <a href="{{ route('admin.user-subscriptions.create') }}" class="btn btn-success">
            <i class="fas fa-plus me-1"></i> Add New Subscription
        </a> --}}
    </div>

    {{-- Subscriptions Table --}}
    <div class="card shadow-sm border-0">
        <div class="card-header bg-primary text-white">
            <h5 class="mb-0 fw-semibold">Active Subscriptions</h5>
        </div>
        <div class="card-body">
            @if($subscriptions->isEmpty())
                <div class="alert alert-info mb-0">No subscriptions found.</div>
            @else
                <div class="table-responsive">
                    <table class="table table-bordered table-hover align-middle text-center">
                        <thead class="table-light">
                            <tr>
                                <th>ID</th>
                                <th>User</th>
                                <th>Type</th>
                                <th>Price</th>
                                <th>Status</th>
                                <th>Start Date</th>
                                <th>End Date</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($subscriptions as $subscription)
                            <tr>
                                <td>{{ $subscription->id }}</td>
                                <td>{{ $subscription->user->name ?? 'N/A' }}</td>
                                <td>
                                    <span class="badge bg-{{ $subscription->subscription_type === 'premium' ? 'warning' : 'info' }}">
                                        {{ ucfirst($subscription->subscription_type) }}
                                    </span>
                                </td>
                                <td>
                                    ${{ number_format($subscription->price, 2) }}
                                </td>
                                <td>
                                    <span class="badge bg-{{ $subscription->is_active ? 'success' : 'danger' }}">
                                        {{ $subscription->is_active ? 'Active' : 'Expired' }}
                                    </span>
                                </td>
                                <td>{{ \Carbon\Carbon::parse($subscription->start_date)->format('d M Y') }}</td>
                                <td>{{ \Carbon\Carbon::parse($subscription->end_date)->format('d M Y') }}</td>
                                <td>
                                    {{-- Uncomment if edit is needed --}}
                                    {{-- <a href="{{ route('admin.user-subscriptions.edit', $subscription->id) }}" class="btn btn-sm btn-outline-primary me-1">
                                        <i class="fas fa-edit"></i>
                                    </a> --}}
                                    <form action="{{ route('admin.user-subscriptions.destroy', $subscription->id) }}" 
                                          method="POST" class="d-inline" onsubmit="return confirm('Are you sure?')">
                                        @csrf
                                        @method('DELETE')
                                        <button type="submit" class="btn btn-sm btn-outline-danger">
                                            <i class="fas fa-trash-alt"></i>
                                        </button>
                                    </form>
                                </td>
                            </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>

                {{-- Pagination --}}
                <div class="d-flex justify-content-end mt-4">
                    {{ $subscriptions->links() }}
                </div>
            @endif
        </div>
    </div>
</div>
@endsection
