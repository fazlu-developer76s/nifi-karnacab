@extends('layouts/app')

@section('content')
    <style>
        strong {
            font-weight: bold;
        }

        .lead-status-badge {
            font-size: 0.9rem;
            padding: 5px 10px;
            border-radius: 12px;
        }

        .info_div {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 1rem;
        }

        .first_div {
            flex: 0 0 40%;
            text-align: left;
        }

        .second_div {
            flex: 0 0 55%;
            text-align: left;
        }

        .container-fluid {
            padding: 0 2rem;
        }

        .page-header {
            margin-bottom: 1rem;
        }

        .breadcrumb-item {
            font-size: 0.9rem;
        }

        .card {
            margin-bottom: 2rem;
        }

        .card-header {
            padding: 1rem 1.5rem;
        }

        .card-body {
            padding: 1.5rem;
        }

        @media (max-width: 768px) {
            .info_div {
                flex-direction: column;
                text-align: left;
            }

            .second_div {
                text-align: left;
                margin-top: 0.5rem;
            }
        }
    </style>

    @php
        $form_action = isset($get_user) ? 'lead.update' : 'lead.create';
    @endphp

    <div class="container-fluid">
        <div id="content" class="app-content">
            <div class="d-flex align-items-center mb-3">
                <div>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="dashboard.php">Home</a></li>
                        <li class="breadcrumb-item"><a href="javascript:;">User</a></li>
                        <li class="breadcrumb-item active"><i class="fa fa-arrow-back"></i>Information</li>
                    </ol>
                    <h1 class="page-header mb-0">User</h1>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12">

                    <div class="card">
                        <div class="card-header bg-primary text-white">
                            <h4 class="mb-0">User Information</h4>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-12">
                                    <form  action="{{route('update.userstatus')}}" method="post">
                                        @csrf
                                        <input type="hidden" name="user_id" value="{{ @$get_user[0]->id ?? '' }}">
                                        <table class="table table-bordered">
                                            <tbody>
                                                <tr>
                                                    <td><strong>Name:</strong></td>
                                                    <td>{{ ucwords(@$get_user[0]->name ?? 'N/A') }}</td>
                                                </tr>
                                                <tr>
                                                    <td><strong>Email:</strong></td>
                                                    <td>{{ @$get_user[0]->email ?? 'N/A' }}</td>
                                                </tr>
                                                <tr>
                                                    <td><strong>Mobile No:</strong></td>
                                                    <td>{{ @$get_user[0]->mobile_no ?? 'N/A' }}</td>
                                                </tr>
                                                <tr>
                                                    <td><strong>User Image:</strong></td>
                                                    <td>
                                                        @if (@$get_user[0]->image)
                                                            <img src="{{ asset('storage/' . @$get_user[0]->image) }}" alt="Aadhar Front Image" style="max-width: 100px; max-height: 100px;">
                                                            <br>
                                                            <a href="{{ asset('storage/' . @$get_user[0]->image) }}" target="_blank"><b>Click here</b></a>
                                                        @else
                                                            N/A
                                                        @endif
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td><strong>Gender:</strong></td>
                                                    <td>{{ @$get_user[0]->gender ?? 'N/A' }}</td>
                                                </tr>
                                                <tr>
                                                    <td><strong>Date Of Birth:</strong></td>
                                                    <td>{{ @$get_user[0]->dob ?? 'N/A' }}</td>
                                                </tr>
                                                <tr>
                                                    <td><strong>State:</strong></td>
                                                    <td>{{ @$get_user[0]->state_name ?? 'N/A' }}</td>
                                                </tr>
                                                                                                <tr>
                                                    <td><strong>District:</strong></td>
                                                    <td>{{ @$get_user[0]->district_name ?? 'N/A' }}</td>
                                                </tr>
                                                <tr>
                                                    <td><strong>Vehicle Type:</strong></td>
                                                    <td>{{ @$get_user[0]->car_name ?? 'N/A' }}</td>
                                                </tr>
                                                <tr>
                                                    <td><strong>Vehicle Number:</strong></td>
                                                    <td>{{ @$get_user[0]->vehicle_number ?? 'N/A' }}</td>
                                                </tr>
                                                <tr>
                                                    <td><strong>Aadhar No:</strong></td>
                                                    <td>{{ @$get_user[0]->aadhar_no ?? 'N/A' }}</td>
                                                </tr>
                                                <tr>
                                                    <td><strong>Aadhar Front Image:</strong></td>
                                                    <td>
                                                        @if (@$get_user[0]->aadhar_front_image)
                                                            <img src="{{ asset('storage/' . @$get_user[0]->aadhar_front_image) }}" alt="Aadhar Front Image" style="max-width: 100px; max-height: 100px;">
                                                            <br>
                                                            <a href="{{ asset('storage/' . @$get_user[0]->aadhar_front_image) }}" target="_blank"><b>Click here</b></a>
                                                        @else
                                                            N/A
                                                        @endif
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td><strong>Aadhar Back Image:</strong></td>
                                                    <td>
                                                        @if (@$get_user[0]->aadhar_back_image)
                                                            <img src="{{ asset('storage/' . @$get_user[0]->aadhar_back_image) }}" alt="Aadhar Back Image" style="max-width: 100px; max-height: 100px;">
                                                            <br>
                                                            <a href="{{ asset('storage/' . @$get_user[0]->aadhar_back_image) }}" target="_blank"><b>Click here</b></a>
                                                        @else
                                                            N/A
                                                        @endif
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td><strong>PAN No:</strong></td>
                                                    <td>{{ @$get_user[0]->pan_no ?? 'N/A' }}</td>
                                                </tr>
                                                <tr>
                                                    <td><strong>PAN Front Image:</strong></td>
                                                    <td>
                                                        @if (@$get_user[0]->pan_front_image)
                                                            <img src="{{ asset('storage/' . @$get_user[0]->pan_front_image) }}" alt="PAN Front Image" style="max-width: 100px; max-height: 100px;">
                                                            <br>
                                                           <a href="{{ asset('storage/' . @$get_user[0]->pan_front_image) }}" target="_blank"><b>Click here</b></a>
                                                        @else
                                                            N/A
                                                        @endif
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td><strong>PAN Back Image:</strong></td>
                                                    <td>
                                                        @if (@$get_user[0]->pan_back_image)
                                                        <img src="{{ asset('storage/' . @$get_user[0]->pan_back_image) }}" alt="PAN Back Image" style="max-width: 100px; max-height: 100px;">
                                                        <br>
                                                       <a href="{{ asset('storage/' . @$get_user[0]->pan_back_image) }}" target="_blank"><b>Click here</b></a>
                                                        @else
                                                            N/A
                                                        @endif
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td><strong>DL Number:</strong></td>
                                                    <td>{{ @$get_user[0]->dl_number ?? 'N/A' }}</td>
                                                </tr>
                                                <tr>
                                                    <td><strong>DL Expiry Date:</strong></td>
                                                    <td>{{ @$get_user[0]->dl_validity ?? 'N/A' }}</td>
                                                </tr>
                                                <tr>
                                                    <td><strong>DL Front Image:</strong></td>
                                                    <td>
                                                        @if (@$get_user[0]->dl_front_image)
                                                            <img src="{{ asset('storage/' . @$get_user[0]->dl_front_image) }}" alt="DL Front Image" style="max-width: 100px; max-height: 100px;">
                                                            <br>
                                                            <a href="{{ asset('storage/' . @$get_user[0]->dl_front_image) }}" target="_blank"><b>Click here</b></a>
                                                        @else
                                                            N/A
                                                        @endif
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td><strong>DL Back Image:</strong></td>
                                                    <td>
                                                        @if (@$get_user[0]->dl_back_image)
                                                            <img src="{{ asset('storage/' . @$get_user[0]->dl_back_image) }}" alt="DL Back Image" style="max-width: 100px; max-height: 100px;">
                                                            <br>
                                                            <a href="{{ asset('storage/' . @$get_user[0]->dl_back_image) }}" target="_blank"><b>Click here</b></a>
                                                        @else
                                                            N/A
                                                        @endif
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td><strong>RC Number:</strong></td>
                                                    <td>{{ @$get_user[0]->rc_number ?? 'N/A' }}</td>
                                                </tr>
                                                <tr>
                                                    <td><strong>RC Front Image:</strong></td>
                                                    <td>
                                                        @if (@$get_user[0]->rc_front_image)
                                                            <img src="{{ asset('storage/' . @$get_user[0]->rc_front_image) }}" alt="RC Front Image" style="max-width: 100px; max-height: 100px;">
                                                            <br>
                                                           <a href="{{ asset('storage/' . @$get_user[0]->rc_front_image) }}" target="_blank"><b>Click here</b></a>
                                                        @else
                                                            N/A
                                                        @endif
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td><strong>RC Back Image:</strong></td>
                                                    <td>
                                                        @if (@$get_user[0]->rc_back_image)
                                                            <img src="{{ asset('storage/' . @$get_user[0]->rc_back_image) }}" alt="RC Back Image" style="max-width: 100px; max-height: 100px;">
                                                            <br>
                                                            <a href="{{ asset('storage/' . @$get_user[0]->rc_back_image) }}" target="_blank"><b>Click here</b></a>
                                                        @else
                                                            N/A
                                                        @endif
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td><strong>Vehicle Images:</strong></td>
                                                    <td>
                                                        @if (isset($get_user))
                                                            @foreach ($get_user as $image)
                                                                @if($image->image_type == 2)
                                                                <img src="{{ asset('storage/' . $image->sub_image) }}" alt="Vehicle Image" style="width: 100px; height: 100px; margin-right: 5px;">

                                                               <a href="{{ asset('storage/' . @$image->sub_image) }}" target="_blank"><b>Click here</b></a>
                                                                @endif
                                                            @endforeach
                                                        @else
                                                            N/A
                                                        @endif

                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td><strong>Vehicle With User Images:</strong></td>
                                                    <td>
                                                        @if (isset($get_user))
                                                            @foreach ($get_user as $image)
                                                                @if($image->image_type == 1)
                                                                <img src="{{ asset('storage/' . $image->sub_image) }}" alt="Vehicle Image" style="width: 100px; height: 100px; margin-right: 5px;">
                                                                <a href="{{ asset('storage/' . @$image->sub_image) }}" target="_blank"><b>Click here</b></a>

                                                                @endif
                                                            @endforeach
                                                        @else
                                                            N/A
                                                        @endif
                                                    </td>
                                                </tr>

                                                 <tr>
                                                    <td><strong>Insurance End Date:</strong></td>
                                                    <td>{{ @$get_user[0]->ins_end_date ?? 'N/A' }}</td>
                                                </tr>
                                                 <tr>
                                                    <td><strong>Insurance Image:</strong></td>
                                                    <td>
                                                        @if (@$get_user[0]->ins_image)
                                                            <img src="{{ asset('storage/' . @$get_user[0]->ins_image) }}" alt="RC Back Image" style="max-width: 100px; max-height: 100px;">
                                                            <br>
                                                          <a href="{{ asset('storage/' . @$get_user[0]->ins_image) }}" target="_blank"><b>Click here</b></a>
                                                        @else
                                                            N/A
                                                        @endif
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td><strong>Pollution End Date:</strong></td>
                                                    <td>{{ @$get_user[0]->pollution_in_date ?? 'N/A' }}</td>
                                                </tr>
                                                 <tr>
                                                    <td><strong>Pollution Image:</strong></td>
                                                    <td>
                                                        @if (@$get_user[0]->pollution_image)
                                                            <img src="{{ asset('storage/' . @$get_user[0]->pollution_image) }}" alt="RC Back Image" style="max-width: 100px; max-height: 100px;">
                                                            <br>
                                                            <a href="{{ asset('storage/' . @$get_user[0]->pollution_image) }}" target="_blank"><b>Click here</b></a>
                                                        @else
                                                            N/A
                                                        @endif

                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td><strong>Commercial Permit End Date:</strong></td>
                                                    <td>{{ @$get_user[0]->cab_com_permit_date ?? 'N/A' }}</td>
                                                </tr>
                                                 <tr>
                                                    <td><strong>Commercial Permit Image:</strong></td>
                                                    <td>
                                                        @if (@$get_user[0]->cab_com_permit)
                                                            <img src="{{ asset('storage/' . @$get_user[0]->cab_com_permit) }}" alt="RC Back Image" style="max-width: 100px; max-height: 100px;">
                                                            <br>
                                                            <a href="{{ asset('storage/' . @$get_user[0]->cab_com_permit) }}" target="_blank"> <b>Click here </b> </a>
                                                        @else
                                                            N/A
                                                        @endif
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td><strong>User Status:</strong></td>
                                                    <td>
                                                        @if (@$get_user[0]->is_user_verified == "verified")
                                                            <span class="badge bg-success">Verified</span>
                                                        @else
                                                            <span class="badge bg-danger">Non-Verified</span>
                                                        @endif
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div class="mb-3">
                                                            <label for="option" class="form-label">Select Status</label>
                                                            <select class="form-select" id="status" name="user_status">
                                                                <option >Select an option</option>
                                                                <option value="verified"{{ @$get_user[0]->is_user_verified == 'verified' ? 'selected' : '' }}>User Verified</option>
                                                                <option value="non-verified"{{ @$get_user[0]->is_user_verified == 'non-verified' ? 'selected' : '' }}>Non Verified</option>
                                                            </select>
                                                        </div>
                                                    <td>
                                                        <button type="submit" class="btn btn-primary"
                                                            >Submit</button>
                                                    </td>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>

                                    </form>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
