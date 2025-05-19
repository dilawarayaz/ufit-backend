@extends('admin.layouts.app')

@section('content')
<div class="container">
    <h1>Equipment for {{ $gym->name }}</h1>
    
    <a href="{{ route('admin.gyms.equipment.create', $gym->id) }}" class="btn btn-primary mb-3">Add New Equipment</a>
    
    <div class="card">
        <div class="card-body">
            <table class="table">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Category</th>
                        <th>Quantity</th>
                        <th>Condition</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($equipment as $item)
                    <tr>
                        <td>{{ $item->name }}</td>
                        <td>{{ $item->category }}</td>
                        <td>{{ $item->quantity }}</td>
                        <td>{{ ucfirst($item->condition) }}</td>
                        <td>
                            <a href="{{ route('admin.gyms.equipment.edit', [$gym->id, $item->id]) }}" class="btn btn-sm btn-primary">Edit</a>
                            <!-- Delete button -->
                        </td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>
</div>
@endsection