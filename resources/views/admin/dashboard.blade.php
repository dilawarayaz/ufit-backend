    @extends('layouts.app')

    @section('content')
    <div class="container-fluid px-4">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h1 class="fw-bold">Dashboard Overview</h1>
            <div class="dropdown">
                <button class="btn btn-outline-secondary dropdown-toggle" type="button" id="timePeriodDropdown" data-bs-toggle="dropdown">
                    Last 30 Days
                </button>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="#">Last 7 Days</a></li>
                    <li><a class="dropdown-item" href="#">Last 30 Days</a></li>
                    <li><a class="dropdown-item" href="#">Last 90 Days</a></li>
                    <li><a class="dropdown-item" href="#">This Year</a></li>
                </ul>
            </div>
        </div>
        <!-- Additional Stats Cards -->
        <div class="row g-4 mb-4">
            <!-- Active Subscribers -->
            <div class="col-xl-3 col-md-6">
                <div class="card border-0 shadow-sm h-100">
                    <div class="card-body">
                        <div class="d-flex justify-content-between align-items-center">
                            <div>
                                <h6 class="text-uppercase text-muted mb-2">Active Subscribers</h6>
                                <h2 class="mb-0 fw-bold">{{ $activeSubscribers }}</h2>
                            </div>
                            <div class="bg-primary bg-opacity-10 p-3 rounded">
                                <i class="fas fa-user-check fa-2x text-primary"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Total Gyms Onboarded -->
            <div class="col-xl-3 col-md-6">
                <div class="card border-0 shadow-sm h-100">
                    <div class="card-body">
                        <div class="d-flex justify-content-between align-items-center">
                            <div>
                                <h6 class="text-uppercase text-muted mb-2">Total Gyms Onboarded</h6>
                                <h2 class="mb-0 fw-bold">{{ $gymCount }}</h2>
                            </div>
                            <div class="bg-success bg-opacity-10 p-3 rounded">
                                <i class="fas fa-building fa-2x text-success"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Monthly Revenue -->
            <div class="col-xl-3 col-md-6">
                <div class="card border-0 shadow-sm h-100">
                    <div class="card-body">
                        <div class="d-flex justify-content-between align-items-center">
                            <div>
                                <h6 class="text-uppercase text-muted mb-2">Monthly Revenue</h6>
                                <h2 class="mb-0 fw-bold">${{ number_format($revenue, 2) }}</h2>
                            </div>
                            <div class="bg-info bg-opacity-10 p-3 rounded">
                                <i class="fas fa-wallet fa-2x text-info"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Daily Check-ins -->
            <div class="col-xl-3 col-md-6">
                <div class="card border-0 shadow-sm h-100">
                    <div class="card-body">
                        <div class="d-flex justify-content-between align-items-center">
                            <div>
                                <h6 class="text-uppercase text-muted mb-2">Daily Check-ins</h6>
                                <h3>{{ $todayCheckins }}</h3>
                            </div>
                            <div class="bg-warning bg-opacity-10 p-3 rounded">
                                <i class="fas fa-calendar-check fa-2x text-warning"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Graphs Section -->
        <div class="row g-4 mb-4">
            <!-- User Growth Over Time -->
            <div class="col-xl-6">
                <div class="card border-0 shadow-sm h-100">
                    <div class="card-header bg-white border-0">
                        <h5 class="mb-0">User Growth Over Time</h5>
                    </div>
                    <div class="card-body">
                        <!-- Canvas for user growth -->
                        <canvas id="userGrowthChart"
                            data-labels='@json($usersChart["labels"])'
                            data-data='@json($usersChart["data"])'
                            height="100"></canvas>
                    </div>
                </div>
            </div>

            <!-- Revenue Trend -->
            <div class="col-xl-6">
                <div class="card border-0 shadow-sm h-100">
                    <div class="card-header bg-white border-0 d-flex justify-content-between">
                        <h5 class="mb-0">Revenue Trend</h5>
                        <select class="form-select w-auto" id="revenueTrendSelect">
                            <option value="weekly">Weekly</option>
                            <option value="monthly">Monthly</option>
                        </select>
                    </div>
                    <div class="card-body">
                        <!-- Canvas for revenue trend -->
                        <canvas id="revenueTrendChart"
                            data-labels='@json($revenueChart["labels"])'
                            data-data='@json($revenueChart["data"])'
                            height="100"></canvas>
                    </div>
                </div>
            </div>
            <!-- Check-in Heatmap -->
            <div class="col-12">
                <div class="card border-0 shadow-sm">
                    <div class="card-header bg-white border-0">
                        <h5 class="mb-0">Check-in Heatmap by Location</h5>
                    </div>
                    <div class="card-body">
                        <!-- Canvas for heatmap -->
                        <canvas id="heatmapChart" height="400"></canvas>
                    </div>
                </div>
            </div>

            <!-- Top Performing Gym -->
            <div class="row g-4 mb-4">
                <div class="col-xl-12">
                    <div class="card border-0 shadow-sm">
                        <div class="card-body">
                            <h6 class="text-uppercase text-muted mb-2">Top Performing Gym</h6>
                            <h4 class="fw-bold mb-1">0</h4>
                            <p class="text-muted mb-0">Check-ins: 4</p>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Charts and Recent Activity Row -->
            <div class="row g-4 mb-4">
                <!-- Revenue Chart -->
                <div class="col-xl-8">
                    <div class="card border-0 shadow-sm h-100">
                        <div class="card-header bg-white border-0">
                            <h5 class="mb-0">Revenue Overview</h5>
                        </div>
                        <div class="card-body">
                            <div class="chart-container" style="height: 300px;">
                                <!-- Chart will be rendered here -->
                                <div class="d-flex align-items-center justify-content-center h-100">
                                    <div class="text-center">
                                        <i class="fas fa-chart-line fa-3x text-muted mb-3"></i>
                                        <p class="text-muted">Revenue chart will be displayed here</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Recent Activity -->
                <div class="col-xl-4">
                    <div class="card border-0 shadow-sm h-100">
                        <div class="card-header bg-white border-0 d-flex justify-content-between align-items-center">
                            <h5 class="mb-0">Recent Activity</h5>
                            <a href="#" class="small">View All</a>
                        </div>
                        <div class="card-body p-0">
                            <div class="list-group list-group-flush">
                                @foreach($recentActivities as $activity)
                                <div class="list-group-item border-0 py-3">
                                    <div class="d-flex align-items-center">
                                        <div class="bg-{{ $activity['color'] }} bg-opacity-10 p-2 rounded me-3">
                                            <i class="fas fa-{{ $activity['icon'] }} text-{{ $activity['color'] }}"></i>
                                        </div>
                                        <div>
                                            <p class="mb-0 fw-semibold">{{ $activity['title'] }}</p>
                                            <small class="text-muted">{{ $activity['description'] }} - {{ $activity['time'] }}</small>
                                        </div>
                                    </div>
                                </div>
                                @endforeach
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Recent Users -->
            <div class="row g-4">
                <div class="col-12">
                    <div class="card border-0 shadow-sm">
                        <div class="card-header bg-white border-0 d-flex justify-content-between align-items-center">
                            <h5 class="mb-0">Recent Users</h5>
                            <a href="{{ route('admin.users.index') }}" class="small">View All</a>
                        </div>
                        <div class="card-body p-0">
                            <div class="table-responsive">
                                <table class="table table-hover mb-0">
                                    <thead class="bg-light">
                                        <tr>
                                            <th>Name</th>
                                            <th>Email</th>
                                            <th>Joined</th>
                                            <th>Status</th>
                                            <th>Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach($recentUsers as $user)
                                        <tr>
                                            <td>
                                                <div class="d-flex align-items-center">
                                                    <img src="https://ui-avatars.com/api/?name={{ urlencode($user->name) }}" class="rounded-circle me-2" width="30" height="30">
                                                    <span>{{ $user->name }}</span>
                                                </div>
                                            </td>
                                            <td>{{ $user->email }}</td>
                                            <td>{{ $user->created_at->diffForHumans() }}</td>
                                            <td>
                                                <span class="badge bg-{{ $user->is_active ? 'success' : 'warning text-dark' }}">
                                                    {{ $user->is_active ? 'Active' : 'Inactive' }}
                                                </span>
                                            </td>
                                            <td>
                                                <a href="{{ route('admin.users.show', $user->id) }}" class="btn btn-sm btn-outline-primary">View</a>
                                            </td>
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


        <script>
            const usersChartLabels = @json($usersChart['labels']);
            const usersChartData = @json($usersChart['data']);

            const revenueChartLabels = @json($revenueChart['labels']);
            const revenueChartData = @json($revenueChart['data']);

            const checkinsChartLabels = @json($checkinsChart['labels']);
            const checkinsChartData = @json($checkinsChart['data']);
        </script>
        @endsection



        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

        <script>
            document.addEventListener('DOMContentLoaded', function() {
                // USER GROWTH CHART
                const userGrowthCtx = document.getElementById('userGrowthChart').getContext('2d');
                new Chart(userGrowthCtx, {
                    type: 'line',
                    data: {
                        labels: JSON.parse(document.getElementById('userGrowthChart').dataset.labels),
                        datasets: [{
                            label: 'Users',
                            data: JSON.parse(document.getElementById('userGrowthChart').dataset.data),
                            backgroundColor: 'rgba(54, 162, 235, 0.2)',
                            borderColor: '#36A2EB',
                            borderWidth: 2,
                            fill: true,
                            tension: 0.3
                        }]
                    },
                    options: {
                        responsive: true,
                        plugins: {
                            legend: {
                                display: true
                            }
                        },
                        scales: {
                            y: {
                                beginAtZero: true
                            }
                        }
                    }
                });

                // REVENUE TREND CHART
                const revenueTrendCtx = document.getElementById('revenueTrendChart').getContext('2d');
                new Chart(revenueTrendCtx, {
                    type: 'bar',
                    data: {
                        labels: JSON.parse(document.getElementById('revenueTrendChart').dataset.labels),
                        datasets: [{
                            label: 'Revenue ($)',
                            data: JSON.parse(document.getElementById('revenueTrendChart').dataset.data),
                            backgroundColor: 'rgba(255, 159, 64, 0.5)',
                            borderColor: '#FF9F40',
                            borderWidth: 1
                        }]
                    },
                    options: {
                        responsive: true,
                        plugins: {
                            legend: {
                                display: true
                            }
                        },
                        scales: {
                            y: {
                                beginAtZero: true
                            }
                        }
                    }
                });
            });
        </script>