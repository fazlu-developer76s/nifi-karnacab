@php
    $company = \App\Helpers\Global_helper::companyDetails();
@endphp
<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
<meta charset="utf-8" />
<title>{{ $title }}</title>
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" />
   <!-- CSRF Token -->
<meta name="csrf-token" content="{{ csrf_token() }}">
<link rel="icon" type="image/png" sizes="32x32" href="{{ asset('storage/'.$company->favicon) }}">
<link href="assets/css/fontawesome.css" rel="stylesheet" />
<link href="assets/css/vendor.min.css" rel="stylesheet" />
<link href="assets/css/default/app.min.css" rel="stylesheet" />
</head>
<body id="body" class="auth-page" style="background:#f5f8fa url('assets/img/login.png'); background-size: cover; background-position: center center;">
 <div class="container-md">
        <div class="row vh-100 d-flex justify-content-center">
            <div class="col-12 align-self-center">
                <div class="card-body">
                    <div class="row">
                        <div class="col-lg-4 mx-auto">
                            <div class="card">
                                <div class="card-body p-0 auth-header-box"  style="background: #f2f2f3;">
                                    <div class="text-center p-3">
                                        <a class="logo logo-admin">
                                           <img src="{{ asset('storage/'.$company->logo) }}" height="70" alt="logo" class="auth-logo">
                                        </a>
                                        <h4 class="mt-3 mb-1 fw-semibold text-dark font-18 ">Delete Account</h4>
                                    </div>
                                </div>
                                <div class="card-body pt-0">
                                        <form method="POST"  class="my-4" action="{{ route('unsubscribe') }}">
                                        @csrf
										<div class="form-floating mb-20px">
                                        <input id="mobile_no" type="mobile_no" class="form-control fs-13px h-45px  @error('mobile_no') is-invalid @enderror" name="mobile_no" value="{{ old('mobile_no') }} {{ (isset($_GET['mobile_no'])) ? $_GET['mobile_no'] : ''; }}"  autocomplete="mobile_no" autofocus  placeholder="USERNAME" />
                                        @error('mobile_no')
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                        @enderror
                                        <label for="mobile_noAddress" class="d-flex align-items-center py-0">Mobile No</label>
                                        </div>
                                        @if(isset($_GET['mobile_no']) && $_GET['mobile_no'])
                                        <input type="hidden" value="delete_account" name="type">
                                        <div class="form-floating mb-20px">
                                            <input  id="otp" type="text" class="form-control fs-13px h-45px @error('otp') is-invalid @enderror" name="otp"  autocomplete="current-otp" required placeholder="otp" />
                                            @error('otp')
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $message }}</strong>
                                                </span>
                                            @enderror
                                            <label for="otp" class="d-flex align-items-center py-0">OTP</label>
                                        </div>
                                        @endif

                                        {{-- <div class="row mb-3">
                                            <div class="col-md-6">
                                                <div class="form-check">
                                                    <input class="form-check-input" type="checkbox" name="remember" id="remember" {{ old('remember') ? 'checked' : '' }}>
                                                    <label class="form-check-label" for="remember">
                                                        {{ __('Remember Me') }}
                                                    </label>
                                                </div>
                                            </div>
                                        </div> --}}
                                        @if (session('success'))
                                            <div class="alert alert-success alert-dismissible fade show" role="alert">
                                                {{ session('success') }}
                                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                            </div>
                                        @endif

                                        @if (session('error'))
                                            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                                {{ session('error') }}
                                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                            </div>
                                        @endif

                                        <div class="form-group mb-0 row">
                                            <div class="col-12">
                                                <div class="d-grid">
                                                    <button class="btn btn-primary" name="login" type="submit">Delete Account <i class="fas fa-delete-in-alt ms-1"></i></button>
                                                </div>
                                            </div>
                                            {{-- @if (Route::has('otp.request'))
                                            <a class="btn btn-link" href="{{ route('otp.request') }}">
                                                {{ __('Forgot Your otp?') }}
                                            </a>
                                        @endif --}}
                                        </div>


                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
