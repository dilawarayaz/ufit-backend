@extends('layouts.app')

@section('content')
<style>
    .edit-gym-container {
        background: #fff;
        padding: 2rem;
        margin-top: 2rem;
        border-radius: 16px;
        box-shadow: 0 8px 24px rgba(0, 0, 0, 0.05);
    }

    .edit-gym-container h2 {
        font-weight: 600;
        margin-bottom: 1.5rem;
        color: #2c3e50;
    }

    .form-group {
        margin-bottom: 1.25rem;
    }

    label {
        font-weight: 600;
        margin-bottom: 0.5rem;
        display: block;
        color: #34495e;
    }

    .form-control {
        border-radius: 10px;
        padding: 0.6rem 1rem;
        font-size: 1rem;
        border: 1px solid #ced4da;
    }

    .form-control:focus {
        box-shadow: 0 0 0 3px rgba(52, 152, 219, 0.25);
        border-color: #3498db;
    }

    .invalid-feedback {
        color: #e74c3c;
        font-size: 0.9rem;
        margin-top: 0.25rem;
    }

    .btn-primary {
        background-color: #3498db;
        border: none;
        padding: 0.6rem 1.5rem;
        border-radius: 10px;
        font-weight: 500;
        transition: 0.3s;
    }

    .btn-primary:hover {
        background-color: #2980b9;
    }

    .alert-danger {
        border-radius: 10px;
        padding: 1rem;
        background-color: #f8d7da;
        color: #721c24;
        margin-bottom: 1.5rem;
    }

    @media (max-width: 768px) {
        .edit-gym-container {
            padding: 1.2rem;
        }
    }
</style>

<div class="container">
    <div class="edit-gym-container">
        <h2>Edit Gym Details</h2>

        @if ($errors->any())
            <div class="alert alert-danger">
                <strong>Whoops!</strong> There were some problems with your input.
            </div>
        @endif

        <form action="{{ route('admin.gyms.update', $gym->id) }}" method="POST">
            @csrf
            @method('PUT')

            <div class="form-group">
                <label for="name">Gym Name</label>
                <input type="text" name="name" class="form-control @error('name') is-invalid @enderror"
                    value="{{ old('name', $gym->name) }}" required>
                @error('name')<div class="invalid-feedback">{{ $message }}</div>@enderror
            </div>

            <div class="form-group">
                <label for="address">Address</label>
                <input type="text" name="address" class="form-control @error('address') is-invalid @enderror"
                    value="{{ old('address', $gym->address) }}" required>
                @error('address')<div class="invalid-feedback">{{ $message }}</div>@enderror
            </div>

            <div class="form-group">
                <label for="phone">Phone</label>
                <input type="text" name="phone" class="form-control @error('phone') is-invalid @enderror"
                    value="{{ old('phone', $gym->phone) }}" required>
                @error('phone')<div class="invalid-feedback">{{ $message }}</div>@enderror
            </div>

            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" name="email" class="form-control @error('email') is-invalid @enderror"
                    value="{{ old('email', $gym->email) }}" required>
                @error('email')<div class="invalid-feedback">{{ $message }}</div>@enderror
            </div>

            <div class="form-group">
                <label for="opening_time">Opening Time</label>
                <input type="time" name="opening_time" class="form-control @error('opening_time') is-invalid @enderror"
                    value="{{ old('opening_time', $gym->opening_time) }}" required>
                @error('opening_time')<div class="invalid-feedback">{{ $message }}</div>@enderror
            </div>

            <div class="form-group">
                <label for="closing_time">Closing Time</label>
                <input type="time" name="closing_time" class="form-control @error('closing_time') is-invalid @enderror"
                    value="{{ old('closing_time', $gym->closing_time) }}" required>
                @error('closing_time')<div class="invalid-feedback">{{ $message }}</div>@enderror
            </div>

            <div class="form-group">
                <label for="description">Description</label>
                <textarea name="description"
                          class="form-control @error('description') is-invalid @enderror"
                          rows="4"
                          placeholder="Add gym description here...">{{ old('description', $gym->description) }}</textarea>
                @error('description')<div class="invalid-feedback">{{ $message }}</div>@enderror
            </div>

            <button type="submit" class="btn btn-primary">Update Gym</button>
        </form>
    </div>
</div>
@endsection
