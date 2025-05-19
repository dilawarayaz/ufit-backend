@extends('layouts.app')

@section('content')
<div class="container py-5">
    {{-- Header --}}
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2 class="fw-bold text-primary">User Subscriptions Management</h2>
        <a href="{{ route('admin.user-subscriptions.create') }}" class="btn btn-success">
            <i class="fas fa-plus me-1"></i> Add New Subscription
        </a>
    </div>

    {{-- Subscriptions Table --}}
    <div class="card shadow-sm border-0">
        <div class="card-header bg-primary text-white">
            <h5 class="mb-0 fw-semibold">Active Subscriptions</h5>
        </div>
        <div class="card-body">
            @if(session('success'))
                <div class="alert alert-success">{{ session('success') }}</div>
            @endif
            @if(session('error'))
                <div class="alert alert-danger">{{ session('error') }}</div>
            @endif
            
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
                                <td>{{ $subscription->user->first_name . ' ' . $subscription->user->last_name ?? 'N/A' }}</td>
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
                                    <a href="{{ route('admin.user-subscriptions.edit', $subscription->id) }}" 
                                       class="btn btn-sm btn-outline-primary me-1"
                                       title="Extend Subscription">
                                        <i class="fas fa-calendar-plus"></i>
                                    </a>
                                    <form action="{{ route('admin.user-subscriptions.destroy', $subscription->id) }}" 
                                          method="POST" class="d-inline" onsubmit="return confirm('Are you sure?')">
                                        @csrf
                                        @method('DELETE')
                                        <button type="submit" class="btn btn-sm btn-outline-danger" title="Delete">
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
               <div class="pagination-container d-flex justify-content-center mt-4 p-4">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <!-- Previous Button -->
                    <li class="page-item {{ $currentPage == 1 ? 'disabled' : '' }}">
                        <a class="page-link" href="?page={{ $currentPage - 1 }}{{ request('search') ? '&search=' . request('search') : '' }}{{ request('subscription_plan') ? '&subscription_plan=' . request('subscription_plan') : '' }}{{ request('status') ? '&status=' . request('status') : '' }}{{ request('role') ? '&role=' . request('role') : '' }}{{ request('date_from') ? '&date_from=' . request('date_from') : '' }}{{ request('date_to') ? '&date_to=' . request('date_to') : '' }}{{ request('sort') ? '&sort=' . request('sort') : '' }}{{ request('direction') ? '&direction=' . request('direction') : '' }}" class="page-link prev-link">Previous</a>
                    </li>

                    <!-- Page Numbers -->
                    @for ($i = 1; $i <= $totalPages; $i++)
                        <li class="page-item {{ $i == $currentPage ? 'active' : '' }}">
                        <a class="page-link" href="?page={{ $i }}{{ request('search') ? '&search=' . request('search') : '' }}{{ request('subscription_plan') ? '&subscription_plan=' . request('subscription_plan') : '' }}{{ request('status') ? '&status=' . request('status') : '' }}{{ request('role') ? '&role=' . request('role') : '' }}{{ request('date_from') ? '&date_from=' . request('date_from') : '' }}{{ request('date_to') ? '&date_to=' . request('date_to') : '' }}{{ request('sort') ? '&sort=' . request('sort') : '' }}{{ request('direction') ? '&direction=' . request('direction') : '' }}" class="page-link">{{ $i }}</a>
                        </li>
                        @endfor

                        <!-- Next Button -->
                        <li class="page-item {{ $currentPage == $totalPages ? 'disabled' : '' }}">
                            <a class="page-link" href="?page={{ $currentPage + 1 }}{{ request('search') ? '&search=' . request('search') : '' }}{{ request('subscription_plan') ? '&subscription_plan=' . request('subscription_plan') : '' }}{{ request('status') ? '&status=' . request('status') : '' }}{{ request('role') ? '&role=' . request('role') : '' }}{{ request('date_from') ? '&date_from=' . request('date_from') : '' }}{{ request('date_to') ? '&date_to=' . request('date_to') : '' }}{{ request('sort') ? '&sort=' . request('sort') : '' }}{{ request('direction') ? '&direction=' . request('direction') : '' }}" class="page-link next-link">Next</a>
                        </li>
                </ul>
            </nav>
        </div>
            @endif
        </div>
    </div>
</div>
@endsection