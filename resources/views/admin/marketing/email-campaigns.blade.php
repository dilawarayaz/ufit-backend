@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <div class="d-flex justify-content-between align-items-center">
                        <h3><i class="fas fa-envelope me-2"></i>Email Campaigns</h3>
                        <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#newCampaignModal">
                            <i class="fas fa-plus me-1"></i> New Campaign
                        </button>
                    </div>
                </div>

                <div class="card-body">
                    <!-- Campaign Form -->
                    <div class="mb-4 p-4 border rounded bg-light">
                        <h5 class="mb-3">Create New Email Campaign</h5>
                        <form>
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label class="form-label">Recipient Group</label>
                                    <select class="form-select">
                                        <option>All Users</option>
                                        <option>Active Subscribers</option>
                                        <option>Expired Subscriptions</option>
                                        <option>Specific Gym Members</option>
                                    </select>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label">Template</label>
                                    <select class="form-select">
                                        <option>Select Template</option>
                                        <option>Promotional Offer</option>
                                        <option>Subscription Reminder</option>
                                    </select>
                                </div>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Subject</label>
                                <input type="text" class="form-control" placeholder="Email subject">
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Email Content</label>
                                <textarea class="form-control" rows="8" id="emailEditor"></textarea>
                            </div>

                            <div class="d-flex justify-content-end">
                                <button type="button" class="btn btn-outline-secondary me-2">Preview</button>
                                <button type="submit" class="btn btn-primary">Send Campaign</button>
                            </div>
                        </form>
                    </div>

                    <!-- Campaign History -->
                    <h5 class="mt-5 mb-3">Campaign History</h5>
                    <div class="table-responsive">
                        <table class="table table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Date</th>
                                    <th>Subject</th>
                                    <th>Recipients</th>
                                    <th>Status</th>
                                    <th>Open Rate</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>#1001</td>
                                    <td>2023-11-15</td>
                                    <td>Winter Special Offer</td>
                                    <td>1,245</td>
                                    <td><span class="badge bg-success">Completed</span></td>
                                    <td>42%</td>
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