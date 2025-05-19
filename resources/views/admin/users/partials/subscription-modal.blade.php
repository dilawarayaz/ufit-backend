<div class="modal fade" id="changeSubscriptionModal" tabindex="-1" aria-labelledby="changeSubscriptionModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="{{ route('admin.users.change-subscription', $user) }}" method="POST">
                @csrf
                <div class="modal-header">
                    <h5 class="modal-title" id="changeSubscriptionModalLabel">Change Subscription</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="mb-3">
                        <label for="subscription_plan_id" class="form-label">Select Plan</label>
                        <select name="subscription_plan_id" id="subscription_plan_id" class="form-select" required>
                            <option value="">-- Select Plan --</option>
                            @foreach($subscriptionPlans as $plan)
                                <option value="{{ $plan->id }}" 
                                    {{ $user->activeSubscription && $user->activeSubscription->subscription_plan_id == $plan->id ? 'selected' : '' }}>
                                    {{ $plan->name }} - ${{ number_format($plan->price, 2) }}/{{ $plan->billing_cycle }}
                                </option>
                            @endforeach
                        </select>
                    </div>

                    <div class="mb-3">
                        <label for="start_date" class="form-label">Start Date</label>
                        <input type="date" class="form-control" id="start_date" name="start_date" 
                               value="{{ now()->format('Y-m-d') }}" required>
                    </div>

                    <div class="mb-3">
                        <label for="end_date" class="form-label">End Date</label>
                        <input type="date" class="form-control" id="end_date" name="end_date" 
                               value="{{ now()->addMonth()->format('Y-m-d') }}" required>
                    </div>

                    <div class="form-check mb-3">
                        <input class="form-check-input" type="checkbox" id="auto_renew" name="auto_renew" value="1" checked>
                        <label class="form-check-label" for="auto_renew">
                            Auto Renew
                        </label>
                    </div>

                    <div class="form-check mb-3">
                        <input class="form-check-input" type="checkbox" id="notify_user" name="notify_user" value="1" checked>
                        <label class="form-check-label" for="notify_user">
                            Notify User via Email
                        </label>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-primary">Update Subscription</button>
                </div>
            </form>
        </div>
    </div>
</div>