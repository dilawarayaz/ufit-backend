@extends('layouts.app')

@section('content')
<div class="container">
    <h1>Edit Gym: {{ $gym->name }}</h1>

    @if ($errors->any())
    <div class="alert alert-danger">
        <ul>
            @foreach ($errors->all() as $error)
            <li>{{ $error }}</li>
            @endforeach
        </ul>
    </div>
    @endif

    <form action="{{ route('admin.gyms.update', $gym->id) }}" method="POST" enctype="multipart/form-data">
        @csrf
        @method('PUT')

        <div class="row">
            <div class="col-md-6">
                <div class="card mb-4">
                    <div class="card-header">Basic Information</div>
                    <div class="card-body">
                        <div class="mb-3">
                            <label class="form-label">Gym Name *</label>
                            <input type="text" class="form-control" name="name" value="{{ old('name', $gym->name) }}" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Address *</label>
                            <input type="text" class="form-control" name="address" value="{{ old('address', $gym->address) }}" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Phone *</label>
                            <input type="text" class="form-control" name="phone" value="{{ old('phone', $gym->phone) }}" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Email *</label>
                            <input type="email" class="form-control" name="email" value="{{ old('email', $gym->email) }}" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Opening Time *</label>
                            <input type="time" class="form-control" name="opening_time" value="{{ old('opening_time', $gym->opening_time) }}" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Closing Time *</label>
                            <input type="time" class="form-control" name="closing_time" value="{{ old('closing_time', $gym->closing_time) }}" required>
                        </div>


                        <div class="mb-3">
                            <label class="form-label">Commission Rate (%) *</label>
                            <input type="number" class="form-control" name="commission_rate" value="{{ old('commission_rate', $gym->commission_rate) }}" step="0.01" min="0" max="100" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Description</label>
                            <textarea class="form-control" name="description">{{ old('description', $gym->description) }}</textarea>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Facilities</label><br>
                            @php
                            $selectedFacilities = old('facilities', is_array($gym->facilities) ? $gym->facilities : json_decode($gym->facilities, true) ?? []);
                            @endphp
                            @foreach (['Pool', 'WiFi', 'Sauna', 'Parking'] as $facility)
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="checkbox" name="facilities[]" value="{{ $facility }}"
                                    {{ in_array($facility, $selectedFacilities) ? 'checked' : '' }}>
                                <label class="form-check-label">{{ $facility }}</label>
                            </div>
                            @endforeach
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Latitude</label>
                            <input type="text" class="form-control" name="latitude" value="{{ old('latitude', $gym->latitude) }}">
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Longitude</label>
                            <input type="text" class="form-control" name="longitude" value="{{ old('longitude', $gym->longitude) }}">
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-6">
                <div class="card mb-4">
                    <div class="card-header">Current Image</div>
                    <div class="card-body">
                        @if($gym->image_path)
                        <img src="{{ asset('storage/'.$gym->image_path) }}" class="img-fluid mb-3" style="max-height: 200px;">
                        @else
                        <p>No image uploaded</p>
                        @endif
                        <div class="mb-3">
                            <label class="form-label">Change Image</label>
                            <input type="file" class="form-control" name="image">
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Payment Settings (Optional)</label>
                            <input type="text" class="form-control" name="payment_settings[bank]" placeholder="Bank Name" value="{{ old('payment_settings.bank', optional(json_decode($gym->payment_settings))->bank) }}">
                            <input type="text" class="form-control mt-2" name="payment_settings[account]" placeholder="Account Number" value="{{ old('payment_settings.account', optional(json_decode($gym->payment_settings))->account) }}">
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <button type="submit" class="btn btn-primary">Update Gym</button>
        <a href="{{ route('admin.gyms.index') }}" class="btn btn-secondary">Cancel</a>
    </form>
</div>
@endsection