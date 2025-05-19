<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Application</title>

    <!-- Bootstrap 5 CSS -->
    <link href="{{ asset('css/dashboard.css') }}" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />

</head>

<body>
    <!-- Sidebar Toggle Button (Mobile) -->
    <button class="btn btn-dark sidebar-toggle d-lg-none" id="sidebarToggle">
        <i class="fas fa-bars"></i>
    </button>

    <!-- Sidebar -->
    <div class="sidebar" id="sidebar">
        <div class="sidebar-header">
            <h3>Uift</h3>
        </div>

        <div class="sidebar-menu">
            @auth
            @if(auth()->user()->is_admin)
            <ul class="list-unstyled">
                <!-- Admin Menu Items -->
                <li class="nav-item">
                    <a href="{{ route('admin.dashboard') }}" class="nav-link {{ request()->routeIs('admin.dashboard') ? 'active' : '' }}">
                        <i class="fas fa-tachometer-alt"></i> Dashboard
                    </a>
                </li>

                <li class="nav-item">
                    <a href="{{ route('admin.users.index') }}" class="nav-link {{ request()->routeIs('admin.users.*') ? 'active' : '' }}">
                        <i class="fas fa-users"></i> Users
                    </a>
                </li>

                <li class="nav-item">
                    <a href="{{ route('admin.user-subscriptions.index') }}" class="nav-link {{ request()->routeIs('admin.user-subscriptions.*') ? 'active' : '' }}">
                        <i class="fas fa-id-card"></i> Subscriptions
                    </a>
                </li>

                <li class="nav-item">
                    <a href="{{ route('admin.plans.index') }}" class="nav-link {{ request()->routeIs('admin.plans.*') ? 'active' : '' }}">
                        <i class="fas fa-clipboard-list"></i> Plans
                    </a>
                </li>

                <li class="nav-item">
                    <a href="{{ route('admin.gyms.index') }}" class="nav-link {{ request()->routeIs('admin.gyms.*') ? 'active' : '' }}">
                        <i class="fas fa-dumbbell"></i> Gyms
                    </a>
                </li>

                <li class="nav-item">
                    <a href="/admin/payments" class="nav-link {{ request()->is('admin/payments') ? 'active' : '' }}">
                        <i class="fas fa-money-bill-wave"></i> Payments
                    </a>
                </li>

                <li class="nav-item">
                    <a href="#analyticsSubmenu" data-bs-toggle="collapse" aria-expanded="false" class="nav-link dropdown-toggle {{ request()->is('admin/analytics*') ? 'active' : '' }}">
                        <i class="fas fa-chart-bar"></i> Reports
                    </a>
                    <ul class="collapse list-unstyled {{ request()->is('admin/analytics*') ? 'show' : '' }}" id="analyticsSubmenu">
                        <li>
                            <a href="{{ route('admin.analytics.subscription-growth') }}" class="nav-link {{ request()->routeIs('admin.analytics.subscription-growth') ? 'active' : '' }}">
                                <i class="fas fa-chart-line"></i> Subscription Growth
                            </a>
                        </li>
                        <li>
                            <a href="{{ route('admin.analytics.retention-churn') }}" class="nav-link {{ request()->routeIs('admin.analytics.retention-churn') ? 'active' : '' }}">
                                <i class="fas fa-sync-alt"></i> Retention & Churn
                            </a>
                        </li>
                        <li>
                            <a href="{{ route('admin.analytics.gym-performance') }}" class="nav-link {{ request()->routeIs('admin.analytics.gym-performance') ? 'active' : '' }}">
                                <i class="fas fa-dumbbell"></i> Gym Performance
                            </a>
                        </li>
                        <li>
                            <a href="{{ route('admin.analytics.region-engagement') }}" class="nav-link {{ request()->routeIs('admin.analytics.region-engagement') ? 'active' : '' }}">
                                <i class="fas fa-globe"></i> Region Engagement
                            </a>
                        </li>
                        <li>
                            <a href="{{ route('admin.analytics.custom-report') }}" class="nav-link {{ request()->routeIs('admin.analytics.custom-report') ? 'active' : '' }}">
                                <i class="fas fa-file-alt"></i> Custom Report
                            </a>
                        </li>
                    </ul>
                </li>

                <li class="nav-item">
                    <a href="#marketingSubmenu" data-bs-toggle="collapse" aria-expanded="false" class="nav-link dropdown-toggle {{ request()->is('admin/marketing*') ? 'active' : '' }}">
                        <i class="fas fa-bullhorn"></i> Marketing Tools
                    </a>
                    <ul class="collapse list-unstyled {{ request()->is('admin/marketing*') ? 'show' : '' }}" id="marketingSubmenu">
                        <li>
                            <a href="{{ route('email-campaigns') }}" class="nav-link {{ request()->routeIs('email-campaigns') ? 'active' : '' }}">
                                <i class="fas fa-envelope"></i> Email Campaigns
                            </a>
                        </li>
                        <li>
                            <a href="{{ route('push-notifications') }}" class="nav-link {{ request()->routeIs('push-notifications') ? 'active' : '' }}">
                                <i class="fas fa-bell"></i> Push Notifications
                            </a>
                        </li>
                    </ul>
                </li>
            </ul>
            @endif
            @endauth
        </div>

        <!-- Sidebar Footer with Logout -->
        <div class="sidebar-footer">
            @auth
            <form method="POST" action="{{ route('logout') }}">
                @csrf
                <button type="submit" class="btn btn-danger btn-block">
                    <i class="fas fa-sign-out-alt"></i> Logout
                </button>
            </form>
            @else
            <a href="{{ route('login') }}" class="btn btn-primary btn-block">
                <i class="fas fa-sign-in-alt"></i> Login
            </a>
            @endauth
        </div>
    </div>


    <!-- Main Content -->
    <div class="main-content" id="mainContent">
        <div class="container-fluid">
            @yield('content')
        </div>
    </div>

    <!-- Bootstrap 5 JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <script>
        // Toggle sidebar on mobile
        document.getElementById('sidebarToggle').addEventListener('click', function() {
            document.getElementById('sidebar').classList.toggle('active');
        });
    </script>
</body>
<script src="{{ asset('js/dashboard.js') }}"></script>

</html>