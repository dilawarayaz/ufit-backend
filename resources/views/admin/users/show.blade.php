@extends('layouts.app')

@section('content')
<div class="container-fluid px-4">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h1 class="fw-bold">User Details</h1>
        <div>
            <a href="{{ route('admin.users.index') }}" class="btn btn-outline-secondary me-2">
                <i class="fas fa-arrow-left me-1"></i> Back
            </a>
            @if(!$user->is_suspended)
                <button class="btn btn-outline-danger me-2" data-bs-toggle="modal" data-bs-target="#changeSubscriptionModal">
                    <i class="fas fa-sync-alt me-1"></i> Change Subscription
                </button>
            @endif
        </div>
    </div>

    @include('admin.users.partials.subscription-modal')

    <div class="row mb-4">
        <div class="col-md-4">
            <div class="card shadow-sm mb-4">
                <div class="card-body text-center">
                    <img src="{{ $user->avatar_url }}" class="rounded-circle mb-3" width="150" height="150">
                    <h3>{{ $user->full_name }}</h3>
                    <p class="text-muted mb-1">{{ $user->email }}</p>
                    
                    <div class="mt-3">
                        <span class="badge bg-{{ $user->email_verified_at ? 'success' : 'danger' }} mb-2">
                            {{ $user->email_verified_at ? 'Verified' : 'Unverified' }}
                        </span>
                        <span class="badge bg-{{ $user->is_suspended ? 'danger' : 'success' }}">
                            {{ $user->is_suspended ? 'Suspended' : 'Active' }}
                        </span>
                    </div>

                    <hr>
                    
                    <div class="d-flex justify-content-center gap-2 mt-3">
                        @if($user->is_suspended)
                            <form action="{{ route('admin.users.reactivate', $user) }}" method="POST">
                                @csrf
                                <button type="submit" class="btn btn-success">
                                    <i class="fas fa-check-circle me-1"></i> Reactivate
                                </button>
                            </form>
                        @else
                            <form action="{{ route('admin.users.suspend', $user) }}" method="POST">
                                @csrf
                                <button type="submit" class="btn btn-danger">
                                    <i class="fas fa-ban me-1"></i> Suspend
                                </button>
                            </form>
                        @endif
                    </div>
                </div>
            </div>

            <div class="card shadow-sm">
                <div class="card-header bg-white">
                    <h5 class="mb-0">Account Information</h5>
                </div>
                <div class="card-body">
                    <ul class="list-unstyled">
                        <li class="mb-2">
                            <strong>Joined:</strong> 
                            {{ $user->created_at->format('M d, Y \a\t h:i A') }}
                        </li>
                        <li class="mb-2">
                            <strong>Last Active:</strong> 
                            {{ $user->last_active_at ? $user->last_active_at->diffForHumans() : 'Never' }}
                        </li>
                        <li class="mb-2">
                            <strong>Role:</strong> 
                            <span class="badge bg-secondary">{{ $user->role->name ?? 'None' }}</span>
                        </li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="col-md-8">
            <div class="card shadow-sm mb-4">
                <div class="card-header bg-white d-flex justify-content-between align-items-center">
                    <h5 class="mb-0">Subscription Details</h5>
                    @if($user->activeSubscription)
                        <span class="badge bg-{{ $user->activeSubscription->is_active ? 'success' : 'danger' }}">
                            {{ $user->activeSubscription->is_active ? 'Active' : 'Inactive' }}
                        </span>
                    @endif
                </div>
                <div class="card-body">
                    @if($user->activeSubscription)
                        <div class="row">
                            <div class="col-md-6">
                                <ul class="list-unstyled">
                                    <li class="mb-2"><strong>Plan:</strong> {{ $user->activeSubscription->plan->name }}</li>
                                    <li class="mb-2"><strong>Started:</strong> {{ $user->activeSubscription->start_date->format('M d, Y') }}</li>
                                    <li class="mb-2"><strong>Expires:</strong> {{ $user->activeSubscription->end_date->format('M d, Y') }}</li>
                                </ul>
                            </div>
                            <div class="col-md-6">
                                <ul class="list-unstyled">
                                    <li class="mb-2"><strong>Price:</strong> ${{ number_format($user->activeSubscription->plan->price, 2) }}/{{ $user->activeSubscription->plan->billing_cycle }}</li>
                                    <li class="mb-2"><strong>Auto Renew:</strong> {{ $user->activeSubscription->auto_renew ? 'Yes' : 'No' }}</li>
                                    <li class="mb-2"><strong>Days Left:</strong> {{ now()->diffInDays($user->activeSubscription->end_date) }} days</li>
                                </ul>
                            </div>
                        </div>
                    @else
                        <div class="alert alert-warning mb-0">
                            This user has no active subscription.
                        </div>
                    @endif
                </div>
            </div>

            <div class="card shadow-sm mb-4">
                <div class="card-header bg-white">
                    <ul class="nav nav-tabs card-header-tabs">
                        <li class="nav-item">
                            <a class="nav-link active" data-bs-toggle="tab" href="#activity">Activity Logs</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-bs-toggle="tab" href="#payments">Payment History</a>
                        </li>
                    </ul>
                </div>
                <div class="card-body">
                    <div class="tab-content">
                        <div class="tab-pane fade show active" id="activity">
                            @if($activityLogs->count())
                                <div class="table-responsive">
                                    <table class="table table-sm">
                                        <thead>
                                            <tr>
                                                <th>Date</th>
                                                <th>Activity</th>
                                                <th>Details</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach($activityLogs as $log)
                                            <tr>
                                                <td>{{ $log->created_at->format('M d, Y h:i A') }}</td>
                                                <td>{{ $log->activity_type }}</td>
                                                <td>{{ $log->details }}</td>
                                            </tr>
                                            @endforeach
                                        </tbody>
                                    </table>
                                </div>
                                {{ $activityLogs->links() }}
                            @else
                                <p class="text-muted mb-0">No activity logs found.</p>
                            @endif
                        </div>
                        <div class="tab-pane fade" id="payments">
                            @if($payments->count())
                                <div class="table-responsive">
                                    <table class="table table-sm">
                                        <thead>
                                            <tr>
                                                <th>Date</th>
                                                <th>Amount</th>
                                                <th>Method</th>
                                                <th>Status</th>
                                                <th>Invoice</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach($payments as $payment)
                                            <tr>
                                                <td>{{ $payment->created_at->format('M d, Y') }}</td>
                                                <td>${{ number_format($payment->amount, 2) }}</td>
                                                <td>{{ $payment->payment_method }}</td>
                                                <td>
                                                    <span class="badge bg-{{ $payment->status === 'completed' ? 'success' : ($payment->status === 'pending' ? 'warning' : 'danger') }}">
                                                        {{ ucfirst($payment->status) }}
                                                    </span>
                                                </td>
                                                <td>
                                                    <a href="#" class="btn btn-sm btn-outline-primary">
                                                        <i class="fas fa-file-invoice"></i>
                                                    </a>
                                                </td>
                                            </tr>
                                            @endforeach
                                        </tbody>
                                    </table>
                                </div>
                                {{ $payments->links() }}
                            @else
                                <p class="text-muted mb-0">No payment history found.</p>
                            @endif
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection