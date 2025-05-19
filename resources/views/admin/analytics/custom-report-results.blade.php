@extends('admin.layouts.app')

@section('content')
<div class="container-fluid">
    <div class="row mb-4">
        <div class="col-md-8">
            <h2 class="fw-bold">Custom Report Results</h2>
        </div>
        <div class="col-md-4 text-end">
            <a href="{{ route('admin.analytics.custom-report') }}" class="btn btn-outline-primary">
                <i class="fas fa-arrow-left me-2"></i> Back to Builder
            </a>
        </div>
    </div>
    
    <div class="row">
        <div class="col-md-12">
            <div class="card border-0 shadow-sm">
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    @foreach($data->first()->getAttributes() as $key => $value)
                                    <th>{{ ucwords(str_replace('_', ' ', $key)) }}</th>
                                    @endforeach
                                </tr>
                            </thead>
                            <tbody>
                                @foreach($data as $item)
                                <tr>
                                    @foreach($item->getAttributes() as $value)
                                    <td>
                                        @if(is_object($value) && get_class($value) === 'Carbon\Carbon')
                                            {{ $value->format('Y-m-d H:i:s') }}
                                        @else
                                            {{ $value }}
                                        @endif
                                    </td>
                                    @endforeach
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
@endsection