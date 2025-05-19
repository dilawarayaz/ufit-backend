@extends('layouts.app')

@section('content')
<div class="container py-5">
    <div class="d-flex justify-content-between align-items-center mb-4 flex-wrap gap-3">
        <h2 class="mb-0 fw-bold">User Management</h2>
        <div class="d-flex gap-2 flex-wrap">
            <a href="{{ route('admin.users.create') }}" class="btn btn-dark">
                <i class="fas fa-plus me-1"></i> Create User
            </a>
            <a href="#" class="btn btn-outline-dark" data-bs-toggle="modal" data-bs-target="#filterModal">
                <i class="fas fa-filter me-1"></i> Filter
            </a>
            <form action="{{ route('admin.users.index') }}" method="GET" class="d-flex">
                <input type="text" name="search" class="form-control me-2" placeholder="Search users..." value="{{ request('search') }}">
                <button type="submit" class="btn btn-dark">
                    <i class="fas fa-search"></i>
                </button>
            </form>
        </div>
    </div>



    @include('admin.users.filters')

    <div class="card custom-shadow rounded-4 border-0">
        <div class="card-body p-0">
            <div class="table-responsive">
                <table class="table table-hover mb-0 align-middle text-center">
                    <thead class="table-dark">
                        <tr>
                            <th>
                                <a href="{{ request()->fullUrlWithQuery(['sort' => 'id', 'direction' => request('sort') === 'id' && request('direction') === 'asc' ? 'desc' : 'asc']) }}" class="text-white text-decoration-none">
                                    #
                                    @if(request('sort') === 'id')
                                    <i class="fas fa-sort-{{ request('direction') === 'asc' ? 'up' : 'down' }}"></i>
                                    @else
                                    <i class="fas fa-sort"></i>
                                    @endif
                                </a>
                            </th>
                            <th>
                                <a href="{{ request()->fullUrlWithQuery([
        'sort' => 'name',
        'direction' => request('sort') === 'name' && request('direction') === 'asc' ? 'desc' : 'asc'
    ]) }}" class="text-white text-decoration-none">
                                    Name
                                    @if(request('sort') === 'name')
                                    <i class="fas fa-sort-{{ request('direction') === 'asc' ? 'up' : 'down' }}"></i>
                                    @else
                                    <i class="fas fa-sort"></i>
                                    @endif
                                </a>
                            </th>


                            <th>
                                <a href="{{ request()->fullUrlWithQuery(['sort' => 'email', 'direction' => request('sort') === 'email' && request('direction') === 'asc' ? 'desc' : 'asc']) }}" class="text-white text-decoration-none">
                                    Email
                                    @if(request('sort') === 'email')
                                    <i class="fas fa-sort-{{ request('direction') === 'asc' ? 'up' : 'down' }}"></i>
                                    @else
                                    <i class="fas fa-sort"></i>
                                    @endif
                                </a>
                            </th>
                            <th>Role</th>
                            <th>Subscription</th>
                            <th>Status</th>
                            <th>Joined</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        @forelse ($users as $user)
                        <tr>
                            <td>{{ $user->id }}</td>
                            <td>
                                <a href="{{ route('admin.users.show', $user) }}" class="text-decoration-none fw-semibold text-dark">
                                    {{ "{$user->first_name} {$user->last_name}" }}
                                </a>
                            </td>
                            <td>{{ $user->email }}</td>
                            <td>
                                <span class="badge bg-primary-subtle text-dark px-3 py-2 rounded-pill">
                                    {{ $user->role->name ?? 'N/A' }}
                                </span>
                            </td>
                            <td>
                                @if($user->activeSubscription)
                                <span class="badge bg-{{ $user->activeSubscription->is_active ? 'success' : 'warning' }} px-3 py-2 rounded-pill">
                                    {{ $user->activeSubscription->plan->name }}
                                </span>
                                @else
                                <span class="badge bg-danger px-3 py-2 rounded-pill">None</span>
                                @endif
                            </td>
                            <td>
                                <span class="badge bg-{{ $user->is_suspended ? 'danger' : 'success' }} px-3 py-2 rounded-pill">
                                    {{ $user->is_suspended ? 'Suspended' : 'Active' }}
                                </span>
                            </td>
                            <td>{{ $user->created_at->format('d M Y') }}</td>
                            <td>
                                <div class="d-flex justify-content-center gap-2">
                                    <a href="{{ route('admin.users.show', $user) }}" class="btn btn-sm btn-outline-primary" title="View">
                                        <i class="fas fa-eye"></i>
                                    </a>
                                    @if($user->is_suspended)
                                    <form action="{{ route('admin.users.reactivate', $user) }}" method="POST">
                                        @csrf
                                        <button type="submit" class="btn btn-sm btn-success" title="Reactivate">
                                            <i class="fas fa-check-circle"></i>
                                        </button>
                                    </form>
                                    @else
                                    <form action="{{ route('admin.users.suspend', $user) }}" method="POST">
                                        @csrf
                                        <button type="submit" class="btn btn-sm btn-warning" title="Suspend">
                                            <i class="fas fa-ban"></i>
                                        </button>
                                    </form>
                                    @endif
                                </div>
                            </td>
                        </tr>
                        @empty
                        <tr>
                            <td colspan="8" class="text-center py-5">
                                <div class="text-muted fs-5">No users found matching your criteria.</div>
                            </td>
                        </tr>
                        @endforelse
                    </tbody>
                </table>
            </div>
        </div>
        <div class="pagination-container d-flex justify-content-center mt-4 p-4">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <!-- Previous Button -->
                    <li class="page-item {{ $currentPage == 1 ? 'disabled' : '' }}">
                        <a class="page-link" href="?page={{ $currentPage - 1 }}{{ request('search') ? '&search=' . request('search') : '' }}{{ request('subscription_plan') ? '&subscription_plan=' . request('subscription_plan') : '' }}{{ request('status') ? '&status=' . request('status') : '' }}{{ request('role') ? '&role=' . request('role') : '' }}{{ request('date_from') ? '&date_from=' . request('date_from') : '' }}{{ request('date_to') ? '&date_to=' . request('date_to') : '' }}{{ request('sort') ? '&sort=' . request('sort') : '' }}{{ request('direction') ? '&direction=' . request('direction') : '' }}" class="page-link prev-link">Previous</a>
                    </li>

                    <!-- Page Numbers -->
                    @for ($i = 1; $i <= $totalPages; $i++)
                        <li class="page-item {{ $i == $currentPage ? 'active' : '' }}">
                        <a class="page-link" href="?page={{ $i }}{{ request('search') ? '&search=' . request('search') : '' }}{{ request('subscription_plan') ? '&subscription_plan=' . request('subscription_plan') : '' }}{{ request('status') ? '&status=' . request('status') : '' }}{{ request('role') ? '&role=' . request('role') : '' }}{{ request('date_from') ? '&date_from=' . request('date_from') : '' }}{{ request('date_to') ? '&date_to=' . request('date_to') : '' }}{{ request('sort') ? '&sort=' . request('sort') : '' }}{{ request('direction') ? '&direction=' . request('direction') : '' }}" class="page-link">{{ $i }}</a>
                        </li>
                        @endfor

                        <!-- Next Button -->
                        <li class="page-item {{ $currentPage == $totalPages ? 'disabled' : '' }}">
                            <a class="page-link" href="?page={{ $currentPage + 1 }}{{ request('search') ? '&search=' . request('search') : '' }}{{ request('subscription_plan') ? '&subscription_plan=' . request('subscription_plan') : '' }}{{ request('status') ? '&status=' . request('status') : '' }}{{ request('role') ? '&role=' . request('role') : '' }}{{ request('date_from') ? '&date_from=' . request('date_from') : '' }}{{ request('date_to') ? '&date_to=' . request('date_to') : '' }}{{ request('sort') ? '&sort=' . request('sort') : '' }}{{ request('direction') ? '&direction=' . request('direction') : '' }}" class="page-link next-link">Next</a>
                        </li>
                </ul>
            </nav>
        </div>


    </div>
</div>
@endsection