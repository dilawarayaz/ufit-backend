@extends('layouts.app')

@section('content')
<div class="container">
    <h1>Add New Gym</h1>

    @if($errors->any())
    <div class="alert alert-danger">
        <ul>
            @foreach($errors->all() as $error)
            <li>{{ $error }}</li>
            @endforeach
        </ul>
    </div>
    @endif

    <form action="{{ route('admin.gyms.store') }}" method="POST" enctype="multipart/form-data">
        @csrf

        <div class="row">
            {{-- Owner Information --}}
            <div class="col-12">
                <div class="card mb-4">
                    <div class="card-header">Gym Owner Information</div>
                    <div class="card-body">
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label for="first_name" class="form-label">First Name</label>
                                <input type="text" class="form-control" id="first_name" name="first_name" required value="{{ old('first_name') }}">
                            </div>
                            <div class="col-md-6">
                                <label for="last_name" class="form-label">Last Name</label>
                                <input type="text" class="form-control" id="last_name" name="last_name" required value="{{ old('last_name') }}">
                            </div>
                        </div>

                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label for="email" class="form-label">Email</label>
                                <input type="email" class="form-control" id="email" name="email" required value="{{ old('email') }}">
                            </div>
                            <div class="col-md-6">
                                <label for="phone_number" class="form-label">Phone Number</label>
                                <input type="text" class="form-control" id="phone_number" name="phone_number" required value="{{ old('phone_number') }}">
                            </div>
                        </div>

                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label for="password" class="form-label">Password</label>
                                <input type="password" class="form-control" id="password" name="password" required>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card mb-4">
                    <div class="card-header">Basic Information</div>
                    <div class="card-body">

                        <div class="mb-3">
                            <label class="form-label">Gym Name *</label>
                            <input type="text" class="form-control" name="name" value="{{ old('name') }}" required>
                            @error('name') <div class="text-danger">{{ $message }}</div> @enderror
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Region *</label>
                            <select class="form-select" name="region_id" required>
                                <option value="">Select Region</option>
                                <option value="1" {{ old('region_id') == '1' ? 'selected' : '' }}>North</option>
                                <option value="2" {{ old('region_id') == '2' ? 'selected' : '' }}>South</option>
                                <option value="3" {{ old('region_id') == '3' ? 'selected' : '' }}>East</option>
                                <option value="4" {{ old('region_id') == '4' ? 'selected' : '' }}>West</option>
                                <option value="central" {{ old('region_id') == 'central' ? 'selected' : '' }}>Central</option>
                            </select>
                            @error('region_id') <div class="text-danger">{{ $message }}</div> @enderror
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Address *</label>
                            <textarea class="form-control" name="address" rows="3" required>{{ old('address') }}</textarea>
                            @error('address') <div class="text-danger">{{ $message }}</div> @enderror
                        </div>

                        <div class="row">
                            <!-- <div class="col-md-6">
                                <div class="mb-3">
                                    <label class="form-label">Phone *</label>
                                    <input type="text" class="form-control" name="phone" value="{{ old('phone') }}" required>
                                    @error('phone') <div class="text-danger">{{ $message }}</div> @enderror
                                </div>
                            </div> -->
                            <!-- <div class="col-md-6">
                                <div class="mb-3">
                                    <label class="form-label">Email *</label>
                                    <input type="email" class="form-control" name="email" value="{{ old('email') }}" required>
                                    @error('email') <div class="text-danger">{{ $message }}</div> @enderror
                                </div>
                            </div> -->
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label class="form-label">Opening Time *</label>
                                    <input type="time" class="form-control" name="opening_time" value="{{ old('opening_time') }}" required>
                                    @error('opening_time') <div class="text-danger">{{ $message }}</div> @enderror
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label class="form-label">Closing Time *</label>
                                    <input type="time" class="form-control" name="closing_time" value="{{ old('closing_time') }}" required>
                                    @error('closing_time') <div class="text-danger">{{ $message }}</div> @enderror
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

            {{-- Right Column --}}
            <div class="col-md-6">
                <div class="card mb-4">
                    <div class="card-header">Additional Information</div>
                    <div class="card-body">

                        <div class="mb-3">
                            <label class="form-label">Description</label>
                            <textarea class="form-control" name="description" rows="3">{{ old('description') }}</textarea>
                            @error('description') <div class="text-danger">{{ $message }}</div> @enderror
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Gym Image</label>
                            <input type="file" class="form-control" name="image">
                            @error('image') <div class="text-danger">{{ $message }}</div> @enderror
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Facilities</label>
                            <div id="facilities-container">
                                <div class="input-group mb-2">
                                    <input type="text" class="form-control" name="facilities[]">
                                    <button type="button" class="btn btn-danger remove-facility">×</button>
                                </div>
                            </div>
                            <button type="button" class="btn btn-sm btn-secondary" id="add-facility">+ Add Facility</button>
                            @error('facilities') <div class="text-danger">{{ $message }}</div> @enderror
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label class="form-label">Commission Rate (%) *</label>
                                    <input type="number" step="0.01" class="form-control" name="commission_rate" value="{{ old('commission_rate') }}" required>
                                    @error('commission_rate') <div class="text-danger">{{ $message }}</div> @enderror
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label class="form-label">Status *</label>
                                    <select class="form-select" name="status" required>
                                        <option value="approved" {{ old('status') == 'approved' ? 'selected' : '' }}>Approved</option>
                                        <option value="pending" {{ old('status') == 'pending' ? 'selected' : '' }}>Pending</option>
                                        <option value="rejected" {{ old('status') == 'rejected' ? 'selected' : '' }}>Rejected</option>
                                    </select>
                                    @error('status') <div class="text-danger">{{ $message }}</div> @enderror
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>

        {{-- Location Card --}}
        <div class="card mb-4">
            <div class="card-header">Location</div>
            <div class="card-body">
                <div class="row">
                    <div class="col-md-6">
                        <div class="mb-3">
                            <label class="form-label">Latitude</label>
                            <input type="number" step="0.0000001" class="form-control" name="latitude" value="{{ old('latitude') }}">
                            @error('latitude') <div class="text-danger">{{ $message }}</div> @enderror
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="mb-3">
                            <label class="form-label">Longitude</label>
                            <input type="number" step="0.0000001" class="form-control" name="longitude" value="{{ old('longitude') }}">
                            @error('longitude') <div class="text-danger">{{ $message }}</div> @enderror
                        </div>
                    </div>
                </div>
            </div>
        </div>

        {{-- Submit Buttons --}}
        <button type="submit" class="btn btn-primary">Save Gym</button>
        <a href="{{ route('admin.gyms.index') }}" class="btn btn-secondary">Cancel</a>
    </form>
</div>
@endsection

@push('scripts')
<script>
    document.getElementById('add-facility').addEventListener('click', function() {
        const container = document.getElementById('facilities-container');
        const div = document.createElement('div');
        div.className = 'input-group mb-2';
        div.innerHTML = `
        <input type="text" class="form-control" name="facilities[]">
        <button type="button" class="btn btn-danger remove-facility">×</button>
    `;
        container.appendChild(div);
    });

    document.addEventListener('click', function(e) {
        if (e.target.classList.contains('remove-facility')) {
            e.target.parentElement.remove();
        }
    });
</script>
@endpush