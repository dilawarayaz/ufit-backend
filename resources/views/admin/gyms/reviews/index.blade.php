@extends('admin.layouts.app')

@section('content')
<div class="container">
    <h1>Reviews for {{ $gym->name }}</h1>
    
    <div class="card">
        <div class="card-body">
            @foreach($reviews as $review)
            <div class="mb-4 p-3 border rounded">
                <div class="d-flex justify-content-between">
                    <h5>{{ $review->user->name }}</h5>
                    <div>
                        @for($i = 1; $i <= 5; $i++)
                            @if($i <= $review->rating)
                                ★
                            @else
                                ☆
                            @endif
                        @endfor
                    </div>
                </div>
                <p class="text-muted">{{ $review->created_at->format('M d, Y') }}</p>
                <p>{{ $review->comment }}</p>
                
                @if(!$review->approved)
                    <form action="{{ route('admin.gyms.reviews.approve', [$gym->id, $review->id]) }}" method="POST">
                        @csrf
                        <button type="submit" class="btn btn-sm btn-success">Approve Review</button>
                    </form>
                @endif
            </div>
            @endforeach
            
            {{ $reviews->links() }}
        </div>
    </div>
</div>
@endsection