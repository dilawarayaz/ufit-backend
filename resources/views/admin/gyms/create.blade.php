@extends('layouts.app')

@section('content')
<style>
    .form-section {
        background-color: #fff;
        border-radius: 16px;
        box-shadow: 0 8px 24px rgba(0, 0, 0, 0.05);
        padding: 2.5rem;
        margin: 1rem 0;
    }

    .form-section h4 {
        font-weight: 700;
        margin-bottom: 2rem;
        color: #2c3e50;
        position: relative;
        padding-bottom: 0.75rem;
    }

    .form-section h4::after {
        content: '';
        position: absolute;
        bottom: 0;
        left: 0;
        width: 60px;
        height: 4px;
        background: linear-gradient(90deg, #3498db, #2ecc71);
        border-radius: 2px;
    }

    .form-label {
        font-weight: 600;
        color: #34495e;
        margin-bottom: 0.5rem;
        font-size: 0.95rem;
    }

    .required-asterisk {
        color: #e74c3c;
        margin-left: 3px;
    }

    .form-control {
        border-radius: 10px;
        padding: 0.75rem 1rem;
        font-size: 0.95rem;
        transition: all 0.3s ease;
        border: 1px solid #dfe6e9;
        height: auto;
    }

    .form-control:focus {
        border-color: #3498db;
        box-shadow: 0 0 0 0.2rem rgba(52, 152, 219, 0.15);
    }

    .btn-submit {
        background: linear-gradient(135deg, #2ecc71, #27ae60);
        border: none;
        font-weight: 600;
        padding: 0.75rem 2rem;
        border-radius: 10px;
        transition: all 0.3s ease;
        letter-spacing: 0.5px;
        text-transform: uppercase;
        font-size: 0.9rem;
    }

    .btn-submit:hover {
        transform: translateY(-2px);
        box-shadow: 0 4px 12px rgba(46, 204, 113, 0.3);
    }

    .image-upload-container {
        border: 2px dashed #bdc3c7;
        border-radius: 10px;
        padding: 1.5rem;
        text-align: center;
        transition: all 0.3s ease;
        margin-bottom: 1.5rem;
        background-color: #f8f9fa;
    }

    .image-upload-container:hover {
        border-color: #3498db;
        background-color: #f1f9fe;
    }

    .image-upload-label {
        display: block;
        cursor: pointer;
        color: #7f8c8d;
        font-weight: 500;
    }

    .image-upload-icon {
        font-size: 2.5rem;
        color: #3498db;
        margin-bottom: 0.75rem;
    }

    .image-preview {
        max-width: 100%;
        max-height: 200px;
        border-radius: 8px;
        margin-top: 1rem;
        display: none;
        box-shadow: 0 2px 8px rgba(0,0,0,0.1);
    }

    .time-input-group {
        display: flex;
        align-items: center;
        gap: 1rem;
    }

    .time-input-group .form-control {
        flex: 1;
    }

    @media (max-width: 768px) {
        .form-section {
            padding: 1.5rem;
        }
        
        .time-input-group {
            flex-direction: column;
            gap: 0.5rem;
        }
    }
</style>

<div class="container py-4">
    <div class="row justify-content-center">
        <div class="col-lg-8">
            <div class="form-section">
                <h4>Create New Gym Facility</h4>

                @if($errors->any())
                    <div class="alert alert-danger alert-dismissible fade show">
                        <strong>Please fix these errors:</strong>
                        <ul class="mb-0 mt-2">
                            @foreach ($errors->all() as $error)
                                <li>{{ $error }}</li>
                            @endforeach
                        </ul>
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                @endif

                <form method="POST" action="{{ route('admin.gyms.store') }}" enctype="multipart/form-data">
                    @csrf

                    <div class="mb-4">
                        <label for="name" class="form-label">Gym Name <span class="required-asterisk">*</span></label>
                        <input type="text" class="form-control" id="name" name="name" value="{{ old('name') }}" 
                               placeholder="Enter gym name" required>
                    </div>

                    <div class="mb-4">
                        <label for="address" class="form-label">Full Address <span class="required-asterisk">*</span></label>
                        <textarea class="form-control" id="address" name="address" rows="2" 
                                  placeholder="Enter complete address" required>{{ old('address') }}</textarea>
                    </div>

                    <div class="row">
                        <div class="col-md-6 mb-4">
                            <label for="phone" class="form-label">Contact Number <span class="required-asterisk">*</span></label>
                            <input type="tel" class="form-control" id="phone" name="phone" value="{{ old('phone') }}" 
                                   placeholder="e.g. +1234567890" required>
                        </div>
                        <div class="col-md-6 mb-4">
                            <label for="email" class="form-label">Email Address <span class="required-asterisk">*</span></label>
                            <input type="email" class="form-control" id="email" name="email" value="{{ old('email') }}" 
                                   placeholder="e.g. contact@gym.com" required>
                        </div>
                    </div>

                    <div class="mb-4">
                        <label class="form-label">Operating Hours <span class="required-asterisk">*</span></label>
                        <div class="time-input-group">
                            <div class="w-100">
                                <label for="opening_time" class="form-label small">Opening Time</label>
                                <input type="time" class="form-control" id="opening_time" name="opening_time" 
                                       value="{{ old('opening_time') }}" required>
                            </div>
                            <div class="w-100">
                                <label for="closing_time" class="form-label small">Closing Time</label>
                                <input type="time" class="form-control" id="closing_time" name="closing_time" 
                                       value="{{ old('closing_time') }}" required>
                            </div>
                        </div>
                    </div>

                    <div class="mb-4">
                        <label for="description" class="form-label">Facility Description</label>
                        <textarea class="form-control" id="description" name="description" rows="4" 
                                  placeholder="Describe the gym facilities, equipment, and features">{{ old('description') }}</textarea>
                    </div>

                    <div class="mb-4">
                        <label class="form-label">Gym Image</label>
                        <div class="image-upload-container">
                            <label for="image" class="image-upload-label">
                                <div class="image-upload-icon">
                                    <i class="fas fa-cloud-upload-alt"></i>
                                </div>
                                <div>Click to upload gym image</div>
                                <div class="small text-muted mt-1">(JPEG, PNG, max 2MB)</div>
                            </label>
                            <input type="file" class="d-none" id="image" name="image" accept="image/jpeg,image/png">
                            <img id="imagePreview" class="image-preview" alt="Preview">
                        </div>
                    </div>

                    <div class="d-flex justify-content-between align-items-center mt-5">
                        <a href="{{ route('admin.gyms.index') }}" class="text-decoration-none text-secondary">
                            <i class="fas fa-arrow-left me-2"></i> Back to list
                        </a>
                        <button type="submit" class="btn btn-submit">
                            <i class="fas fa-save me-2"></i> Create Gym
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    // Image preview functionality
    document.getElementById('image').addEventListener('change', function(event) {
        const file = event.target.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = function(e) {
                const preview = document.getElementById('imagePreview');
                preview.src = e.target.result;
                preview.style.display = 'block';
            }
            reader.readAsDataURL(file);
        }
    });

    // Time validation
    document.querySelector('form').addEventListener('submit', function(e) {
        const opening = document.getElementById('opening_time').value;
        const closing = document.getElementById('closing_time').value;
        
        if (opening && closing && opening >= closing) {
            alert('Closing time must be after opening time');
            e.preventDefault();
        }
    });
</script>
@endsection