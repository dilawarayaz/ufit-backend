@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <div class="d-flex justify-content-between align-items-center">
                        <h3><i class="fas fa-bell me-2"></i>Push Notifications</h3>
                        <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#newNotificationModal">
                            <i class="fas fa-plus me-1"></i> New Notification
                        </button>
                    </div>
                </div>

                <div class="card-body">
                    <!-- Notification Form -->
                    <div class="mb-4 p-4 border rounded bg-light">
                        <h5 class="mb-3">Create New Push Notification</h5>
                        <form>
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label class="form-label">Target Audience</label>
                                    <select class="form-select">
                                        <option>All Users</option>
                                        <option>iOS Users</option>
                                        <option>Android Users</option>
                                        <option>Specific Gym Members</option>
                                    </select>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label">Schedule</label>
                                    <select class="form-select">
                                        <option>Send Immediately</option>
                                        <option>Schedule for Later</option>
                                    </select>
                                </div>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Notification Title</label>
                                <input type="text" class="form-control" placeholder="Notification title">
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Message</label>
                                <textarea class="form-control" rows="3" placeholder="Notification message"></textarea>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Deep Link (optional)</label>
                                <input type="url" class="form-control" placeholder="https://example.com">
                            </div>

                            <div class="d-flex justify-content-end">
                                <button type="submit" class="btn btn-primary">Send Notification</button>
                            </div>
                        </form>
                    </div>

                    <!-- Notification History -->
                    <h5 class="mt-5 mb-3">Notification History</h5>
                    <div class="table-responsive">
                        <table class="table table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Date</th>
                                    <th>Title</th>
                                    <th>Target</th>
                                    <th>Status</th>
                                    <th>Open Rate</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>#2001</td>
                                    <td>2023-11-10</td>
                                    <td>New Gym Classes Available</td>
                                    <td>All Users</td>
                                    <td><span class="badge bg-success">Delivered</span></td>
                                    <td>68%</td>
                                    <td>
                                        <button class="btn btn-sm btn-outline-primary"><i class="fas fa-eye"></i></button>
                                        <button class="btn btn-sm btn-outline-danger"><i class="fas fa-trash"></i></button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection