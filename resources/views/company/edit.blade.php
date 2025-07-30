@extends('layouts/app')
@section('content')
@php $form_action = "company.update" @endphp
    <div class="container-fluid">
        <div id="content" class="app-content">
            <div class="d-flex align-items-center mb-3">
                <div>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="dashboard.php">Home</a></li>
                        <li class="breadcrumb-item"><a href="javascript:;">Site Setting</a></li>

                    </ol>
                    <h1 class="page-header mb-0">Site Setting</h1>
                </div>
            </div>

            <!-- Row for equal division -->
            <div class="row">
                <!-- Form Section -->
                <div class="col-md-8">
                    <div class="card border-0 mb-4">
                        <div class="card-header h6 mb-0 bg-none p-3 d-flex justify-content-between align-items-center">
                            <div class="d-flex align-items-center">
                                <i class="fa fa-user-shield fa-lg fa-fw text-dark text-opacity-50 me-1"></i>
                                Site Setting
                            </div>

                        </div>
                        <form action="{{ route($form_action, $company->id) }}"  method="POST" enctype="multipart/form-data">
                            @csrf
                            <input type="hidden" value="{{ (isset($company)) ? $company->id : '' ; }}" name="hidden_id">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label class="form-label">Company Name</label>
                                            <input type="text" name="name" class="form-control" value="{{ old('name', $company->name) }}" required>
                                            @error('name')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label class="form-label">Logo</label>
                                            <input type="file" name="logo" class="form-control">
                                            @if($company->logo)
                                            <img src="{{ asset('storage/'.$company->logo) }}" style="max-width: 20%; height: auto; margin-top:10px;">
                                            @endif
                                            @error('logo')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label class="form-label">Favicon</label>
                                            <input type="file" name="favicon" class="form-control">
                                            @if($company->favicon)
                                            <img src="{{ asset('storage/'.$company->favicon) }}" style="max-width: 20%; height: auto; margin-top:10px;">
                                            @endif
                                            @error('favicon')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label class="form-label">Address</label>
                                            <input type="text" name="address" class="form-control" value="{{ old('address', $company->address) }}" required>
                                            @error('address')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label class="form-label">Email.</label>
                                            <input type="email" name="email" class="form-control" value="{{ old('email', $company->email) }}" required>
                                            @error('email')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label class="form-label">Mobile</label>
                                            <input type="text" name="mobile" class="form-control" value="{{ old('mobile', $company->mobile) }}" required>
                                            @error('mobile')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label class="form-label">Radius In Km</label>
                                            <input type="number" name="radius" class="form-control" value="{{ old('radius', $company->radius) }}" required>
                                            @error('radius')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label class="form-label">Discount (In Percentage)</label>
                                            <input type="number" name="discount" class="form-control" value="{{ old('discount', $company->discount) }}" required>
                                            @error('discount')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="col-md-6 d-none">
                                        <div class="mb-3">
                                            <label class="form-label">Booking Percentage</label>
                                            <input type="number" name="booking_percentage" class="form-control" value="{{ old('booking_percentage', $company->booking_percentage) }}" required>
                                            @error('booking_percentage')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                            @enderror
                                        </div>
                                    </div>

                                    <div class="col-md-6 d-none">
                                        <div class="mb-3">
                                            <label class="form-label">Booking Tax</label>
                                            <input type="number" name="booking_tax" class="form-control" value="{{ old('booking_tax', $company->booking_tax) }}" required>
                                            @error('booking_tax')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                            @enderror
                                        </div>
                                    </div>

                                    <div class="col-md-6 d-none">
                                        <div class="mb-3">
                                            <label class="form-label">Booking Post Percentage</label>
                                            <input type="number" name="booking_post_percentage" class="form-control" value="{{ old('booking_post_percentage', $company->booking_post_percentage) }}" required>
                                            @error('booking_post_percentage')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                            @enderror
                                        </div>
                                    </div>

                                    <div class="col-md-6 d-none">
                                        <div class="mb-3">
                                            <label class="form-label">Booking Post TDS</label>
                                            <input type="number" name="booking_post_tds" class="form-control" value="{{ old('booking_post_tds', $company->booking_post_tds) }}" required>
                                            @error('booking_post_tds')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                            @enderror
                                        </div>
                                    </div>

                                    {{-- <div class="col-md-6">
                                        <div class="mb-3">
                                            <label class="form-label">Member Status</label>
                                            <select class="form-control custom-select-icon @error('status') is-invalid @enderror" name="status">
                                                <option value="1" {{ old('status') == 1 ? 'selected' : '' }} {{ (isset($company) && $company->status == 1) ? 'selected' : '' ; }}>Active Member</option>
                                                <option value="2" {{ old('status') == 2 ? 'selected' : '' }} {{ (isset($company) && $company->status == 2) ? 'selected' : '' ; }}>Inactive Member</option>
                                            </select>
                                            @error('status')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                            @enderror
                                        </div>
                                    </div> --}}
                                </div>
                            </div>
                            <div class="card-footer bg-none d-flex p-3">
                                <button type="submit" class="btn btn-primary"><i class="fas fa-check"></i> Update Company Info</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
