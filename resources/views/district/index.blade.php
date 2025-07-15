@extends('layouts/app')
@section('content')
    <div class="container-fluid">
        {{-- <div class="row"> --}}
            <div id="content" class="app-content">
                <div class="d-flex align-items-center mb-3">
                    <div>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="dashboard.php">Home</a></li>
                            <li class="breadcrumb-item"><a href="javascript:;">District </a></li>
                            <li class="breadcrumb-item active"><i class="fa fa-arrow-back"></i> District </li>
                        </ol>
                        <h1 class="page-header mb-0">District </h1>
                    </div>
                </div>

                <!-- Row for equal division -->
                <div class="row">
                    <!-- Form Section -->
                    <div class="col-md-6">
                        <div class="card border-0 mb-4">
                            <div class="card-header h6 mb-0 bg-none p-3">
                                <i class="fa fa-user-shield fa-lg fa-fw text-dark text-opacity-50 me-1"></i>
                                Add District
                            </div>
                            <form action="{{ route('store.district') }}" method="POST">
                                @csrf
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-12">
                                        <div class="mb-3">
                                            <label class="form-label">Select State </label>
                                            <select class="form-control custom-select-icon @error('state_id') is-invalid @enderror" name="state_id">
                                                    <option value="">Select State</option>
                                                    @if($get_state)
                                                        @foreach ($get_state as $state)
                                                            <option value="{{ $state->id }}" @if(empty($find_district)) {{ old('state_id') == $state->id ? 'selected' : '' }} @else {{ (isset($find_district) && $find_district->state_id == $state->id) ? 'selected' : '' ; }} @endif>{{ $state->title }}</option>
                                                        @endforeach
                                                    @endif
                                                </select>
                                                @error('state_id')
                                                <div class="invalid-feedback">{{ $message }}</div>
                                                @enderror
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="mb-3">
                                                @if(isset($find_district) && $find_district->id)
                                                <input type="hidden" name="hidden_id" value="{{ $find_district->id }}">
                                                @endif
                                                <label class="form-label">District </label>
                                                <input class="form-control @error('title') is-invalid @enderror" type="text" name="title" placeholder="Enter District  Title" value="{{ ( isset($find_district)  && $find_district->id) ? $find_district->title : ' ' ; }} {{ old('title') }}"  />
                                                   <!-- Display Error Message Below the Input Field -->
                                                    @error('title')
                                                        <div class="invalid-feedback">
                                                            {{ $message }}
                                                        </div>
                                                    @enderror
                                                </div>
                                           </div>
                                            <div class="col-md-12">
                                                <div class="mb-3">
                                                    <label class="form-label">Status</label>
                                                    <select class="form-control custom-select-icon" name="status">
                                                        <option value="1" {{ ( isset($find_district) && $find_district->status == 1)?'selected':''; }}>Active</option>
                                                        <option value="2" {{ ( isset($find_district) && $find_district->status == 2)?'selected':''; }}>Inactive</option>
                                                    </select>
                                                </div>
                                            </div>
                                    </div>
                                </div>
                                <div class="card-footer bg-none d-flex p-3">
                                    <button type="submit" class="btn btn-primary"><i class="fas fa-check"></i>Submit</button>
                                    {{-- <button type="reset" class="btn btn-danger ms-2">RESET</button> --}}
                                </div>
                            </form>
                        </div>
                    </div>

                    <!-- Table Section -->
                    <div class="col-md-6">
                        <div class="card border-0 mb-4">
                            <div class="card-header h6 mb-0 bg-none p-3" style="border-bottom: 1px solid #2196f3;">
                                <i class="fab fa-buromobelexperte fa-lg fa-fw text-dark text-opacity-50 me-1"></i> District  List
                            </div>
                            <div class="card-body">
                                <table id="data-table-default" class="table table-striped table-bordered align-middle">
                                    <thead>
                                        <tr>
                                            <th width="1%"></th>
                                            <th class="text-nowrap">State </th>
                                            <th class="text-nowrap">District </th>
                                            <th class="text-nowrap">Created Date</th>
                                            <th class="text-nowrap">Status</th>
                                            <th class="text-nowrap">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @if($get_district)
                                        @foreach($get_district as $district)
                                        <tr class="odd gradeX">
                                            <td width="1%" class="fw-bold text-dark">{{ $loop->iteration }}</td>
                                            <td>{{ $district->state }}</td>
                                            <td>{{ $district->title }}</td>
                                            <td>{{ \Carbon\Carbon::parse($district->created_at)->format('d F Y h:i A') }}</td>

                                            <td>
                                                <div class="form-check form-switch">
                                                    <input class="form-check-input" type="checkbox" id="flexSwitchCheckDefault{{ $district->id }}" {{ ($district->status==1) ? 'checked' : '' }}  onchange="ChangeStatus('tbl_district',{{ $district->id }});" >
                                                  </div>
                                            </td>
                                            <td>
                                                <a href="{{ route('edit.district', $district->id) }}" class="text-primary me-2">
                                                    <i class="fa fa-edit"></i>
                                                </a>
                                                <form action="{{ route('destroy.district', $district->id) }}" method="POST" style="display: inline;">
                                                    @csrf
                                                    @method('DELETE')
                                                    <button type="submit" class="btn btn-link text-danger p-0" onclick="return confirm('Are you sure you want to delete this district?');">
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
        {{-- </div> --}}
    </div>
@endsection
