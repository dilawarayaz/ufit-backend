@extends('layouts.app')

@section('content')
<div class="container py-4">
    <div class="row justify-content-center">
        <div class="col-lg-10">
            <div class="card shadow-sm border-0">
                <div class="card-header bg-white d-flex justify-content-between align-items-center">
                    <h5 class="mb-0 fw-bold">Edit Subscription Plan</h5>
                    <a href="{{ route('admin.plans.index') }}" class="btn btn-sm btn-outline-secondary">
                        <i class="fas fa-arrow-left me-1"></i> Back to Plans
                    </a>
                </div>

                <div class="card-body">
                    <form method="POST" action="{{ route('admin.plans.update', $plan->id) }}">
                        @csrf
                        @method('PUT')

                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label for="name" class="form-label">Plan Name</label>
                                <input type="text" class="form-control" id="name" name="name" 
                                    value="{{ old('name', $plan->name) }}" required>
                            </div>
                            <div class="col-md-3">
                                <label for="monthly_price" class="form-label">Monthly Price</label>
                                <input type="number" step="0.01" class="form-control" id="monthly_price" 
                                    name="monthly_price" value="{{ old('monthly_price', $plan->monthly_price) }}" required>
                            </div>
                            <div class="col-md-3">
                                <label for="annual_price" class="form-label">Annual Price</label>
                                <input type="number" step="0.01" class="form-control" id="annual_price" 
                                    name="annual_price" value="{{ old('annual_price', $plan->annual_price) }}" required>
                            </div>
                        </div>

                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label for="status" class="form-label">Status</label>
                                <select class="form-select" id="status" name="status" required>
                                    <option value="active" {{ old('status', $plan->status) == 'active' ? 'selected' : '' }}>Active</option>
                                    <option value="inactive" {{ old('status', $plan->status) == 'inactive' ? 'selected' : '' }}>Inactive</option>
                                </select>
                            </div>
                        </div>

                        <div class="mb-4">
                            <label for="gyms" class="form-label">Select Gyms</label>
                            <select class="form-select" id="gyms" name="gyms[]" multiple>
                                @foreach($gyms as $gym)
                                    <option value="{{ $gym->id }}" 
                                        {{ in_array($gym->id, old('gyms', $selectedGyms)) ? 'selected' : '' }}>
                                        {{ $gym->name }}
                                    </option>
                                @endforeach
                            </select>
                            <small class="form-text text-muted">Hold Ctrl (Windows) or Command (Mac) to select multiple gyms.</small>
                        </div>

                        <!-- Plan Features -->
                        <div class="mb-4">
                            <h5>Plan Features</h5>
                            <div id="features-container">
                                @foreach($features as $index => $feature)
                                <div class="feature-item mb-3 p-3 border rounded">
                                    <div class="row">
                                        <div class="col-md-4">
                                            <label class="form-label">Feature Name</label>
                                            <input type="text" class="form-control" 
                                                name="features[{{ $index }}][name]" 
                                                value="{{ old("features.$index.name", $feature->name) }}" required>
                                            <input type="hidden" name="features[{{ $index }}][id]" value="{{ $feature->id }}">
                                        </div>
                                        <div class="col-md-4">
                                            <label class="form-label">Description</label>
                                            <input type="text" class="form-control" 
                                                name="features[{{ $index }}][description]" 
                                                value="{{ old("features.$index.description", $feature->description) }}">
                                        </div>
                                        <div class="col-md-3">
                                            <label class="form-label">Limit</label>
                                            <input type="number" class="form-control" 
                                                name="features[{{ $index }}][limit]" 
                                                value="{{ old("features.$index.limit", $feature->limit) }}" min="1">
                                        </div>
                                        <div class="col-md-1 d-flex align-items-end">
                                            <button type="button" class="btn btn-sm btn-danger remove-feature">
                                                <i class="fas fa-trash"></i>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                                @endforeach
                            </div>
                            <button type="button" class="btn btn-sm btn-secondary mt-2" id="add-feature">
                                <i class="fas fa-plus"></i> Add Feature
                            </button>
                        </div>

                        <div class="d-flex justify-content-between">
                            <button type="submit" class="btn btn-primary">Update Plan</button>
                            <a href="{{ route('admin.plans.index') }}" class="btn btn-secondary">Cancel</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- JavaScript for Features -->
<script>
document.addEventListener('DOMContentLoaded', function () {
    const featuresContainer = document.getElementById('features-container');
    const addFeatureBtn = document.getElementById('add-feature');
    let featureCount = {{ $features->count() }};

    addFeatureBtn.addEventListener('click', function () {
        const featureDiv = document.createElement('div');
        featureDiv.className = 'feature-item mb-3 p-3 border rounded';
        featureDiv.innerHTML = `
            <div class="row">
                <div class="col-md-4">
                    <label class="form-label">Feature Name</label>
                    <input type="text" class="form-control" name="features[${featureCount}][name]" required>
                </div>
                <div class="col-md-4">
                    <label class="form-label">Description</label>
                    <input type="text" class="form-control" name="features[${featureCount}][description]">
                </div>
                <div class="col-md-3">
                    <label class="form-label">Limit</label>
                    <input type="number" class="form-control" name="features[${featureCount}][limit]" min="1">
                </div>
                <div class="col-md-1 d-flex align-items-end">
                    <button type="button" class="btn btn-sm btn-danger remove-feature">
                        <i class="fas fa-trash"></i>
                    </button>
                </div>
            </div>
        `;
        featuresContainer.appendChild(featureDiv);
        featureCount++;
    });

    featuresContainer.addEventListener('click', function (e) {
        if (e.target.classList.contains('remove-feature') || e.target.closest('.remove-feature')) {
            e.target.closest('.feature-item').remove();
        }
    });
});
</script>

<style>
.feature-item {
    background-color: #f8f9fa;
}
</style>
@endsection