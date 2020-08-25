@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            @foreach($images as $image)
            <div class="card pub_imagen">
                <div class="card-header">
                    {{ $image -> user -> name.' '.$image->user->surname }} </div>
                
                    @if($image->user->image)
                    <div class="container-avatar">
                        <img src="{{ route('user.avatar',['filename'=> $image->user->image]) }}" class="image" />
                    </div>
                    @endif
                <div class="card-body">
              
            </div>
        </div>
            @endforeach
    </div>
</div>
@endsection
