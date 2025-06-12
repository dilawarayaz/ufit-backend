@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-10">
            <div class="card">
                <div class="card-header">Create New Subscription Plan</div>

                <div class="card-body">
                    <form method="POST" action="{{ route('admin.plans.store') }}">
                        @csrf

                        <div class="mb-3">
                            <label for="name" class="form-label">Plan Name</label>
                            <input type="text" class="form-control" id="name" name="name" required>
                        </div>

                        <div class="mb-3">
                            <label for="type" class="form-label">Plan Type</label>
                            <select class="form-select" id="type" name="type" required>
                                <option value="basic">Basic</option>
                                <option value="premium">Premium</option>
                                <option value="standard">Standard</option>
                                <option value="startup">Startup</option>
                            </select>
                        </div>

                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label for="monthly_price" class="form-label">Monthly Price</label>
                                <input type="number" step="0.01" class="form-control" id="monthly_price" name="monthly_price" required>
                            </div>
                            <!-- <div class="col-md-6">
                                <label for="annual_price" class="form-label">Annual Price</label>
                                <input type="number" step="0.01" class="form-control" id="annual_price" name="annual_price">
                            </div> -->
                        </div>

                        <div class="mb-3">
                            <label for="status" class="form-label">Status</label>
                            <select class="form-select" id="status" name="status" required>
                                <option value="active">Active</option>
                                <option value="inactive">Inactive</option>
                            </select>
                        </div>

                        <!-- Gym Selection -->
                        <div class="mb-4">
                            <label for="gyms" class="form-label">Select Gyms</label>
                            <select class="form-select" id="gyms" name="gyms[]" multiple>
                                @foreach($gyms as $gym)
                                    <option value="{{ $gym->id }}">{{ $gym->name }}</option>
                                @endforeach
                            </select>
                            <small class="form-text text-muted">Hold Ctrl (Windows) or Command (Mac) to select multiple gyms.</small>
                        </div>

                        <!-- Plan Features -->
                        <div class="mb-4">
                            <h5>Plan Features</h5>
                            <div id="features-container">
                                <!-- Initial feature field -->
                                <div class="feature-item mb-3 p-3 border rounded">
                                    <div class="row">
                                        <div class="col-md-4">
                                            <label class="form-label">Feature Name</label>
                                            <input type="text" class="form-control" name="features[0][name]" required>
                                        </div>
                                        <div class="col-md-4">
                                            <label class="form-label">Description</label>
                                            <input type="text" class="form-control" name="features[0][description]">
                                        </div>
                                        <div class="col-md-3">
                                            <label class="form-label">Limit</label>
                                            <input type="number" class="form-control" name="features[0][limit]" min="1">
                                        </div>
                                        <div class="col-md-1 d-flex align-items-end">
                                            <button type="button" class="btn btn-sm btn-danger remove-feature">
                                                <i class="fas fa-trash"></i>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <button type="button" class="btn btn-sm btn-secondary mt-2" id="add-feature">
                                <i class="fas fa-plus"></i> Add Feature
                            </button>
                        </div>

                        <div class="d-flex justify-content-between">
                            <button type="submit" class="btn btn-primary">Create Plan</button>
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
    let featureCount = 1; // Start from 1 since we have one initial feature

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