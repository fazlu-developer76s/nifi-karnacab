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
                                <div class="col-md-7">

                                </div>

                                <div class="col-md-3">
                                    <form action="{{ route('transaction.list') }}" method="GET" enctype="multipart/form-data">
                                    @csrf
                                <select name="type" class="form-control">
                                    <option value="">Select User</option>
                                    @foreach($get_user as $row)
                                    <option value="{{ $row->id }}"  {{ (isset($_GET['type']) && $_GET['type'] == $row->id) ? 'selected' : '' ;  }}>{{ $row->name }} ({{ $row->mobile_no }})</option>
                                    @endforeach;
                                </select>
                                    <input type="submit">
                                    <a href="{{ route('transaction.list') }}"><input type="button" value="Clear"></a>
                                </form>
                                </div>
                                 <div class="col-md-1">

                                </div>
                            </div>
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Full Name</th>
                                    <th>Phone</th>
                                    <th>Bank</th>
                                    <th>Account No</th>
                                    <th>UPI ID</th>
                                    <th>Vehicle Type</th>
                                    <th>Vehicle Number</th>
                                    <th>Amount</th>
                                    <th>Created At</th>
                                    <th>Payment Status</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                @forelse ($alltransaction as $book)
                                    <tr>
                                        <td>{{ $loop->iteration }}</td>
                                        <td>{{ optional($book->get_user_info)->name }}</td>
                                        <td>{{ optional($book->get_user_info)->mobile_no }}</td>
                                        <td>{{ optional($book->get_bank_info)->bank_name }}</td>
                                        <td>{{ optional($book->get_bank_info)->account_no }}</td>
                                        <td>{{ optional($book->get_bank_info)->upi_id }}</td>
                                        <td>{{ optional($book->get_booking_info)->vehicle_type }}</td>
                                        <td>{{ optional($book->get_booking_info)->vehicle_number }}</td>
                                        <td>
                                            @if ($book->amount)
                                                {{ $book->amount . ' ₹' }}
                                            @else
                                                <input type="number" id="transaction_amount{{ $book->id }}" placeholder="Enter amount">
                                            @endif
                                        </td>
                                        {{-- <td>{{ $book->created_at ? $book->created_at->format('d F Y h:i A') : 'N/A' }}</td> --}}
                                        <td>{{ \Carbon\Carbon::parse(@$book->created_at)->format('d F Y h:i A') ?? 'N/A' }}</td>
                                        <td>
                                            <select id="payment_status{{ $book->id }}" onchange="updatePaymentStatus('{{ $book->id }}')">
                                                @if($book->transaction_status == 1)
                                                <option value="1" {{ $book->transaction_status == 1 ? 'selected' : '' }}>Pending</option>
                                                @endif
                                                <option value="2" {{ $book->transaction_status == 2 ? 'selected' : '' }}>Paid</option>
                                            </select>
                                        </td>
                                        <td>
                                            @if ($book->transaction_status == 1)
                                                <input type="file" accept=".pdf" id="file_upload{{ $book->id }}">
                                            @else
                                            <a href="{{ Storage::url($book->file) }}" class="btn btn-primary" target="_blank">
                                                <i class="fas fa-download"></i> View Invoice
                                            </a>

                                                {{-- <a href="{{ route('generate.invoice', $book->id) }}" class="btn btn-primary">
                                                    <i class="fas fa-download"></i> Download Invoice
                                                </a> --}}
                                            @endif
                                        </td>
                                    </tr>
                                @empty
                                    <tr>
                                        <td colspan="12" class="text-center">No transactions found.</td>
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
