@extends('layouts.app') {{-- Use your layout if you have one --}}

@section('content')
<div class="container py-4">
    <h2 class="mb-4 text-center">Users List</h2>

    @if($users->count())
        <div class="table-responsive">
            <table class="table table-bordered table-hover shadow-sm">
                <thead class="table-dark">
                    <tr>
                        <th>#</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Role</th>
                        <th>Subscription Plan</th>
                        <th>Joined At</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($users as $index => $user)
                        <tr>
                            <td>{{ $users->firstItem() + $index }}</td>
                            <td>{{ $user->first_name.' '.$user->last_name }}</td>
                            <td>{{ $user->email }}</td>
                            <td>{{ $user->role->name ?? 'N/A' }}</td>
                            <td>{{ $user->subscriptions->first()->name ?? 'No Plan' }}</td>
                            <td>{{ $user->created_at->format('d M Y') }}</td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
        </div>

        <div class="d-flex justify-content-center mt-3">
            {{ $users->links() }}
        </div>
    @else
        <div class="alert alert-warning text-center">
            No users found.
        </div>
    @endif
</div>
@endsection
