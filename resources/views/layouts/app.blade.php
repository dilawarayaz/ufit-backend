<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Application</title>

    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />
    <style>
        :root {
            --sidebar-width: 250px;
            --sidebar-bg: linear-gradient(180deg, #2c3e50, #1a2530);
            --sidebar-header-bg: rgba(0,0,0,0.2);
            --sidebar-text: #b8c7ce;
            --sidebar-active: #3c8dbc;
        }
        
        body {
            display: flex;
            min-height: 100vh;
            overflow-x: hidden;
            background-color: #f4f6f9;
        }
        
        /* Sidebar styling */
        .sidebar {
            width: var(--sidebar-width);
            min-height: 100vh;
            background: var(--sidebar-bg);
            color: white;
            transition: all 0.3s;
            box-shadow: 4px 0 10px rgba(0,0,0,0.1);
            position: fixed;
            z-index: 1000;
        }
        
        .sidebar-header {
            padding: 20px;
            background: var(--sidebar-header-bg);
            text-align: center;
            border-bottom: 1px solid rgba(255,255,255,0.1);
        }
        
        .sidebar-header h3 {
            color: #fff;
            font-weight: 700;
            font-size: 1.5rem;
            letter-spacing: 1px;
            margin: 0;
        }
        
        .sidebar-menu {
            padding: 20px 0;
            height: calc(100vh - 130px);
            overflow-y: auto;
        }
        
        .sidebar-menu ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }
        
        .sidebar-menu li a {
            display: block;
            padding: 12px 20px;
            color: var(--sidebar-text);
            text-decoration: none;
            transition: all 0.3s;
            border-left: 3px solid transparent;
        }
        
        .sidebar-menu li a:hover,
        .sidebar-menu li a.active {
            color: white;
            background: rgba(255,255,255,0.1);
            border-left: 3px solid var(--sidebar-active);
        }
        
        .sidebar-menu li a i {
            margin-right: 10px;
            width: 20px;
            text-align: center;
        }
        
        .sidebar-footer {
            position: absolute;
            bottom: 0;
            width: 100%;
            padding: 15px;
            background: rgba(0,0,0,0.2);
            border-top: 1px solid rgba(255,255,255,0.1);
        }
        
        .main-content {
            flex: 1;
            padding: 20px;
            margin-left: var(--sidebar-width);
            min-height: 100vh;
        }
        
        /* Toggle button for mobile */
        .sidebar-toggle {
            display: none;
            position: fixed;
            top: 10px;
            left: 10px;
            z-index: 1050;
        }
        
        @media (max-width: 768px) {
            .sidebar {
                margin-left: calc(-1 * var(--sidebar-width));
            }
            
            .sidebar.active {
                margin-left: 0;
            }
            
            .sidebar-toggle {
                display: block;
            }
            
            .main-content {
                margin-left: 0;
            }
        }
    </style>
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
            <ul class="list-unstyled">
                @auth
                    @if(auth()->user()->is_admin)
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
                        
                        <!-- <li class="nav-item">
                            <a href="#" class="nav-link">
                                <i class="fas fa-chalkboard-teacher"></i> Classes
                            </a>
                        </li> -->
                        
                        <!-- <li class="nav-item">
                            <a href="#" class="nav-link">
                                <i class="fas fa-user-tie"></i> Trainers
                            </a>
                        </li> -->
                        
                        <li class="nav-item">
                            <a href="/admin/payments" class="nav-link {{ request()->is('admin/payments') ? 'active' : '' }}">
                                <i class="fas fa-money-bill-wave"></i> Payments
                            </a>
                        </li>
                        
                        <!-- <li class="nav-item">
                            <a href="#" class="nav-link">
                                <i class="fas fa-receipt"></i> Expenses
                            </a>
                        </li> -->
                        
                        <!-- <li class="nav-item">
                            <a href="#" class="nav-link">
                                <i class="fas fa-chart-bar"></i> Reports
                            </a>
                        </li> -->
                    @else
                        <!-- Regular User Menu Items -->
                        <li class="nav-item">
                            <a href="{{ route('user.dashboard') }}" class="nav-link {{ request()->routeIs('user.dashboard') ? 'active' : '' }}">
                                <i class="fas fa-tachometer-alt"></i> Dashboard
                            </a>
                        </li>
                        
                        <li class="nav-item">
                            <a href="{{ route('user.profile') }}" class="nav-link {{ request()->routeIs('user.profile') ? 'active' : '' }}">
                                <i class="fas fa-user"></i> My Profile
                            </a>
                        </li>
                        
                        <li class="nav-item">
                            <a href="{{ route('user.subscription') }}" class="nav-link {{ request()->routeIs('user.subscription') ? 'active' : '' }}">
                                <i class="fas fa-id-card"></i> My Subscription
                            </a>
                        </li>
                        
                        <li class="nav-item">
                            <a href="{{ route('user.workouts') }}" class="nav-link {{ request()->routeIs('user.workouts') ? 'active' : '' }}">
                                <i class="fas fa-dumbbell"></i> Workouts
                            </a>
                        </li>
                    @endif
                @endauth
            </ul>
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
</html>