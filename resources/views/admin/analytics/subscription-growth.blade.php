@extends('layouts.app')

@section('content')
<div class="container-fluid">
    <div class="row mb-4">
        <div class="col-md-8">
            <h2 class="fw-bold">Subscription Growth Trends</h2>
        </div>
        <div class="col-md-4 text-end">
            <div class="dropdown">
                <button class="btn btn-outline-primary dropdown-toggle" type="button" id="exportDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                    <i class="fas fa-download me-2"></i> Export
                </button>
                <ul class="dropdown-menu" aria-labelledby="exportDropdown">
                    <li><a class="dropdown-item" href="{{ route('admin.analytics.export-report', ['type' => 'subscription_growth', 'format' => 'csv']) }}">CSV</a></li>
                    <li><a class="dropdown-item" href="{{ route('admin.analytics.export-report', ['type' => 'subscription_growth', 'format' => 'excel']) }}">Excel</a></li>
                    <li><a class="dropdown-item" href="{{ route('admin.analytics.export-report', ['type' => 'subscription_growth', 'format' => 'pdf']) }}">PDF</a></li>
                </ul>
            </div>
        </div>
    </div>

    <div class="row mb-4">
        <div class="col-md-12">
            <div class="card border-0 shadow-sm">
                <div class="card-body">
                    <form action="{{ route('admin.analytics.subscription-growth') }}" method="GET" class="row g-3">
                        <div class="col-md-3">
                            <label for="period" class="form-label">Period</label>
                            <select class="form-select" id="period" name="period">
                                <option value="daily" {{ $period === 'daily' ? 'selected' : '' }}>Daily</option>
                                <option value="weekly" {{ $period === 'weekly' ? 'selected' : '' }}>Weekly</option>
                                <option value="monthly" {{ $period === 'monthly' ? 'selected' : '' }}>Monthly</option>
                            </select>
                        </div>
                        <div class="col-md-3">
                            <label for="range" class="form-label">Time Range</label>
                            <select class="form-select" id="range" name="range">
                                <option value="3" {{ $range == 3 ? 'selected' : '' }}>Last 3 Months</option>
                                <option value="6" {{ $range == 6 ? 'selected' : '' }}>Last 6 Months</option>
                                <option value="12" {{ $range == 12 ? 'selected' : '' }}>Last 12 Months</option>
                                <option value="24" {{ $range == 24 ? 'selected' : '' }}>Last 2 Years</option>
                            </select>
                        </div>
                        <div class="col-md-3 d-flex align-items-end">
                            <button type="submit" class="btn btn-primary">Apply Filters</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <div class="card border-0 shadow-sm">
                <div class="card-body">
                    <div class="chart-container" style="height: 400px;">
                        <canvas id="subscriptionGrowthChart"></canvas>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row mt-4">
        <div class="col-md-12">
            <div class="card border-0 shadow-sm">
                <div class="card-body">
                    <h5 class="card-title">Subscription Data</h5>
                    <div class="table-responsive">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>Date</th>
                                    <th>New Subscriptions</th>
                                    <th>Revenue</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach($growthData as $data)
                                <tr>
                                    <td>
                                        @if($period === 'daily')
                                            {{ \Carbon\Carbon::parse($data->date)->format('M d, Y') }}
                                        @elseif($period === 'weekly')
                                            Week {{ $data->week }}, {{ $data->year }}
                                        @else
                                            {{ \Carbon\Carbon::createFromDate($data->year, $data->month)->format('M Y') }}
                                        @endif
                                    </td>
                                    <td>{{ $data->count }}</td>
                                    <td>${{ number_format($data->revenue, 2) }}</td>
                                </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection

@push('scripts')
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        const ctx = document.getElementById('subscriptionGrowthChart').getContext('2d');

        const labels = @json(
            $growthDataGraph
        );

        const subscriptionData = @json($growthData->pluck('count'));
        const revenueData = @json($growthData->pluck('revenue'));

        new Chart(ctx, {
            type: 'line',
            data: {
                labels: labels,
                datasets: [
                    {
                        label: 'New Subscriptions',
                        data: subscriptionData,
                        borderColor: 'rgba(75, 192, 192, 1)',
                        backgroundColor: 'rgba(75, 192, 192, 0.2)',
                        tension: 0.1,
                        yAxisID: 'y'
                    },
                    {
                        label: 'Revenue ($)',
                        data: revenueData,
                        borderColor: 'rgba(54, 162, 235, 1)',
                        backgroundColor: 'rgba(54, 162, 235, 0.2)',
                        tension: 0.1,
                        yAxisID: 'y1'
                    }
                ]
            },
            options: {
                responsive: true,
                interaction: {
                    mode: 'index',
                    intersect: false,
                },
                scales: {
                    y: {
                        type: 'linear',
                        display: true,
                        position: 'left',
                        title: {
                            display: true,
                            text: 'Subscriptions'
                        }
                    },
                    y1: {
                        type: 'linear',
                        display: true,
                        position: 'right',
                        title: {
                            display: true,
                            text: 'Revenue ($)'
                        },
                        grid: {
                            drawOnChartArea: false
                        }
                    }
                }
            }
        });
    });
</script>
@endpush
