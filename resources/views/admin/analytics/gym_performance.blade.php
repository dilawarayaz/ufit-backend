@extends('layouts.app')

@section('content')
<div class="container-fluid">
    <h1>Gym Performance Comparisons</h1>

    <div class="row">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header">
                    <h3>Top 5 Gyms by Check-ins</h3>
                </div>
                <div class="card-body">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>Gym Name</th>
                                <th>Region</th>
                                <th>Check-ins</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($topGymsByCheckins as $gym)
                            <tr>
                                <td>{{ $gym->name }}</td>
                                <td>{{ $gym->region->name ?? 'No Region' }}</td> {{-- <-- fix here --}}
                                <td>{{ $gym->user_subscriptions_count }}</td>
                            </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <div class="card">
                <div class="card-header">
                    <h3>Top 5 Gyms by Subscriptions</h3>
                </div>
                <div class="card-body">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>Gym Name</th>
                                <th>Region</th>
                                <th>Subscriptions</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($topGymsBySubscriptions as $gym)
                            <tr>
                                <td>{{ $gym->name }}</td>
                                <td>{{ $gym->region->name }}</td>
                                <td>{{ $gym->user_subscriptions_count }}</td>
                            </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <div class="row mt-4">
        <div class="col-12">
            <div class="card">
                <div class="card-header">
                    <h3>Performance by Region</h3>
                </div>
                <div class="card-body">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>Region</th>
                                <th>Check-ins</th>
                                <th>Subscriptions</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($regionPerformance as $region)
                            <tr>
                                <td>{{ $region->name }}</td>
                                <td>{{ $region->check_ins_count }}</td>
                                <td>{{ $region->user_subscriptions_count }}</td>
                            </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection