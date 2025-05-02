@extends('layouts.app')

@section('content')
<div class="container-fluid px-4">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h1 class="fw-bold">User Details</h1>
        <a href="{{ route('admin.users.index') }}" class="btn btn-outline-secondary">
            <i class="fas fa-arrow-left me-1"></i> Back to Users
        </a>
    </div>

    <div class="card border-0 shadow-sm">
        <div class="card-body">
            <div class="row">
                <div class="col-md-4 text-center">
                    <img src="https://ui-avatars.com/api/?name={{ urlencode($user->name) }}&size=200" 
                         class="rounded-circle mb-3" width="150" height="150">
                    <h3>{{ $user->name }}</h3>
                    <p class="text-muted">{{ $user->email }}</p>
                    
                    <div class="mt-4">
                        <span class="badge bg-{{ $user->is_active ? 'success' : 'danger' }}">
                            {{ $user->is_active ? 'Active' : 'Inactive' }}
                        </span>
                    </div>
                </div>
                
                <div class="col-md-8">
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <h5>Basic Information</h5>
                            <ul class="list-unstyled">
                                <li><strong>Joined:</strong> {{ $user->created_at->format('M d, Y') }}</li>
                                <li><strong>Last Updated:</strong> {{ $user->updated_at->diffForHumans() }}</li>
                                <li><strong>Email Verified:</strong> 
                                    @if($user->email_verified_at)
                                        {{ $user->email_verified_at->format('M d, Y') }}
                                    @else
                                        <span class="text-danger">Not verified</span>
                                    @endif
                                </li>
                            </ul>
                        </div>
                        
                        <div class="col-md-6">
                            <h5>Subscription</h5>
                            @if($user->subscription)
                                <ul class="list-unstyled">
                                    <li><strong>Plan:</strong> {{ $user->subscription->plan->name }}</li>
                                    <li><strong>Status:</strong> 
                                        <span class="badge bg-{{ $user->subscription->is_active ? 'success' : 'danger' }}">
                                            {{ $user->subscription->is_active ? 'Active' : 'Inactive' }}
                                        </span>
                                    </li>
                                    <li><strong>Expires:</strong> {{ $user->subscription->expires_at->format('M d, Y') }}</li>
                                </ul>
                            @else
                                <p class="text-muted">No active subscription</p>
                            @endif
                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="col-12">
                            <h5>Activity</h5>
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
                                        <!-- You can add user activities here -->
                                        <tr>
                                            <td>{{ $user->created_at->format('M d, Y') }}</td>
                                            <td>Account Created</td>
                                            <td>User registered on the platform</td>
                                        </tr>
                                        @if($user->subscription)
                                        <tr>
                                            <td>{{ $user->subscription->created_at->format('M d, Y') }}</td>
                                            <td>Subscription Started</td>
                                            <td>{{ $user->subscription->plan->name }} plan</td>
                                        </tr>
                                        @endif
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection