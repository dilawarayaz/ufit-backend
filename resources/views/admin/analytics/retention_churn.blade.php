@extends('layouts.app')

@section('content')
<div class="container py-4">
    <div class="card shadow rounded-3 border-0">
        <div class="card-body text-center">
            <h4 class="mb-4 fw-bold">🔁 Retention and 🔻 Churn Rates</h4>

            <div class="row justify-content-center">
                <div class="col-md-6 mb-3">
                    <canvas id="retentionChurnChart" width="300" height="300"></canvas>
                    <p class="fs-3 mt-3">
                        <span class="text-success fw-bold">Retention: {{ $retentionRate }}%</span> &nbsp; | &nbsp; 
                        <span class="text-danger fw-bold">Churn: {{ $churnRate }}%</span>
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        const ctx = document.getElementById('retentionChurnChart').getContext('2d');

        const data = {
            labels: ['Retention', 'Churn'],
            datasets: [{
                data: [{{ $retentionRate }}, {{ $churnRate }}],
                backgroundColor: ['#28a745', '#dc3545'],  // Green and Red
                borderWidth: 1,
                borderColor: '#fff',
            }]
        };

        const options = {
            cutout: '70%',
            plugins: {
                legend: {
                    display: true,
                    position: 'bottom',
                    labels: {
                        color: '#000',
                        font: {
                            size: 14,
                            weight: 'bold'
                        }
                    }
                },
                tooltip: {
                    enabled: true,
                    callbacks: {
                        label: function(context) {
                            return context.label + ': ' + context.parsed + '%';
                        }
                    }
                }
            }
        };

        new Chart(ctx, {
            type: 'doughnut',
            data: data,
            options: options
        });
    });
</script>
@endsection
