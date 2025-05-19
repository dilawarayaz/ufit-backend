@extends('layouts.app')

@section('content')
<div class="container py-5">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card shadow-sm">
                <div class="card-header bg-primary text-white">
                    <h5 class="mb-0">Extend Subscription</h5>
                </div>
                <div class="card-body">
                    <div class="mb-4">
                        <h6>Subscription Details</h6>
                        <div class="row">
                            <div class="col-md-6">
                                <p><strong>User:</strong> {{ $subscription->user->first_name }} {{ $subscription->user->last_name }}</p>
                                <p><strong>Type:</strong> {{ ucfirst($subscription->subscription_type) }}</p>
                            </div>
                            <div class="col-md-6">
                                <p><strong>Current End Date:</strong> {{ \Carbon\Carbon::parse($subscription->end_date)->format('d M Y') }}</p>
                                <p><strong>Status:</strong> 
                                    <span class="badge bg-{{ $subscription->is_active ? 'success' : 'danger' }}">
                                        {{ $subscription->is_active ? 'Active' : 'Expired' }}
                                    </span>
                                </p>
                            </div>
                        </div>
                    </div>
                    
                    <form action="{{ route('admin.user-subscriptions.update', $subscription->id) }}" method="POST">
                        @csrf
                        @method('PUT')
                        
                        <div class="mb-3">
                            <label for="extension_days" class="form-label">Extension Period (Days)</label>
                            <input type="number" class="form-control" id="extension_days" name="extension_days" min="1" value="30" required>
                        </div>
                        
                        <div class="mb-3">
                            <label class="form-label">New End Date</label>
                            <div class="form-control" id="new_end_date">
                                {{ \Carbon\Carbon::parse($subscription->end_date)->addDays(30)->format('d M Y') }}
                            </div>
                        </div>
                        
                        <div class="d-flex justify-content-between">
                            <a href="{{ route('admin.user-subscriptions.index') }}" class="btn btn-secondary">
                                <i class="fas fa-arrow-left me-1"></i> Back
                            </a>
                            <button type="submit" class="btn btn-primary">
                                <i class="fas fa-calendar-plus me-1"></i> Extend Subscription
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    document.getElementById('extension_days').addEventListener('input', function() {
        const days = parseInt(this.value) || 0;
        const currentEndDate = new Date('{{ $subscription->end_date }}');
        const newEndDate = new Date(currentEndDate);
        newEndDate.setDate(currentEndDate.getDate() + days);
        
        document.getElementById('new_end_date').textContent = 
            newEndDate.toLocaleDateString('en-US', { day: 'numeric', month: 'short', year: 'numeric' });
    });
</script>
@endsection