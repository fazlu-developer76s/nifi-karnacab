@extends('layouts/app')
@section('content')
@if(isset($get_vehicle))
@php $form_action = "vehicle.update" @endphp
@else
@php $form_action = "vehicle.create" @endphp
@endif
    <div class="container-fluid">
        <div id="content" class="app-content">
            <div class="d-flex align-items-center mb-3">
                <div>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="dashboard.php">Home</a></li>
                        <li class="breadcrumb-item"><a href="javascript:;"> Vehicle</a></li>
                        <li class="breadcrumb-item active"><i class="fa fa-arrow-back"></i> Create  Vehicle</li>
                    </ol>
                    <h1 class="page-header mb-0"> Vehicle</h1>
                </div>
            </div>
            <!-- Row for equal division -->
            <div class="row">
                <div class="col-md-12">
                    <div class="card border-0 mb-4">
                        <div class="card-header h6 mb-0 bg-none p-3 d-flex justify-content-between align-items-center">
                            <div class="d-flex align-items-center">
                                <i class="fa fa-user-shield fa-lg fa-fw text-dark text-opacity-50 me-1"></i>
                                Add  Vehicle
                            </div>
                        </div>
                        <form action="{{ route($form_action) }}" method="POST" enctype="multipart/form-data">
                            @csrf
                            <input type="hidden" value="{{ (isset($get_vehicle)) ? $get_vehicle->id : '' ; }}" name="hidden_id">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label class="form-label">Vehicle</label>
                                            <input class="form-control @error('title') is-invalid @enderror" type="text" name="title" placeholder="Enter Title" value="@if(empty($get_vehicle)) {{ old('title') }} @else {{ (isset($get_vehicle)) ? $get_vehicle->title : '' ; }} @endif" />
                                            @error('title')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label class="form-label">Capicity</label>
                                            <input class="form-control @error('seater') is-invalid @enderror" type="text" name="seater" placeholder="Enter seater" value="@if(empty($get_vehicle)) {{ old('seater') }} @else {{ (isset($get_vehicle)) ? $get_vehicle->seater : '' ; }} @endif" />
                                            @error('seater')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label class="form-label">Kilo Meter Price</label>
                                            <input class="form-control @error('kilo_meter') is-invalid @enderror" type="text" name="kilo_meter" placeholder="Enter kilo_meter" value="@if(empty($get_vehicle)) {{ old('kilo_meter') }} @else {{ (isset($get_vehicle)) ? $get_vehicle->kilo_meter : '' ; }} @endif" />
                                            @error('kilo_meter')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label class="form-label">Extra Charges</label>
                                            <input class="form-control @error('extra_charges') is-invalid @enderror" type="text" name="extra_charges" placeholder="Enter extra_charges" value="@if(empty($get_vehicle)) {{ old('extra_charges') }} @else {{ (isset($get_vehicle)) ? $get_vehicle->extra_charges : '' ; }} @endif" />
                                            @error('extra_charges')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label class="form-label">Vehicle Image</label>
                                            <input class="form-control @error('image') is-invalid @enderror" type="file" name="image" />
                                            @error('image')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                            @enderror
                                        </div>
                                        @if(isset($get_vehicle->image))
                                        <img src="{{ Storage::url($get_vehicle->image) }}" alt="" class="img-fluid" style="max-width: 80px; height: auto;" />
                                        <input type="hidden" name="hidden_image" value="{{ $get_vehicle->image }}">
                                        @endif
                                    </div>
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label class="form-label">Status</label>
                                            <select class="form-control custom-select-icon @error('status') is-invalid @enderror" name="status">
                                                <option value="1" {{ old('status') == 1 ? 'selected' : '' }} {{ (isset($get_vehicle) && $get_vehicle->status == 1) ? 'selected' : '' ; }}>Active</option>
                                                <option value="2" {{ old('status') == 2 ? 'selected' : '' }} {{ (isset($get_vehicle) && $get_vehicle->status == 2) ? 'selected' : '' ; }}>Inactive</option>
                                            </select>
                                            @error('status')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                            @enderror
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card-footer bg-none d-flex p-3">
                                <button type="submit" class="btn btn-primary"><i class="fas fa-check"></i> Submit</button>
                            </div>
                        </form>
                    </div>
                </div>

                <!-- Table Section -->
                <div class="col-md-12">
                    <div class="card border-0 mb-4">
                        <div class="card-header h6 mb-0 bg-none p-3 d-flex align-items-center" style="border-bottom: 1px solid #2196f3;">
                            <i class="fab fa-buromobelexperte fa-lg fa-fw text-dark text-opacity-50 me-1"></i>
                             Vehicle List
                        </div>
                        <div class="card-body">
                            <table id="data-table-default" class="table table-striped table-bordered align-middle">
                                <thead>
                                    <tr>
                                        <th width="1%"></th>
                                        <th class="text-nowrap">Vehicle</th>
                                        <th class="text-nowrap">Capicity</th>
                                        <th class="text-nowrap">Vehicle Image</th>
                                        <th class="text-nowrap">Price KL</th>
                                        <th class="text-nowrap">Ext Chrg</th>
                                        <th class="text-nowrap">Created Date</th>
                                        <th class="text-nowrap">Status</th>
                                        <th class="text-nowrap">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @if($allvehicle)
                                    @foreach ($allvehicle as $vehicle)
                                    <tr class="odd gradeX">
                                        <td width="1%" class="fw-bold text-dark">{{ $loop->iteration }}</td>
                                        <td>{{ $vehicle->title }}</td>
                                        <td>{{ $vehicle->seater }}</td>
                                        <td>
                                            <img src="{{ Storage::url($vehicle->image) }}" alt="" class="img-fluid" style="max-width: 35px; height: auto;" />
                                        </td>
                                        <td>{{ $vehicle->kilo_meter }}</td>
                                        <td>{{ $vehicle->extra_charges }}</td>
                                        <td>{{ \Carbon\Carbon::parse($vehicle->created_at)->format('d F Y h:i A') }}</td>
                                        <td>
                                            <div class="form-check form-switch">
                                                <input class="form-check-input" type="checkbox" id="flexSwitchCheckDefault{{ $vehicle->id }}" {{ ($vehicle->status == 1) ? 'checked' : '' }} onchange="ChangeStatus('tbl_vehicle',{{ $vehicle->id }});" >
                                            </div>
                                        </td>
                                        <td>
                                            <a href="{{ route('vehicle.edit', $vehicle->id) }}" class="text-primary me-2">
                                                <i class="fa fa-edit"></i>
                                            </a>
                                            <form action="{{ route('vehicle.destroy', $vehicle->id) }}" method="POST" style="display: inline;">
                                                @csrf
                                                @method('DELETE')
                                                <button type="submit" class="btn btn-link text-danger p-0" onclick="return confirm('Are you sure you want to delete this route?');">
                                                    <i class="fa fa-trash"></i>
                                                </button>
                                            </form>
                                        </td>
                                    </tr>
                                    @endforeach
                                    @endif
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
