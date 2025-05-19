@extends('layouts.app')

@section('title', 'Gym Details')

@section('content')
<div class="container py-4">
    <h2 class="mb-4">Gym Details</h2>

    <div class="card shadow-sm">
        <div class="card-header">
            <h5 class="mb-0">{{ $gym->name }}</h5>
        </div>
        <div class="card-body row">
            <div class="col-md-4">
                @if($gym->image_path)
                    <img src="{{ asset('storage/' . $gym->image_path) }}" class="img-fluid rounded" alt="Gym Image">
                @else
                    <img src="https://via.placeholder.com/300x200?text=No+Image" class="img-fluid rounded" alt="No Image">
                @endif
            </div>
            <div class="col-md-8">
                <p><strong>Address:</strong> {{ $gym->address }}</p>
                <p><strong>Phone:</strong> {{ $gym->phone }}</p>
                <p><strong>Email:</strong> {{ $gym->email }}</p>
                <p><strong>Opening Time:</strong> {{ $gym->opening_time }}</p>
                <p><strong>Closing Time:</strong> {{ $gym->closing_time }}</p>
                <p><strong>Commission Rate:</strong> {{ $gym->commission_rate }}%</p>
                <p><strong>Status:</strong> 
                    <span class="badge 
                        @if($gym->status == 'approved') bg-success 
                        @elseif($gym->status == 'pending') bg-warning 
                        @else bg-danger 
                        @endif">
                        {{ ucfirst($gym->status) }}
                    </span>
                </p>
                <p><strong>Facilities:</strong> 
                    @foreach(json_decode($gym->facilities, true) ?? [] as $facility)
                        <span class="badge bg-primary me-1">{{ $facility }}</span>
                    @endforeach
                </p>
                <p><strong>Description:</strong><br>{{ $gym->description }}</p>
                <p><strong>Latitude:</strong> {{ $gym->latitude ?? 'N/A' }}</p>
                <p><strong>Longitude:</strong> {{ $gym->longitude ?? 'N/A' }}</p>
            </div>
        </div>
    </div>

    <div class="mt-4">
        <h4>Reviews Summary</h4>
        <p><strong>Total Reviews:</strong> {{ $gym->reviews_count }}</p>
        <p><strong>Average Rating:</strong> {{ number_format($gym->reviews_avg_rating, 1) }}/5</p>
    </div>

    <div class="mt-4">
        <h4>Visit Stats</h4>
        <p><strong>Total Visits:</strong> {{ $gym->visits_count }}</p>
    </div>

    <a href="{{ route('admin.gyms.edit', $gym->id) }}" class="btn btn-warning mt-3">Edit Gym</a>
    <form action="{{ route('admin.gyms.destroy', $gym->id) }}" method="POST" class="d-inline">
        @csrf
        @method('DELETE')
        <button type="submit" onclick="return confirm('Are you sure?')" class="btn btn-danger mt-3">Delete</button>
    </form>
</div>
@endsection
