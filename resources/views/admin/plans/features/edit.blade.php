@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">Edit Feature for {{ $plan->name }} Plan</div>

                <div class="card-body">
                    <form method="POST" action="{{ route('admin.plans.features.update', [$plan->id, $feature->id]) }}">
                        @csrf
                        @method('PUT')

                        <div class="mb-3">
                            <label for="name" class="form-label">Feature Name</label>
                            <input type="text" class="form-control" id="name" name="name" value="{{ $feature->name }}" required>
                        </div>

                        <div class="mb-3">
                            <label for="description" class="form-label">Description</label>
                            <textarea class="form-control" id="description" name="description" rows="3">{{ $feature->description }}</textarea>
                        </div>

                        <div class="mb-3">
                            <label for="limit" class="form-label">Limit (optional)</label>
                            <input type="number" class="form-control" id="limit" name="limit" value="{{ $feature->limit }}">
                            <small class="text-muted">Leave empty for unlimited</small>
                        </div>

                        <div class="mb-3 form-check">
                            <input type="checkbox" class="form-check-input" id="enabled" name="enabled" value="1" {{ $feature->enabled ? 'checked' : '' }}>
                            <label class="form-check-label" for="enabled">Enabled</label>
                        </div>

                        <button type="submit" class="btn btn-primary">Update Feature</button>
                        <a href="{{ route('admin.plans.show', $plan->id) }}" class="btn btn-secondary">Cancel</a>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection