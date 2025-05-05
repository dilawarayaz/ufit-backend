@extends('layouts.app')

@section('content')
<style>
    /* General Styling */
    .gym-card {
        background: #fff;
        border-radius: 16px;
        box-shadow: 0 8px 24px rgba(0, 0, 0, 0.05);
        padding: 2rem;
        margin-top: 2rem;
        transition: all 0.3s ease;
    }

    .gym-card:hover {
        box-shadow: 0 12px 32px rgba(0, 0, 0, 0.1);
        transform: translateY(-4px);
    }

    .gym-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 1.5rem;
        flex-wrap: wrap;
    }

    .gym-header h4 {
        font-weight: 600;
        color: #2c3e50;
        margin: 0;
        font-size: 1.5rem;
    }

    .btn-create {
        background-color: #2ecc71;
        border: none;
        border-radius: 8px;
        padding: 0.75rem 1.5rem;
        color: white;
        font-weight: 600;
        text-transform: uppercase;
        letter-spacing: 1px;
        transition: all 0.3s ease;
    }

    .btn-create:hover {
        background-color: #27ae60;
        transform: translateY(-2px);
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    .table thead th {
        background-color: #f8f9fa;
        color: #495057;
        font-weight: 600;
        vertical-align: middle;
        text-transform: uppercase;
        letter-spacing: 0.5px;
        padding: 1rem;
    }

    .table tbody tr {
        transition: all 0.2s ease;
    }

    .table tbody tr:hover {
        background-color: #f1f1f1;
        transform: scale(1.01);
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
    }

    .btn-sm {
        padding: 0.375rem 0.75rem;
        font-size: 0.85rem;
        border-radius: 8px;
        transition: all 0.2s ease;
    }

    .btn-primary {
        background-color: #3498db;
        border: none;
    }

    .btn-primary:hover {
        background-color: #2980b9;
        transform: translateY(-1px);
    }

    .btn-danger {
        background-color: #e74c3c;
        border: none;
    }

    .btn-danger:hover {
        background-color: #c0392b;
        transform: translateY(-1px);
    }

    .action-buttons {
        display: flex;
        gap: 0.5rem;
        justify-content: center;
    }

    .pagination {
        margin-top: 1.5rem;
        justify-content: center;
    }

    .page-item.active .page-link {
        background-color: #3498db;
        border-color: #3498db;
    }

    .page-link {
        color: #3498db;
    }

    .table-responsive {
        overflow-x: auto;
        border-radius: 8px;
    }

    .no-gyms {
        text-align: center;
        padding: 2rem;
        color: #7f8c8d;
        font-size: 1.1rem;
    }

    .gym-image {
        width: 60px;
        height: 60px;
        object-fit: cover;
        border-radius: 8px;
        box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        transition: transform 0.3s ease;
    }

    .gym-image:hover {
        transform: scale(1.1);
    }

    .no-image {
        width: 60px;
        height: 60px;
        background-color: #f8f9fa;
        border-radius: 8px;
        display: flex;
        align-items: center;
        justify-content: center;
        color: #adb5bd;
        font-size: 1.5rem;
    }

    @media (max-width: 768px) {
        .gym-header {
            flex-direction: column;
            align-items: flex-start;
            gap: 1rem;
        }

        .table thead {
            display: none;
        }

        .table tbody td {
            display: block;
            width: 100%;
            text-align: right;
            position: relative;
            padding-left: 50%;
            margin-bottom: 10px;
        }

        .table tbody td::before {
            content: attr(data-label);
            position: absolute;
            left: 0;
            width: 50%;
            padding-left: 1rem;
            font-weight: bold;
            text-align: left;
            color: #6c757d;
        }

        .table tbody tr {
            border-bottom: 2px solid #dee2e6;
            margin-bottom: 1.5rem;
            display: block;
        }

        .action-buttons {
            justify-content: flex-end;
        }

        .gym-image, .no-image {
            width: 50px;
            height: 50px;
            margin-left: auto;
        }
    }
</style>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-12">
            <div class="gym-card">
                <div class="gym-header">
                    <h4>All Registered Gyms</h4>
                    <a href="{{ route('admin.gyms.create') }}" class="btn btn-create">
                        <i class="fas fa-plus"></i> Create New Gym
                    </a>
                </div>

                @if($gyms->count())
                    <div class="table-responsive">
                        <table class="table align-middle">
                            <thead>
                                <tr>
                                    <th>Image</th>
                                    <th>Name</th>
                                    <th>Address</th>
                                    <th>Phone</th>
                                    <th>Email</th>
                                    <th>Opening</th>
                                    <th>Closing</th>
                                    <th class="text-center">Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach($gyms as $gym)
                                    <tr>
                                        <td data-label="Image">
                                            @if($gym->image_path)
                                                <img src="{{ asset('storage/' . $gym->image_path) }}" alt="{{ $gym->name }}" class="gym-image">
                                            @else
                                                <div class="no-image">
                                                    <i class="fas fa-dumbbell"></i>
                                                </div>
                                            @endif
                                        </td>
                                        <td data-label="Name">{{ $gym->name }}</td>
                                        <td data-label="Address">{{ Str::limit($gym->address, 30) }}</td>
                                        <td data-label="Phone">{{ $gym->phone }}</td>
                                        <td data-label="Email">{{ Str::limit($gym->email, 20) }}</td>
                                        <td data-label="Opening">{{ \Carbon\Carbon::parse($gym->opening_time)->format('h:i A') }}</td>
                                        <td data-label="Closing">{{ \Carbon\Carbon::parse($gym->closing_time)->format('h:i A') }}</td>
                                        <td class="text-center" data-label="Actions">
                                            <div class="action-buttons">
                                                <a href="{{ route('admin.gyms.edit', $gym->id) }}" class="btn btn-primary btn-sm">
                                                    <i class="fas fa-edit"></i> Edit
                                                </a>
                                                <form action="{{ route('admin.gyms.destroy', $gym->id) }}" method="POST" style="display:inline;">
                                                    @csrf
                                                    @method('DELETE')
                                                    <button type="submit" class="btn btn-danger btn-sm"
                                                        onclick="return confirm('Are you sure you want to delete this gym?');">
                                                        <i class="fas fa-trash"></i> Delete
                                                    </button>
                                                </form>
                                            </div>
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>

                    <!-- Pagination Links -->
                    <!-- <div class="d-flex justify-content-center">
                        {{ $gyms->links() }}
                    </div> -->
                @else
                    <div class="no-gyms">
                        <i class="fas fa-dumbbell fa-3x mb-3" style="color: #ecf0f1;"></i>
                        <p>No gyms found. Create your first gym now!</p>
                        <a href="{{ route('admin.gyms.create') }}" class="btn btn-create">
                            <i class="fas fa-plus"></i> Create New Gym
                        </a>
                    </div>
                @endif
            </div>
        </div>
    </div>
</div>
@endsection
