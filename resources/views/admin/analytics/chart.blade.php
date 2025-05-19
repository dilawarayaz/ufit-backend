<div class="container py-4">
    <div class="card shadow rounded-3 border-0">
        <div class="card-body">
            <h4 class="mb-4 text-center fw-bold">📈 Subscription Growth Trends</h4>

            <div class="chart-container" style="position: relative; height:60vh; width:100%;">
                <canvas id="growthChart"></canvas>
            </div>
        </div>
    </div>
</div>

<!-- Chart.js CDN -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<script>
    const ctx = document.getElementById('growthChart').getContext('2d');
    const chart = new Chart(ctx, {
        type: 'line',
        data: {
            labels: {!! json_encode($growthData->pluck('month')) !!},
            datasets: [{
                label: 'Total Subscriptions',
                data: {!! json_encode($growthData->pluck('total_subscriptions')) !!},
                borderColor: 'rgba(33, 150, 243, 1)',
                backgroundColor: 'rgba(33, 150, 243, 0.2)',
                pointBackgroundColor: 'rgba(33, 150, 243, 1)',
                pointRadius: 5,
                pointHoverRadius: 8,
                fill: true,
                tension: 0.4,
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: {
                legend: {
                    labels: {
                        font: {
                            size: 14,
                            weight: 'bold'
                        }
                    },
                    position: 'bottom'
                },
                title: {
                    display: true,
                    text: 'Monthly Subscription Growth (Last 12 Months)',
                    font: {
                        size: 20,
                        weight: 'bold'
                    },
                    color: '#333'
                },
                tooltip: {
                    backgroundColor: '#fff',
                    titleColor: '#000',
                    bodyColor: '#000',
                    borderColor: 'rgba(0,0,0,0.1)',
                    borderWidth: 1,
                    titleFont: {
                        weight: 'bold'
                    },
                    padding: 10
                }
            },
            scales: {
                x: {
                    ticks: {
                        color: '#555',
                        font: {
                            size: 12
                        }
                    },
                    grid: {
                        display: false
                    }
                },
                y: {
                    beginAtZero: true,
                    ticks: {
                        stepSize: 1,
                        color: '#555',
                        font: {
                            size: 12
                        }
                    },
                    grid: {
                        borderDash: [5, 5],
                        color: 'rgba(0, 0, 0, 0.05)'
                    }
                }
            }
        }
    });
</script>