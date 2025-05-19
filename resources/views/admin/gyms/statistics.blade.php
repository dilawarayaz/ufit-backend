@extends('admin.layouts.app')

@section('content')
<div class="container">
    <h1>Statistics for {{ $gym->name }}</h1>
    
    <div class="row">
        <div class="col-md-4">
            <div class="card text-white bg-primary mb-3">
                <div class="card-header">Total Visits</div>
                <div class="card-body">
                    <h2 class="card-title">{{ $gym->visits_count }}</h2>
                </div>
            </div>
        </div>
        
        <div class="col-md-4">
            <div class="card text-white bg-success mb-3">
                <div class="card-header">Average Rating</div>
                <div class="card-body">
                    <h2 class="card-title">{{ number_format($gym->reviews_avg_rating, 1) }} ★</h2>
                    <p>from {{ $gym->reviews_count }} reviews</p>
                </div>
            </div>
        </div>
        
        <div class="col-md-4">
            <div class="card text-white bg-info mb-3">
                <div class="card-header">Commission Rate</div>
                <div class="card-body">
                    <h2 class="card-title">{{ $gym->commission_rate }}%</h2>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Add charts for visits over time, rating distribution, etc. -->
</div>
@endsection