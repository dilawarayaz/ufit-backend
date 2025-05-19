@extends('layouts.app')

@section('content')
<div class="container">
    <h1>Gym Management</h1>
    
    <div class="mb-4">
        <a href="{{ route('admin.gyms.create') }}" class="btn btn-primary">Add New Gym</a>
        <a href="{{ route('admin.gyms.pending') }}" class="btn btn-warning">Pending Applications</a>
    </div>

    <div class="card">
        <div class="card-body">
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Location</th>
                        <th>Status</th>
                        <th>Rating</th>
                        <th>Visits</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($gyms as $gym)
                    <tr>
                        <td>{{ $gym->name }}</td>
                        <td>{{ Str::limit($gym->address, 30) }}</td>
                        <td>
                            <span class="badge bg-{{ $gym->status === 'approved' ? 'success' : ($gym->status === 'pending' ? 'warning' : 'danger') }}">
                                {{ ucfirst($gym->status) }}
                            </span>
                        </td>
                        <td>{{ number_format($gym->reviews_avg_rating, 1) }} ★ ({{ $gym->reviews_count }})</td>
                        <td>{{ $gym->visits_count }}</td>
                        <td>
                            <a href="{{ route('admin.gyms.show', $gym->id) }}" class="btn btn-sm btn-info">View</a>
                            <a href="{{ route('admin.gyms.edit', $gym->id) }}" class="btn btn-sm btn-primary">Edit</a>
                            <!-- Add delete button with confirmation -->
                        </td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
           @if ($gyms->lastPage() > 1)
    <nav>
        <ul class="pagination justify-content-center">
            <li class="page-item {{ $gyms->onFirstPage() ? 'disabled' : '' }}">
                <a class="page-link" href="{{ $gyms->previousPageUrl() }}" tabindex="-1">Previous</a>
            </li>

            @for ($i = 1; $i <= $gyms->lastPage(); $i++)
                <li class="page-item {{ $gyms->currentPage() == $i ? 'active' : '' }}">
                    <a class="page-link" href="{{ $gyms->url($i) }}">{{ $i }}</a>
                </li>
            @endfor

            <li class="page-item {{ !$gyms->hasMorePages() ? 'disabled' : '' }}">
                <a class="page-link" href="{{ $gyms->nextPageUrl() }}">Next</a>
            </li>
        </ul>
    </nav>
@endif

        </div>
    </div>
</div>
@endsection