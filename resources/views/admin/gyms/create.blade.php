@extends('layouts.app')

@section('content')
<style>
    .form-section {
        background-color: #fff;
        border-radius: 16px;
        box-shadow: 0 8px 24px rgba(0, 0, 0, 0.05);
        padding: 2rem;
    }

    .form-section h4 {
        font-weight: 600;
        margin-bottom: 1.5rem;
        color: #2c3e50;
    }

    .form-label {
        font-weight: 500;
        color: #34495e;
    }

    .form-control {
        border-radius: 10px;
        padding: 0.75rem;
        font-size: 0.95rem;
        transition: border-color 0.3s, box-shadow 0.3s;
    }

    .form-control:focus {
        border-color: #3498db;
        box-shadow: 0 0 0 0.2rem rgba(52, 152, 219, 0.25);
    }

    .btn-success {
        background-color: #27ae60;
        border: none;
        font-weight: 500;
        transition: background-color 0.3s ease;
    }

    .btn-success:hover {
        background-color: #219150;
    }

    .alert-danger {
        border-radius: 10px;
    }

    textarea.form-control {
        resize: none;
    }
</style>

<div class="container py-5">
    <div class="row justify-content-center">
        <div class="col-lg-8">
            <div class="form-section">
                <h4>Create a New Gym</h4>

                {{-- Display Errors --}}
                @if($errors->any())
                    <div class="alert alert-danger">
                        <ul class="mb-0">
                            @foreach ($errors->all() as $error)
                                <li>{{ $error }}</li>
                            @endforeach
                        </ul>
                    </div>
                @endif

                {{-- Form Start --}}
                <form method="POST" action="{{ route('admin.gyms.store') }}">
                    @csrf

                    <div class="mb-3">
                        <label for="name" class="form-label">Gym Name <span class="text-danger">*</span></label>
                        <input type="text" class="form-control" id="name" name="name" value="{{ old('name') }}" required>
                    </div>

                    <div class="mb-3">
                        <label for="address" class="form-label">Gym Address <span class="text-danger">*</span></label>
                        <input type="text" class="form-control" id="address" name="address" value="{{ old('address') }}" required>
                    </div>

                    <div class="mb-3">
                        <label for="phone" class="form-label">Phone <span class="text-danger">*</span></label>
                        <input type="text" class="form-control" id="phone" name="phone" value="{{ old('phone') }}" required>
                    </div>

                    <div class="mb-3">
                        <label for="email" class="form-label">Email <span class="text-danger">*</span></label>
                        <input type="email" class="form-control" id="email" name="email" value="{{ old('email') }}" required>
                    </div>

                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label for="opening_time" class="form-label">Opening Time <span class="text-danger">*</span></label>
                            <input type="time" class="form-control" id="opening_time" name="opening_time" value="{{ old('opening_time') }}" required>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label for="closing_time" class="form-label">Closing Time <span class="text-danger">*</span></label>
                            <input type="time" class="form-control" id="closing_time" name="closing_time" value="{{ old('closing_time') }}" required>
                        </div>
                    </div>

                    <div class="mb-3">
                        <label for="description" class="form-label">Description</label>
                        <textarea class="form-control" id="description" name="description" rows="4">{{ old('description') }}</textarea>
                    </div>

                    <div class="text-end">
                        <button type="submit" class="btn btn-success px-4 py-2 rounded-3">Create Gym</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
@endsection
