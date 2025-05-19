@extends('layouts.app')

@section('content')

<div class="container py-4">
    <div class="row justify-content-center">
        <div class="col-6">
            <div class="card shadow rounded-3 border-0">
                <div class="card-body">
                    <h4 class="mb-4 text-center fw-bold">📊 Monthly Subscriptions Growth</h4>
                    <div id="apexChart"></div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- ApexCharts CDN -->
<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>

<script>
    // Monthly Subscriptions Growth
    const months = {!! json_encode($growthData->pluck('month')) !!};
    const subscriptions = {!! json_encode($growthData->pluck('total_subscriptions')) !!};

    const options = {
        chart: {
            type: 'bar',
            height: 350,
            toolbar: { show: false }
        },
        series: [{
            name: 'Subscriptions',
            data: subscriptions
        }],
        xaxis: {
            categories: months,
            labels: {
                style: { colors: '#555', fontSize: '12px' }
            },
            axisBorder: { show: false }
        },
        yaxis: {
            min: 0,
            labels: {
                style: { colors: '#555', fontSize: '12px' }
            }
        },
        plotOptions: {
            bar: {
                borderRadius: 6,
                horizontal: false,
                columnWidth: '50%',
                colors: { ranges: [{ from: 0, to: 1000, color: '#2196F3' }] }
            }
        },
        dataLabels: {
            enabled: false
        },
        tooltip: {
            theme: 'light',
            style: { fontSize: '14px' }
        },
        colors: ['#2196F3']
    };

    const chart = new ApexCharts(document.querySelector("#apexChart"), options);
    chart.render();


// churn chart









</script>

@endsection
