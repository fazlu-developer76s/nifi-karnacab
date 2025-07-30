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
                                                <td><strong>Pickup Location:</strong></td>
                                                <td>{{ $data[0]->current_address ?? 'N/A' }}</td>
                                            </tr>
                                            <tr>
                                                <td><strong>Drop Location:</strong></td>
                                                <td>{{ $data[0]->drop_address ?? 'N/A' }}</td>
                                            </tr>
                                            <tr>
                                                <td><strong>Distance:</strong></td>
                                                <td>{{ $data[0]->trip_distance_text ?? 'N/A' }}</td>
                                            </tr>
                                            <tr>
                                                <td><strong>Distance Duration:</strong></td>
                                                <td>{{ $data[0]->trip_duration_text ?? 'N/A' }}</td>
                                            </tr>
                                            <tr>
                                                <td><strong>Km Price:</strong></td>
                                                <td>{{ $data[0]->rate_per_km ?? 'N/A' }} ₹</td>
                                            </tr>
                                            <tr>
                                                <td><strong>Km Extra Charges:</strong></td>
                                                <td>{{ $data[0]->vehicle_extra_charges ?? 'N/A' }} ₹</td>
                                            </tr>
                                            <tr>
                                                <td><strong>Booking Amount:</strong></td>
                                                <td>{{ floatval(preg_replace('/[^0-9.]/', '', $data[0]->trip_distance_text)) * $data[0]->rate_per_km }} ₹</td>
                                            </tr>
                                            <tr>
                                                <td><strong>Booking Commission:</strong></td>
                                                <!--<td>{{ floatval(preg_replace('/[^0-9.]/', '', $data[0]->trip_distance_text)) * $data[0]->vehicle_extra_charges }} ₹</td>-->
                                                <td>{{ $data[0]->calculated_commision }}</td>
                                            </tr>
                                            <tr>
                                                <td><strong>Total Amount:</strong></td>
                                                <td>{{ $data[0]->calculated_fare ?? 'N/A' }} ₹</td>
                                            </tr>
                                           <tr>
                                                <td><strong>Booking Status:</strong></td>
                                                <td>
                                                    @switch($data[0]->booking_status)
                                                        @case(1)
                                                            Open
                                                        @break

                                                        @case(2)
                                                            Accept
                                                        @break

                                                        @case(3)
                                                            Active
                                                        @break

                                                        @case(4)
                                                            Complete
                                                        @break
                                                        @case(5)
                                                            Cancel
                                                        @break

                                                        @default
                                                            N/A
                                                    @endswitch
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><strong>Created At:</strong></td>
                                                <td>{{ \Carbon\Carbon::parse($data[0]->created_at)->format('d F Y h:i A') ?? 'N/A' }}</td>
                                            </tr>

                                        </tbody>

                                    </table>
                                     <table class="table table-bordered">
                                        <tbody>
                                            <tr>
                                                <h4>Vehicle Information</h4>
                                                <td><strong>Vehicle Type:</strong></td>
                                                <td>{{ $data[0]->vehicle_title ?? 'N/A' }}</td>
                                            </tr>
                                            <tr>
                                                <td><strong>Vehicle Number:</strong></td>
                                                <td>{{ $data[0]->vehicle_number ?? 'N/A' }}</td>
                                            </tr>
                                            <tr>
                                                <td><strong>Vehicle Seater:</strong></td>
                                                <td>{{ $data[0]->vehicle_seater ?? 'N/A' }}</td>
                                            </tr>
                                            <tr>
                                                <td><strong>Vehicle Image:</strong></td>
                                                <td>
                                                    @if ($data[0]->vehicle_image)
                                                        <img src="{{ asset('storage/' . $data[0]->vehicle_image) }}" alt="Vehicle Image" style="width: 100px; height: 100px;">
                                                    @else
                                                        N/A
                                                    @endif
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="col-md-6">

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
                                     <table class="table table-bordered">
                                        <tbody>
                                        <tr>
                                            <h4>Booking Review</h4>
                                            <td><strong>Star:</strong></td>
                                            <td>
                                                @php
                                                    $rating = $data[0]->review->rating ?? 0;
                                                    $stars = str_repeat('★', $rating);
                                                @endphp
                                                {{ $stars }} ({{ $rating > 0 ? $rating : 'N/A' }})
                                            </td>
                                        </tr>

                                            <tr>
                                                <td><strong>Review:</strong></td>
                                                <td>{{ $data[0]->review->review ?? 'N/A' }}</td>
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
                                                        Activate Booking
                                                        @break
                                                    @case(4)
                                                        Complete Booking
                                                        @break
                                                                                                @case(5)
                                                        Cancel Booking
                                                        @break
                                                    @default
                                                        N/A
                                                @endswitch
                                            </td>

                                            {{-- Created At --}}
                                            <td>{{ \Carbon\Carbon::parse($log->created_at)->format('d F Y h:i A') ?? 'N/A' }}</td>
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
                {{-- User Name --}}
                <td>{{ $statement->user_name ?? 'N/A' }}</td>

                {{-- Transaction Type: Assuming you want to show payment_mode (e.g., card/DC) --}}
                <td>{{ ucfirst($statement->payment_mode ?? 'N/A') }}</td>

                {{-- Payment Type: Show directly from string --}}
                <td>{{ ucfirst($statement->payment_type ?? 'N/A') }}</td>

                {{-- Payment ID (use transaction_id) --}}
                <td>{{ $statement->transaction_id ?? 'N/A' }}</td>

                {{-- Amount --}}
                <td>{{ number_format((float)$statement->amount, 2) ?? 'N/A' }}</td>

                {{-- Created At --}}
                <td>{{ \Carbon\Carbon::parse($statement->created_at)->format('d F Y h:i A') ?? 'N/A' }}</td>

                {{-- Payment Status --}}
                <td>
                    @if(strtolower($statement->status) == 'success')
                        <span class="badge bg-success">Success</span>
                    @elseif(strtolower($statement->status) == 'failed')
                        <span class="badge bg-danger">Failed</span>
                    @elseif(strtolower($statement->status) == 'process')
                        <span class="badge bg-warning">Process</span>
                    @else
                        <span class="badge bg-secondary">N/A</span>
                    @endif
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
