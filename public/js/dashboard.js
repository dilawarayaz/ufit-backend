
// const usersChartLabels = @json($usersChart['labels']);
// const usersChartData = @json($usersChart['data']);

// const revenueChartLabels = @json($revenueChart['labels']);
// const revenueChartData = @json($revenueChart['data']);

// const checkinsChartLabels = @json($checkinsChart['labels']);
// const checkinsChartData = @json($checkinsChart['data']);

// document.addEventListener('DOMContentLoaded', function () {
//     // USER GROWTH CHART
//     const userGrowthCtx = document.getElementById('userGrowthChart').getContext('2d');
//     new Chart(userGrowthCtx, {
//         type: 'line',
//         data: {
//             labels: JSON.parse(document.getElementById('userGrowthChart').dataset.labels),
//             datasets: [{
//                 label: 'Users',
//                 data: JSON.parse(document.getElementById('userGrowthChart').dataset.data),
//                 backgroundColor: 'rgba(54, 162, 235, 0.2)',
//                 borderColor: '#36A2EB',
//                 borderWidth: 2,
//                 fill: true,
//                 tension: 0.3
//             }]
//         },
//         options: {
//             responsive: true,
//             plugins: {
//                 legend: {
//                     display: true
//                 }
//             },
//             scales: {
//                 y: {
//                     beginAtZero: true
//                 }
//             }
//         }
//     });

//     // REVENUE TREND CHART
//     const revenueTrendCtx = document.getElementById('revenueTrendChart').getContext('2d');
//     new Chart(revenueTrendCtx, {
//         type: 'bar',
//         data: {
//             labels: JSON.parse(document.getElementById('revenueTrendChart').dataset.labels),
//             datasets: [{
//                 label: 'Revenue ($)',
//                 data: JSON.parse(document.getElementById('revenueTrendChart').dataset.data),
//                 backgroundColor: 'rgba(255, 159, 64, 0.5)',
//                 borderColor: '#FF9F40',
//                 borderWidth: 1
//             }]
//         },
//         options: {
//             responsive: true,
//             plugins: {
//                 legend: {
//                     display: true
//                 }
//             },
//             scales: {
//                 y: {
//                     beginAtZero: true
//                 }
//             }
//         }
//     });
// });





// // Monthly Subscriptions Growth

//     // Prepare data from PHP
//     const months = {!! json_encode($growthData->pluck('month')) !!};
//     const subscriptions = {!! json_encode($growthData->pluck('total_subscriptions')) !!};

//     const options = {
//         chart: {
//             type: 'bar',
//             height: 350,
//             toolbar: { show: false }
//         },
//         series: [{
//             name: 'Subscriptions',
//             data: subscriptions
//         }],
//         xaxis: {
//             categories: months,
//             labels: {
//                 style: { colors: '#555', fontSize: '12px' }
//             },
//             axisBorder: { show: false }
//         },
//         yaxis: {
//             min: 0,
//             labels: {
//                 style: { colors: '#555', fontSize: '12px' }
//             }
//         },
//         plotOptions: {
//             bar: {
//                 borderRadius: 6,
//                 horizontal: false,
//                 columnWidth: '50%',
//                 colors: { ranges: [{ from: 0, to: 1000, color: '#2196F3' }] }
//             }
//         },
//         dataLabels: {
//             enabled: false
//         },
//         tooltip: {
//             theme: 'light',
//             style: { fontSize: '14px' }
//         },
//         colors: ['#2196F3']
//     };

//     const chart = new ApexCharts(document.querySelector("#apexChart"), options);
//     chart.render();
