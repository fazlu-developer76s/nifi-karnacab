@extends('layouts.app')
@section('content')
    <style>
        /* Improved modal drawer styles */
        .modal.drawer {
            display: flex !important;
            pointer-events: none;
        }

        .modal.drawer .modal-dialog {
            margin: 0;
            flex: auto;
            transform: translate(25%, 0);
        }

        .modal.drawer.show {
            pointer-events: auto;
        }

        .job-tracking-vertical {
            display: flex;
            flex-direction: column;
            position: relative;
            padding-left: 31px;
            margin-top: 30px;
        }

        .job-tracking-vertical:before {
            content: '';
            position: absolute;
            left: 17px;
            height: 100%;
            top: 0;
            width: 2px;
            background-color: #ddd;
        }
    </style>
    <div class="container-fluid">
        <div id="content" class="app-content">
            <div class="d-flex align-items-center mb-5">
                <div>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="{{ route('dashboard') }}">Home</a></li>
                        <li class="breadcrumb-item active">Transaction</li>
                    </ol>
                    <h1 class="page-header mb-0">Transaction</h1>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="card border-0 mb-4">
                        <div class="card-header bg-none p-3 d-flex align-items-center">
                            <i class="fab fa-buromobelexperte fa-lg fa-fw text-dark text-opacity-50 me-1"></i>
                            Transaction List
                        </div>
                        <div class="card-body">
                            <table id="data-table-default" class="table table-striped table-bordered align-middle">
                                <div class="row">
                                    <div class="col-md-3">
                                        <form action="{{ route('transaction') }}" method="GET" class="form-inline">
                                            @csrf
                                            <div class="form-group mb-2 mr-2">
                                                <select name="user_id" class="form-control">
                                                    <option value="">Select User</option>
                                                    @foreach ($get_user as $row)
                                                        <option value="{{ $row->id }}"
                                                            {{ request()->get('user_id') == $row->id ? 'selected' : '' }}>
                                                            {{ $row->name }} ({{ $row->mobile_no }})
                                                        </option>
                                                    @endforeach
                                                </select>
                                            </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group mb-2 mr-2">
                                            <input type="date" name="from_date" class="form-control"
                                                value="{{ request()->get('from_date') }}">
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group mb-2 mr-2">
                                            <input type="date" name="to_date" class="form-control"
                                                value="{{ request()->get('to_date') }}">
                                        </div>
                                    </div>
                                    <div class="col-md-1">
                                        <div class="form-group mb-2 mr-2">
                                            <button type="submit" class="btn btn-primary">Filter</button>
                                        </div>
                                    </div>
                                    <div class="col-md-1">
                                        <div class="form-group mb-2">
                                            <a href="{{ route('transaction') }}" class="btn btn-secondary">Clear</a>
                                        </div>
                                        </form>
                                    </div>
                                    <div class="col-md-1">
                                        <h5>Total amount  {{ $sum_amount }}₹</h5>
                                    </div>
                                </div>
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Booking ID</th>
                                        <!--<th>User ID</th>-->
                                        <th>Username</th>
                                        <th>Amount</th>
                                        <th>Status</th>
                                        <th>Payment Mode</th>
                                        <th>Payment Type</th>
                                        <th>Transaction ID</th>
                                        {{-- JSON Response Fields --}}
                                        <th>mihpayid</th>
                                        <th>request_id</th>
                                        <th>bank_ref_num</th>
                                        <th>amt</th>
                                        <th>transaction_amount</th>
                                        <th>txnid</th>
                                        <th>productinfo</th>
                                        <th>firstname</th>
                                        <th>bankcode</th>
                                        <th>field2</th>
                                        <th>field9</th>
                                        <th>error_code</th>
                                        <th>addedon</th>
                                        <th>payment_source</th>
                                        <th>card_type</th>
                                        <th>net_amount_debit</th>
                                        <th>status (inside JSON)</th>
                                        <th>mode</th>
                                        <th>PG_TYPE</th>
                                        <th>card_no</th>
                                        <th>unmappedstatus</th>
                                        <th>Settled_At</th>
                                        <th>created_at</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @forelse ($alltransaction as $book)
                                        @php
                                            $r = json_decode($book->response, true);
                                        @endphp
                                        <tr>
                                            <td>{{ $loop->iteration }}</td>
                                            {{-- <td>{{ $book->booking_id }}</td> --}}
                                           <td>
                                            <a href="{{ route('lead.view', $book->booking_id) }}" target="_blank"
                                               title="Click to view full booking: {{ $book->booking_id }}">
                                                {{ \Illuminate\Support\Str::limit($book->booking_id, 10) }}...
                                            </a>
                                        </td>

                                            <!--<td>{{ $book->user_id }}</td>-->
                                            <td> {{ $book->user_name }} ({{ $book->user_mobile_no}})</td>
                                            <td>{{ $book->amount }}</td>
                                            <td>{{ $book->status }}</td>
                                            <td>{{ $book->payment_mode }}</td>
                                            <td>{{ $book->payment_type }}</td>
                                            <td>{{ $book->transaction_id }}</td>
                                            {{-- JSON fields --}}
                                            <td>{{ $r['mihpayid'] ?? 'N/A' }}</td>
                                            <td>{{ $r['request_id'] ?? 'N/A' }}</td>
                                            <td>{{ $r['bank_ref_num'] ?? 'N/A' }}</td>
                                            <td>{{ $r['amt'] ?? 'N/A' }}</td>
                                            <td>{{ $r['transaction_amount'] ?? 'N/A' }}</td>
                                            <td>{{ $r['txnid'] ?? 'N/A' }}</td>
                                            <td>{{ $r['productinfo'] ?? 'N/A' }}</td>
                                            <td>{{ $r['firstname'] ?? 'N/A' }}</td>
                                            <td>{{ $r['bankcode'] ?? 'N/A' }}</td>
                                            <td>{{ $r['field2'] ?? 'N/A' }}</td>
                                            <td>{{ $r['field9'] ?? 'N/A' }}</td>
                                            <td>{{ $r['error_code'] ?? 'N/A' }}</td>
                                            <td>{{ $r['addedon'] ?? 'N/A' }}</td>
                                            <td>{{ $r['payment_source'] ?? 'N/A' }}</td>
                                            <td>{{ $r['card_type'] ?? 'N/A' }}</td>
                                            <td>{{ $r['net_amount_debit'] ?? 'N/A' }}</td>
                                            <td>{{ $r['status'] ?? 'N/A' }}</td>
                                            <td>{{ $r['mode'] ?? 'N/A' }}</td>
                                            <td>{{ $r['PG_TYPE'] ?? 'N/A' }}</td>
                                            <td>{{ $r['card_no'] ?? 'N/A' }}</td>
                                            <td>{{ $r['unmappedstatus'] ?? 'N/A' }}</td>
                                            <td>{{ $r['Settled_At'] ?? 'N/A' }}</td>
                                            <td>{{ \Carbon\Carbon::parse($book->created_at)->format('d M Y h:i A') }}</td>
                                        </tr>
                                    @empty
                                        <tr>
                                            <td colspan="30" class="text-center">No transactions found.</td>
                                        </tr>
                                    @endforelse
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
