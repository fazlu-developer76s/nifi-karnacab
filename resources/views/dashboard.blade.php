@extends('layouts/app')
@section('content')
@inject('helper', 'App\Helpers\Global_helper')


<div class="app-sidebar-bg"></div>
<div class="app-sidebar-mobile-backdrop"><a href="#" data-dismiss="app-sidebar-mobile"
        class="stretched-link"></a></div>
<div id="content" class="app-content">
    <div class="block-header">
        <div class="row">
            <div class="col-lg-7 col-md-6 col-sm-12">
                <h1 class="page-header">Dashboard</h1>
            </div>
            <div class="col-lg-5 col-md-6 col-sm-12">
                <ol class="breadcrumb float-xl-end">
                    <li class="breadcrumb-item"><a href="javascript:;">Home</a></li>
                    <li class="breadcrumb-item active">Welcome To Dashboard</li>
                </ol>
            </div>
        </div>
    </div>
    <div class="row">
       <div class="row">
            @if($helper->getTablesCount())
                @foreach($helper->getTablesCount() as $data)
                    <div class="col-lg-3">
                        <a href="#">
                            <div class="card">
                                <div class="card-body no-padding">
                                    <div class="alert alert-callout alert-success no-margin">
                                        <!-- Dynamic Content -->
                                        <span class="opacity-100">{{ str_replace('_',' ',$data['name'])  }}</span><br>
                                        <strong class="text-xl">{{ $data['count'] }}</strong>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                @endforeach
            @endif
        </div>

    </div>
</div>
<a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top"
    data-toggle="scroll-to-top"><i class="fa fa-angle-up"></i></a>
</div>
@endsection
