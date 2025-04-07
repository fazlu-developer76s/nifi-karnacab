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
        $data = json_decode(json_encode($bookings)); // Replace $array_data with the actual array
    @endphp

    <div class="container-fluid">
        <div id="content" class="app-content">
            <div class="d-flex align-items-center mb-3">
                <div>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="dashboard.php">Home</a></li>
                        <li class="breadcrumb-item"><a href="javascript:;">Booking Information</a></li>
                        <li class="breadcrumb-item active"><i class="fa fa-arrow-back"></i> Booking Details</li>
                    </ol>
                    <h1 class="page-header mb-0">Booking Information</h1>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header bg-primary text-white">
                            <h4 class="mb-0">Booking Information</h4>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <table class="table table-bordered">
                                        <tbody>
                                            <h4>Customer Information</h4>
                                            <tr>
                                                <td><strong>Full Name:</strong></td>
                                                <td>{{ $data[0]->name ?? 'N/A' }}</td>
                                            </tr>
                                            <tr>
                                                <td><strong>Email:</strong></td>
                                                <td>{{ $data[0]->email_id ?? 'N/A' }}</td>
                                            </tr>
                                            <tr>
                                                <td><strong>Mobile No:</strong></td>
                                                <td>{{ $data[0]->mobile_no ?? 'N/A' }}</td>
                                            </tr>
                                            <tr>
                                                <td><strong>Number Of People:</strong></td>
                                                <td>{{ $data[0]->num_of_people ?? 'N/A' }}</td>
                                            </tr>
                                            <tr>
                                                <td><strong>Number Of Ladies:</strong></td>
                                                <td>{{ $data[0]->num_of_lady ?? 'N/A' }}</td>
                                            </tr>
                                            <tr>
                                                <td><strong>Number Of Men:</strong></td>
                                                <td>{{ $data[0]->num_of_men ?? 'N/A' }}</td>
                                            </tr>
                                            <tr>
                                                <td><strong>Number Of Children:</strong></td>
                                                <td>{{ $data[0]->num_of_child ?? 'N/A' }}</td>
                                            </tr>
                                            <tr>
                                                <td><strong>Pick Up Date:</strong></td>
                                                <td>{{ $data[0]->pick_up_date ?? 'N/A' }}</td>
                                            </tr>
                                            <tr>
                                                <td><strong>Pick Up Time:</strong></td>
                                                <td>{{ $data[0]->pick_up_time ?? 'N/A' }}</td>
                                            </tr>
                                            <tr>
                                                <td><strong>Pick Up Location:</strong></td>
                                                <td>{{ $data[0]->pick_up_location ?? 'N/A' }}</td>
                                            </tr>
                                            <tr>
                                                <td><strong>Country:</strong></td>
                                                <td>{{ $data[0]->country ?? 'N/A' }}</td>
                                            </tr>
                                            <tr>
                                                <td><strong>State:</strong></td>
                                                <td>{{ $data[0]->state ?? 'N/A' }}</td>
                                            </tr>
                                            <tr>
                                                <td><strong>City:</strong></td>
                                                <td>{{ $data[0]->city ?? 'N/A' }}</td>
                                            </tr>
                                            <tr>
                                                <td><strong>Address:</strong></td>
                                                <td>{{ $data[0]->address ?? 'N/A' }}</td>
                                            </tr>
                                            <tr>
                                                <td><strong>Pincode:</strong></td>
                                                <td>{{ $data[0]->pincode ?? 'N/A' }}</td>
                                            </tr>
                                            <tr>
                                                <td><strong>Drop Location:</strong></td>
                                                <td>{{ $data[0]->drop_us_location ?? 'N/A' }}</td>
                                            </tr>
                                            <tr>
                                                <td><strong>Booking Amount:</strong></td>
                                                <td>{{ $data[0]->booking_amount ?? 'N/A' }}</td>
                                            </tr>
                                            <tr>
                                                <td><strong>Note:</strong></td>
                                                <td>{{ $data[0]->note ?? 'N/A' }}</td>
                                            </tr>
                                            <tr>
                                                <td><strong>Seater:</strong></td>
                                                <td>{{ $data[0]->seater ?? 'N/A' }}</td>
                                            </tr>
                                            <tr>
                                                <td><strong>Booking Percentage:</strong></td>
                                                <td>{{ $data[0]->booking_percentage ?? 'N/A' }}</td>
                                            </tr>
                                            <tr>
                                                <td><strong>Booking Tax:</strong></td>
                                                <td>{{ $data[0]->booking_tax ?? 'N/A' }}</td>
                                            </tr>
                                            <tr>
                                                <td><strong>Booking Post Percentage:</strong></td>
                                                <td>{{ $data[0]->booking_post_percentage ?? 'N/A' }}</td>
                                            </tr>
                                            <tr>
                                                <td><strong>Booking Post TDS:</strong></td>
                                                <td>{{ $data[0]->booking_post_tds ?? 'N/A' }}</td>
                                            </tr>
                                            <tr>
                                                <td><strong>Created At:</strong></td>
                                                <td>{{ \Carbon\Carbon::parse($data[0]->created_at)->format('Y-m-d H:i:s') ?? 'N/A' }}</td>
                                            </tr>

                                        </tbody>

                                    </table>
                                </div>
                                <div class="col-md-6">
                                    <table class="table table-bordered">
                                        <tbody>
                                            <tr>
                                                <h4>Vehicle Information</h4>
                                                <td><strong>Vehicle Type:</strong></td>
                                                <td>{{ $data[0]->accept_user_vehicle_type ?? 'N/A' }}</td>
                                            </tr>
                                            <tr>
                                                <td><strong>Registration Number:</strong></td>
                                                <td>{{ $data[0]->accept_user_registration_number ?? 'N/A' }}</td>
                                            </tr>
                                            <tr>
                                                <td><strong>Pick-Up Location:</strong></td>
                                                <td>{{ $data[0]->pick_up_location ?? 'N/A' }}</td>
                                            </tr>
                                            <tr>
                                                <td><strong>Drop-Off Location:</strong></td>
                                                <td>{{ $data[0]->drop_us_location ?? 'N/A' }}</td>
                                            </tr>
                                            <tr>
                                                <td><strong>Status:</strong></td>
                                                <td>
                                                    @switch($data[0]->booking_status)
                                                        @case(1)
                                                            Open
                                                        @break

                                                        @case(2)
                                                            Accept
                                                        @break

                                                        @case(3)
                                                            Complete
                                                        @break

                                                        @case(4)
                                                            Cancel
                                                        @break

                                                        @default
                                                            N/A
                                                    @endswitch
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <table class="table table-bordered">
                                        <tbody>
                                            <tr>
                                                <h4>Post Booking User Info</h4>
                                                <td><strong>Username:</strong></td>
                                                <td>{{ $data[0]->post_user->name ?? 'N/A' }}</td>
                                            </tr>
                                            <tr>
                                                <td><strong>Email:</strong></td>
                                                <td>{{ $data[0]->post_user->email ?? 'N/A' }}</td>
                                            </tr>
                                            <tr>
                                                <td><strong>Mobile No:</strong></td>
                                                <td>{{ $data[0]->post_user->mobile_no ?? 'N/A' }}</td>
                                            </tr>
                                            <tr>
                                                <td><strong>View All Info:</strong></td>
                                                <td><a href="{{ route('member.view', ['id' => $data[0]->post_user->id ?? 'N/A']) }}" target="_blank">Click here</a></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <table class="table table-bordered">
                                        <tbody>
                                            <tr>
                                                <h4>Accept Booking User Info</h4>
                                                <td><strong>Username:</strong></td>
                                                <td>{{ $data[0]->accept_user->name ?? 'N/A' }}</td>
                                            </tr>
                                            <tr>
                                                <td><strong>Email:</strong></td>
                                                <td>{{ $data[0]->accept_user->email ?? 'N/A' }}</td>
                                            </tr>
                                            <tr>
                                                <td><strong>Mobile No:</strong></td>
                                                <td>{{ $data[0]->accept_user->mobile_no ?? 'N/A' }}</td>
                                            </tr>
                                            <tr>
                                                <td><strong>View All Info:</strong></td>
                                                <td><a href="{{ route('member.view', ['id' => $data[0]->accept_user->id ?? 'N/A']) }}" target="_blank">Click here</a></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <h4>Booking Logs</h4>
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>User</th>
                                        <th>Event</th>
                                        <th>Created At</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($data[0]->booking_log as $log)
                                        <tr>
                                            <td>{{ $log->user_name ?? 'N/A' }}</td>

                                            {{-- Booking Type Mapping --}}
                                            <td>
                                                @switch($log->booking_type)
                                                    @case(1)
                                                        Post Booking
                                                        @break
                                                    @case(2)
                                                        Accept Booking
                                                        @break
                                                    @case(3)
                                                        Complete Booking
                                                        @break
                                                    @case(4)
                                                        Cancel Booking
                                                        @break
                                                    @default
                                                        N/A
                                                @endswitch
                                            </td>

                                            {{-- Created At --}}
                                            <td>{{ \Carbon\Carbon::parse($log->created_at)->format('Y-m-d H:i:s') ?? 'N/A' }}</td>
                                        </tr>
                                    @endforeach
                                </tbody>
                            </table>
                            <h4>Transaction Logs</h4>
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>User</th>
                                        <th>Transaction Type</th>
                                        <th>Payment Type</th>
                                        <th>Payment ID</th>
                                        <th>Amount</th>
                                        <th>Created At</th>
                                        <th>Status</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($data[0]->statement as $statement)
                                        <tr>
                                            <td>{{ $statement->user_name ?? 'N/A' }}</td>

                                            {{-- Transaction Type Mapping --}}
                                            <td>
                                                @switch($statement->transaction_type)
                                                    @case(1)
                                                        Accept Booking Charges
                                                        @break
                                                    @case(2)
                                                        Complete Booking Charges
                                                        @break
                                                    @case(3)
                                                        Top Up Wallet
                                                        @break
                                                    @case(4)
                                                        Share Charges Post Booking
                                                        @break
                                                    @case(5)
                                                        Cancel Booking Charges
                                                        @break
                                                    @default
                                                        N/A
                                                @endswitch
                                            </td>

                                            {{-- Payment Type Mapping --}}
                                            <td>
                                                @switch($statement->payment_type)
                                                    @case(1)
                                                        Credit
                                                        @break
                                                    @case(2)
                                                        Debit
                                                        @break
                                                    @default
                                                        N/A
                                                @endswitch
                                            </td>

                                            {{-- Payment ID --}}
                                            <td>{{ $statement->payment_id ?? 'N/A' }}</td>

                                            {{-- Amount --}}
                                            <td>{{ number_format($statement->amount, 2) ?? 'N/A' }}</td>
                                            <td>{{ \Carbon\Carbon::parse($statement->created_at)->format('Y-m-d H:i:s') ?? 'N/A' }}</td>

                                            {{-- Payment Status Mapping --}}
                                            <td>
                                                @switch($statement->payment_status)
                                                    @case(1)
                                                        Success
                                                        @break
                                                    @case(2)
                                                        Failed
                                                        @break
                                                    @case(3)
                                                        Process
                                                        @break
                                                    @default
                                                        N/A
                                                @endswitch
                                            </td>
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
