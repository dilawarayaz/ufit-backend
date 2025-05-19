@extends('layouts.app')

@section('title', 'Region-based User Engagement')

@section('content')
<style>
    .chart-wrapper {
        min-height: 300px;
        max-height: 400px;
        position: relative;
    }

    .card-custom {
        border: none;
        border-radius: 12px;
        overflow: hidden;
        transition: box-shadow 0.3s ease;
    }

    .card-custom:hover {
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
    }

    .card-title {
        font-weight: 600;
        font-size: 1.2rem;
    }

    .section-title {
        text-align: center;
        margin-bottom: 40px;
        font-weight: bold;
        font-size: 2rem;
        color: #0d6efd;
    }

    .chart-canvas {
        min-height: 300px;
        max-height: 400px;
    }
</style>

<div class="container mt-5">
    <h2 class="section-title">📊 Region-based User Engagement</h2>

    <div class="row justify-content-center">
        <div class="col-md-6 col-lg-5">
            <div class="card card-custom shadow-sm">
                <div class="card-body d-flex flex-column align-items-center">
                    <h5 class="card-title text-dark mb-4">User Distribution by Region</h5>
                    <div class="chart-wrapper w-100">
                        <canvas id="regionEngagementChart" class="chart-canvas"></canvas>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        const regionNames = @json($regions->pluck('region_name'));
        const regionData = @json($regions->pluck('unique_users'));

        const regionCtx = document.getElementById('regionEngagementChart').getContext('2d');
        console.log(regionData)
        new Chart(regionCtx, {
            type: 'pie',
            data: {
                labels: regionNames,
                datasets: [{
                    data: regionData,
                    backgroundColor: [
                        '#0d6efd', '#198754', '#ffc107', '#dc3545',
                        '#6c757d', '#0dcaf0', '#6610f2', '#fd7e14', '#20c997'
                    ],
                    borderColor: '#fff',
                    borderWidth: 2
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: {
                        position: 'right',
                        labels: {
                            boxWidth: 12,
                            padding: 16,
                            color: '#333',
                            font: {
                                size: 14
                            }
                        }
                    },
                    tooltip: {
                        callbacks: {
                            label: function (context) {
                                const label = context.label || '';
                                const value = context.raw || 0;
                                const total = context.dataset.data.reduce((a, b) => a + b, 0);
                                const percentage = Math.round((value / total) * 100);
                                return `${label}: ${value} (${percentage}%)`;
                            }
                        }
                    }
                }
            }
        });
    });
</script>
@endsection
