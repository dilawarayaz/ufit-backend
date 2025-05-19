@extends('layouts.app')

@section('content')
<div class="container">
    <h1>Pending Gym Applications</h1>

    <div class="card">
        <div class="card-body">
            @if($pendingGyms->isEmpty())
            <p>No pending applications</p>
            @else
            <table class="table">
                <!-- Similar to index.blade.php but with approve/reject buttons -->
                @foreach($pendingGyms as $gym)
                <tr>
                    <td>{{ $gym->name }}</td>
                    <td>{{ Str::limit($gym->address, 30) }}</td>
                    <td>
                        <form action="{{ route('admin.gyms.approve', $gym->id) }}" method="POST" style="display:inline-block;">
                            @csrf
                            <button type="submit" class="btn btn-sm btn-success">Approve</button>
                        </form>

                        <form action="{{ route('admin.gyms.reject', $gym->id) }}" method="POST" style="display:inline-block;">
                            @csrf
                            <button type="submit" class="btn btn-sm btn-danger">Reject</button>
                        </form>
                        <a href="{{ route('admin.gyms.show', $gym->id) }}" class="btn btn-sm btn-info">Review</a>
                    </td>
                </tr>
                @endforeach
            </table>
            {{ $pendingGyms->links() }}
            @endif
        </div>
    </div>
</div>
@endsection