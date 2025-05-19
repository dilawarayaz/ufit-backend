@extends('layouts.app')

@section('content')
<div class="container">
    <h2>Custom Report Builder</h2>

    <form method="GET" action="{{ route('admin.analytics.custom-report') }}">
        <div class="row">
            <div class="col">
                <label>Start Date:</label>
                <input type="date" name="start_date" class="form-control" value="{{ request('start_date') }}">
            </div>
            <div class="col">
                <label>End Date:</label>
                <input type="date" name="end_date" class="form-control" value="{{ request('end_date') }}">
            </div>
            <div class="col">
                <label>Region:</label>
                <select name="region_id" class="form-control">
                    <option value="">All Regions</option>
                    @foreach ($regions as $region)
                    <option value="{{ $region->id }}" {{ request('region_id') == $region->id ? 'selected' : '' }}>
                        {{ $region->name }}
                    </option>
                    @endforeach
                </select>
            </div>
            <div class="col">
                <label>Gym:</label>
                <select name="gym_id" class="form-control">
                    <option value="">All Gyms</option>
                    @foreach ($gyms as $gym)
                    <option value="{{ $gym->id }}" {{ request('gym_id') == $gym->id ? 'selected' : '' }}>
                        {{ $gym->name }}
                    </option>
                    @endforeach
                </select>
            </div>
            <div class="col">
                <label>&nbsp;</label>
                <button type="submit" class="btn btn-primary btn-block">Filter</button>
            </div>
        </div>
    </form>

    @if($subscriptions->count() > 0)
    <form method="POST" action="{{ route('admin.analytics.custom-report.export') }}" class="mt-3">
        @csrf
        <input type="hidden" name="start_date" value="{{ request('start_date') }}">
        <input type="hidden" name="end_date" value="{{ request('end_date') }}">
        <input type="hidden" name="region_id" value="{{ request('region_id') }}">
        <input type="hidden" name="gym_id" value="{{ request('gym_id') }}">
        <button type="submit" class="btn btn-success">Export to Excel</button>
    </form>
    @endif

    <div class="table-responsive mt-4">
        <table class="table table-striped">
            <thead class="thead-dark">
                <tr>
                    <th>User</th>
                    <th>Region</th>
                    <th>Gym</th>
                    <th>Subscribed At</th>
                </tr>
            </thead>
            <tbody>
                @forelse ($subscriptions as $sub)
                <tr>
                    <td>
                        {{ isset($sub->user) 
        ? ($sub->user->first_name . ' ' . $sub->user->last_name) 
        : 'N/A' 
    }}
                    </td>
                    <td>
                        {{ $sub->gym && $sub->gym->region ? $sub->gym->region->name : 'N/A' }}
                    </td>
                    <td>
                        {{ $sub->gym ? $sub->gym->name : 'N/A' }}
                    </td>
                    <td>{{ $sub->created_at->format('Y-m-d H:i:s') }}</td>
                </tr>
                @empty
                <tr>
                    <td colspan="4" class="text-center">No subscriptions found with the selected filters.</td>
                </tr>
                @endforelse
            </tbody>
        </table>
    </div>
</div>
@endsection