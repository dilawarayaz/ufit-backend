@extends('layouts.app')

@section('content')
<div class="container py-4">
    <div class="row justify-content-center">
        <div class="col-lg-10">

            {{-- Plan Header --}}
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h2 class="fw-bold text-primary mb-0">{{ $plan->name }}</h2>
                <a href="{{ route('admin.plans.index') }}" class="btn btn-outline-secondary">
                    <i class="fas fa-arrow-left me-1"></i> Back to Plans
                </a>
            </div>

            {{-- Description Card --}}
            <div class="card shadow-sm border-0 mb-4">
                <div class="card-body">
                    <h5 class="fw-semibold mb-2">Description</h5>
                    <p class="mb-0 text-muted">{{ $plan->description ?? 'No description provided.' }}</p>
                </div>
            </div>

            {{-- Features Card --}}
            <div class="card shadow-sm border-0">
                <div class="card-header bg-white">
                    <h5 class="mb-0 fw-bold">Plan Features</h5>
                </div>
                <div class="card-body">

                    @if($features->count() > 0)
                        <div class="list-group">
                            @foreach($features as $feature)
                                <div class="list-group-item d-flex justify-content-between align-items-start flex-wrap">
                                    <div class="me-3">
                                        <h6 class="fw-semibold mb-1">{{ $feature->name }}</h6>
                                        <p class="mb-1 text-muted">{{ $feature->description ?: 'No description.' }}</p>
                                        <small class="text-secondary">Limit: {{ $feature->limit ?? 'N/A' }}</small>
                                    </div>
                                    <form 
                                        action="{{ route('admin.plans.features.destroy', [$plan->id, $feature->id]) }}" 
                                        method="POST" 
                                        onsubmit="return confirm('Are you sure you want to delete this feature?');">
                                        @csrf
                                        @method('DELETE')
                                        <button type="submit" class="btn btn-sm btn-outline-danger">
                                            <i class="fas fa-trash-alt"></i> Delete
                                        </button>
                                    </form>
                                </div>
                            @endforeach
                        </div>
                    @else
                        <p class="text-muted mb-0">No features found for this plan.</p>
                    @endif

                </div>
            </div>

        </div>
    </div>
</div>
@endsection
