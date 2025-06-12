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
                                <label for="first_name" class="form-label">First Name *</label>
                                <input type="text" class="form-control" id="first_name" name="first_name" required value="{{ old('first_name') }}">
                            </div>
                            <div class="col-md-6">
                                <label for="last_name" class="form-label">Last Name *</label>
                                <input type="text" class="form-control" id="last_name" name="last_name" required value="{{ old('last_name') }}">
                            </div>
                        </div>

                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label for="email" class="form-label">Email *</label>
                                <input type="email" class="form-control" id="email" name="email" required value="{{ old('email') }}">
                            </div>
                            <div class="col-md-6">
                                <label for="phone_number" class="form-label">Phone Number *</label>
                                <input type="text" class="form-control" id="phone_number" name="phone_number" required value="{{ old('phone_number') }}">
                            </div>
                        </div>

                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label for="password" class="form-label">Password *</label>
                                <input type="password" class="form-control" id="password" name="password" required>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            {{-- Left Column --}}
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
                                @foreach($regions as $region)
                                    <option value="{{ $region->id }}" {{ old('region_id') == $region->id ? 'selected' : '' }}>{{ $region->name }}</option>
                                @endforeach
                            </select>
                            @error('region_id') <div class="text-danger">{{ $message }}</div> @enderror
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Address *</label>
                            <textarea class="form-control" name="address" rows="3" required>{{ old('address') }}</textarea>
                            @error('address') <div class="text-danger">{{ $message }}</div> @enderror
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

                        <div class="mb-3">
                            <label class="form-label">Description</label>
                            <textarea class="form-control" name="description" rows="3">{{ old('description') }}</textarea>
                            @error('description') <div class="text-danger">{{ $message }}</div> @enderror
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
                            <label class="form-label">Facilities</label>
                            <div id="facilities-container">
                                @if(old('facilities'))
                                    @foreach(old('facilities') as $facility)
                                        <div class="input-group mb-2">
                                            <input type="text" class="form-control" name="facilities[]" value="{{ $facility }}">
                                            <button type="button" class="btn btn-danger remove-facility">×</button>
                                        </div>
                                    @endforeach
                                @else
                                    <div class="input-group mb-2">
                                        <input type="text" class="form-control" name="facilities[]">
                                        <button type="button" class="btn btn-danger remove-facility">×</button>
                                    </div>
                                @endif
                            </div>
                            <button type="button" class="btn btn-sm btn-secondary" id="add-facility">+ Add Facility</button>
                            @error('facilities') <div class="text-danger">{{ $message }}</div> @enderror
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Amenities</label>
                            <div id="amenities-container">
                                @if(old('amenities'))
                                    @foreach(old('amenities') as $amenity)
                                        <div class="input-group mb-2">
                                            <input type="text" class="form-control" name="amenities[]" value="{{ $amenity }}">
                                            <button type="button" class="btn btn-danger remove-amenity">×</button>
                                        </div>
                                    @endforeach
                                @else
                                    <div class="input-group mb-2">
                                        <input type="text" class="form-control" name="amenities[]">
                                        <button type="button" class="btn btn-danger remove-amenity">×</button>
                                    </div>
                                @endif
                            </div>
                            <button type="button" class="btn btn-sm btn-secondary" id="add-amenity">+ Add Amenity</button>
                            @error('amenities') <div class="text-danger">{{ $message }}</div> @enderror
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Gym Images</label>
                            <input type="file" class="form-control" name="images[]" multiple>
                            @error('images') <div class="text-danger">{{ $message }}</div> @enderror
                            @error('images.*') <div class="text-danger">{{ $message }}</div> @enderror
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label class="form-label">Commission Rate (%) *</label>
                                    <input type="number" step="0.01" class="form-control" name="commission_rate" value="{{ old('commission_rate', 10) }}" required>
                                    @error('commission_rate') <div class="text-danger">{{ $message }}</div> @enderror
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label class="form-label">Status *</label>
                                    <select class="form-select" name="status" required>
                                        <option value="approved" {{ old('status', 'approved') == 'approved' ? 'selected' : '' }}>Approved</option>
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

        {{-- Location Card with Google Places --}}
        <div class="card mb-4">
            <div class="card-header">Location</div>
            <div class="card-body">
                <div class="mb-3">
                    <label class="form-label">Search Location</label>
                    <input id="pac-input" class="form-control" type="text" placeholder="Enter gym location">
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <div class="mb-3">
                            <label class="form-label">Latitude</label>
                            <input type="number" step="0.0000001" class="form-control" name="latitude" id="latitude" value="{{ old('latitude') }}">
                            @error('latitude') <div class="text-danger">{{ $message }}</div> @enderror
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="mb-3">
                            <label class="form-label">Longitude</label>
                            <input type="number" step="0.0000001" class="form-control" name="longitude" id="longitude" value="{{ old('longitude') }}">
                            @error('longitude') <div class="text-danger">{{ $message }}</div> @enderror
                        </div>
                    </div>
                </div>
            </div>
        </div>

        {{-- Payment Settings --}}
        <div class="card mb-4">
            <div class="card-header">Payment Settings</div>
            <div class="card-body">
                <div class="mb-3">
                    <label class="form-label">Payment Methods</label>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" name="payment_settings[cash]" id="cash" value="1" {{ old('payment_settings.cash') ? 'checked' : '' }}>
                        <label class="form-check-label" for="cash">Cash</label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" name="payment_settings[card]" id="card" value="1" {{ old('payment_settings.card') ? 'checked' : '' }}>
                        <label class="form-check-label" for="card">Credit/Debit Card</label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" name="payment_settings[online]" id="online" value="1" {{ old('payment_settings.online') ? 'checked' : '' }}>
                        <label class="form-check-label" for="online">Online Payment</label>
                    </div>
                    @error('payment_settings') <div class="text-danger">{{ $message }}</div> @enderror
                </div>
            </div>
        </div>

        {{-- Submit Buttons --}}
        <button type="submit" class="btn btn-primary">Save Gym</button>
        <a href="{{ route('admin.gyms.index') }}" class="btn btn-secondary">Cancel</a>
    </form>
</div>

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAbs5Umnu4RhdgslS73_TKDSV5wkWZnwi0&libraries=places&callback=initAutocomplete" async defer></script>

<script>
    // Facilities Add/Remove Logic
    document.getElementById('add-facility').addEventListener('click', function () {
        const container = document.getElementById('facilities-container');
        const div = document.createElement('div');
        div.className = 'input-group mb-2';
        div.innerHTML = `
            <input type="text" class="form-control" name="facilities[]">
            <button type="button" class="btn btn-danger remove-facility">×</button>
        `;
        container.appendChild(div);
    });

    // Amenities Add/Remove Logic
    document.getElementById('add-amenity').addEventListener('click', function () {
        const container = document.getElementById('amenities-container');
        const div = document.createElement('div');
        div.className = 'input-group mb-2';
        div.innerHTML = `
            <input type="text" class="form-control" name="amenities[]">
            <button type="button" class="btn btn-danger remove-amenity">×</button>
        `;
        container.appendChild(div);
    });

    // Event delegation for remove buttons
    document.addEventListener('click', function (e) {
        if (e.target.classList.contains('remove-facility')) {
            e.target.parentElement.remove();
        }
        if (e.target.classList.contains('remove-amenity')) {
            e.target.parentElement.remove();
        }
    });

    // Google Places Autocomplete
    function initAutocomplete() {
        const input = document.getElementById('pac-input');
        const searchBox = new google.maps.places.SearchBox(input);

        searchBox.addListener('places_changed', function () {
            const places = searchBox.getPlaces();

            if (places.length === 0) {
                return;
            }

            const place = places[0];

            if (!place.geometry || !place.geometry.location) {
                alert("No geometry found for selected place.");
                return;
            }

            // Fill latitude and longitude
            document.getElementById('latitude').value = place.geometry.location.lat();
            document.getElementById('longitude').value = place.geometry.location.lng();

            // Optionally fill address field
            const addressField = document.querySelector('textarea[name="address"]');
            if (!addressField.value) {
                addressField.value = place.formatted_address;
            }
        });
    }
</script>
@endsection