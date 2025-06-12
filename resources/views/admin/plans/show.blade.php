@extends('layouts.app')

@section('content')
<div class="container py-4">
    <div class="row justify-content-center">
        <div class="col-lg-10">

            {{-- Plan Header --}}
            <div class="d-flex justify-content-between align-items-center mb-4">
                <div>
                    <h2 class="fw-bold text-primary mb-0">{{ $plan->name }}</h2>
                    <div class="d-flex align-items-center mt-2">
                        <span class="badge bg-{{ $plan->status === 'active' ? 'success' : 'secondary' }} me-2">
                            {{ ucfirst($plan->status) }}
                        </span>
                        <small class="text-muted">Created: {{ $plan->created_at->format('M d, Y') }}</small>
                    </div>
                </div>
                <div>
                    <a href="{{ route('admin.plans.edit', $plan->id) }}" class="btn btn-primary me-2">
                        <i class="fas fa-edit me-1"></i> Edit Plan
                    </a>
                    <a href="{{ route('admin.plans.index') }}" class="btn btn-outline-secondary">
                        <i class="fas fa-arrow-left me-1"></i> Back to Plans
                    </a>
                </div>
            </div>

            {{-- Pricing Card --}}
            <div class="card shadow-sm border-0 mb-4">
                <div class="card-body">
                    <h5 class="fw-semibold mb-3">Pricing</h5>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="p-3 bg-light rounded">
                                <h6 class="fw-bold text-success">Monthly Subscription</h6>
                                <div class="d-flex align-items-baseline">
                                    <span class="h4 fw-bold">${{ number_format($plan->monthly_price, 2) }}</span>
                                    <span class="ms-1 text-muted">/month</span>
                                </div>
                                <small class="text-muted">Billed every month</small>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="p-3 bg-light rounded">
                                <h6 class="fw-bold text-success">Annual Subscription</h6>
                                <div class="d-flex align-items-baseline">
                                    <span class="h4 fw-bold">${{ number_format($plan->annual_price, 2) }}</span>
                                    <span class="ms-1 text-muted">/year</span>
                                </div>
                                <small class="text-muted">Save {{ number_format(100 - ($plan->annual_price / ($plan->monthly_price * 12)) * 100, 0) }}% compared to monthly</small>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            {{-- Gyms Card --}}
            <div class="card shadow-sm border-0 mb-4">
                <div class="card-header bg-white d-flex justify-content-between align-items-center">
                    <h5 class="mb-0 fw-bold">Associated Gyms ({{ $plan->gyms->count() }})</h5>
                    <a href="{{ route('admin.plans.edit', $plan->id) }}" class="btn btn-sm btn-primary">
                        <i class="fas fa-edit me-1"></i> Manage Gyms
                    </a>
                </div>
                <div class="card-body">
                    @if($plan->gyms->count() > 0)
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>Gym Name</th>
                                        <th>Location</th>
                                        <th>Status</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach($plan->gyms as $gym)
                                        <tr>
                                            <td>
                                                <a href="{{ route('admin.gyms.show', $gym->id) }}" class="text-decoration-none">
                                                    {{ $gym->name }}
                                                </a>
                                            </td>
                                            <td>{{ $gym->location ?? 'N/A' }}</td>
                                            <td>
                                                <span class="badge bg-{{ $gym->status === 'active' ? 'success' : 'secondary' }}">
                                                    {{ ucfirst($gym->status) }}
                                                </span>
                                            </td>
                                            <td>
                                                <a href="{{ route('admin.gyms.show', $gym->id) }}" class="btn btn-sm btn-outline-info">
                                                    <i class="fas fa-eye"></i> View
                                                </a>
                                            </td>
                                        </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </div>
                    @else
                        <div class="text-center py-3">
                            <i class="fas fa-dumbbell fa-3x text-secondary mb-3"></i>
                            <p class="text-muted">No gyms associated with this plan.</p>
                            <a href="{{ route('admin.plans.edit', $plan->id) }}" class="btn btn-primary">
                                <i class="fas fa-plus me-1"></i> Add Gyms
                            </a>
                        </div>
                    @endif
                </div>
            </div>

            {{-- Features Card --}}
            <div class="card shadow-sm border-0">
                <div class="card-header bg-white d-flex justify-content-between align-items-center">
                    <h5 class="mb-0 fw-bold">Plan Features ({{ $features->count() }})</h5>
                    <button type="button" class="btn btn-sm btn-primary" data-bs-toggle="modal" data-bs-target="#addFeatureModal">
                        <i class="fas fa-plus me-1"></i> Add Feature
                    </button>
                </div>
                <div class="card-body">
                    @if($features->count() > 0)
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>Feature</th>
                                        <th>Description</th>
                                        <th>Limit</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach($features as $feature)
                                        <tr>
                                            <td class="fw-semibold">{{ $feature->name }}</td>
                                            <td>{{ $feature->description ?: 'N/A' }}</td>
                                            <td>{{ $feature->limit ?: 'Unlimited' }}</td>
                                            <td>
                                                <form action="{{ route('admin.plans.features.destroy', [$plan->id, $feature->id]) }}" method="POST" class="d-inline">
                                                    @csrf
                                                    @method('DELETE')
                                                    <button type="submit" class="btn btn-sm btn-outline-danger" onclick="return confirm('Are you sure?')">
                                                        <i class="fas fa-trash-alt"></i> Delete
                                                    </button>
                                                </form>
                                            </td>
                                        </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </div>
                    @else
                        <div class="text-center py-3">
                            <i class="fas fa-list-alt fa-3x text-secondary mb-3"></i>
                            <p class="text-muted">No features added to this plan yet.</p>
                        </div>
                    @endif
                </div>
            </div>

        </div>
    </div>
</div>

<!-- Add Feature Modal -->
<div class="modal fade" id="addFeatureModal" tabindex="-1" aria-labelledby="addFeatureModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="{{ route('admin.plans.features.store', $plan->id) }}" method="POST">
                @csrf
                <div class="modal-header">
                    <h5 class="modal-title" id="addFeatureModalLabel">Add New Feature</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="mb-3">
                        <label for="featureName" class="form-label">Feature Name</label>
                        <input type="text" class="form-control" id="featureName" name="name" required>
                    </div>
                    <div class="mb-3">
                        <label for="featureDescription" class="form-label">Description</label>
                        <textarea class="form-control" id="featureDescription" name="description" rows="3"></textarea>
                    </div>
                    <div class="mb-3">
                        <label for="featureLimit" class="form-label">Limit</label>
                        <input type="number" class="form-control" id="featureLimit" name="limit" min="1">
                        <small class="text-muted">Leave empty for unlimited</small>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-primary">Add Feature</button>
                </div>
            </form>
        </div>
    </div>
</div>

@endsection