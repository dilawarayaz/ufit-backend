@extends('layouts.app')

@section('content')
<div class="container py-4">
    <div class="row justify-content-center">
        <div class="col-lg-8">

            {{-- Page Title --}}
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h2 class="fw-bold text-primary">Add Feature to <span class="text-dark">{{ $plan->name }}</span></h2>
                <a href="{{ route('admin.plans.show', $plan->id) }}" class="btn btn-outline-secondary">
                    <i class="fas fa-arrow-left me-1"></i> Back
                </a>
            </div>

            {{-- Form Card --}}
            <div class="card shadow-sm border-0">
                <div class="card-body">
                    <form action="{{ route('admin.plans.features.store', $plan->id) }}" method="POST">
                        @csrf

                        {{-- Feature Name --}}
                        <div class="mb-3">
                            <label for="name" class="form-label fw-semibold">Feature Name <span class="text-danger">*</span></label>
                            <input type="text" name="name" id="name" class="form-control" placeholder="Enter feature name" required>
                        </div>

                        {{-- Description --}}
                        <div class="mb-3">
                            <label for="description" class="form-label fw-semibold">Description</label>
                            <textarea name="description" id="description" class="form-control" rows="3" placeholder="Brief description of the feature"></textarea>
                        </div>

                        {{-- Limit --}}
                        <div class="mb-4">
                            <label for="limit" class="form-label fw-semibold">Limit</label>
                            <input type="number" name="limit" id="limit" class="form-control" placeholder="Optional limit (e.g. 10)">
                        </div>

                        {{-- Submit Button --}}
                        <div class="d-grid">
                            <button type="submit" class="btn btn-success">
                                <i class="fas fa-plus me-1"></i> Add Feature
                            </button>
                        </div>
                    </form>
                </div>
            </div>

        </div>
    </div>
</div>
@endsection
