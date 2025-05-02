@extends('layouts.app')

@section('content')
<style>
    .gym-card {
        background: #fff;
        border-radius: 16px;
        box-shadow: 0 8px 24px rgba(0, 0, 0, 0.05);
        padding: 2rem;
        margin-top: 2rem;
    }

    .gym-card h4 {
        font-weight: 600;
        color: #2c3e50;
        margin-bottom: 1.5rem;
    }

    .table thead th {
        background-color: #f8f9fa;
        color: #495057;
        font-weight: 600;
        vertical-align: middle;
    }

    .table tbody tr:hover {
        background-color: #f1f1f1;
    }

    .btn-sm {
        padding: 0.375rem 0.75rem;
        font-size: 0.85rem;
        border-radius: 8px;
    }

    .btn-primary {
        background-color: #3498db;
        border: none;
    }

    .btn-primary:hover {
        background-color: #2980b9;
    }

    .btn-danger {
        background-color: #e74c3c;
        border: none;
    }

    .btn-danger:hover {
        background-color: #c0392b;
    }

    .pagination {
        margin-top: 1rem;
        justify-content: center;
    }

    .table-responsive {
        overflow-x: auto;
    }

    @media (max-width: 768px) {
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
            border-bottom: 1px solid #dee2e6;
            margin-bottom: 1rem;
        }
    }
</style>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-12">
            <div class="gym-card">
                <h4>All Registered Gyms</h4>

                @if($gyms->count())
                    <div class="table-responsive">
                        <table class="table align-middle">
                            <thead>
                                <tr>
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
                                        <td data-label="Name">{{ $gym->name }}</td>
                                        <td data-label="Address">{{ $gym->address }}</td>
                                        <td data-label="Phone">{{ $gym->phone }}</td>
                                        <td data-label="Email">{{ $gym->email }}</td>
                                        <td data-label="Opening">{{ $gym->opening_time }}</td>
                                        <td data-label="Closing">{{ $gym->closing_time }}</td>
                                        <td class="text-center" data-label="Actions">
                                            <a href="{{ route('admin.gyms.edit', $gym->id) }}" class="btn btn-primary btn-sm me-1">Edit</a>
                                            <form action="{{ route('admin.gyms.destroy', $gym->id) }}" method="POST" style="display:inline;">
                                                @csrf
                                                @method('DELETE')
                                                <button type="submit" class="btn btn-danger btn-sm"
                                                    onclick="return confirm('Are you sure you want to delete this gym?');">
                                                    Delete
                                                </button>
                                            </form>
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>

                    <!-- Pagination Links -->
                    <div class="d-flex justify-content-center">
                        {{ $gyms->links() }}
                    </div>
                @else
                    <p class="text-muted">No gyms found.</p>
                @endif
            </div>
        </div>
    </div>
</div>
@endsection
