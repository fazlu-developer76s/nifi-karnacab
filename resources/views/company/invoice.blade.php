<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Invoice</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .invoice-box {
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            border: 1px solid #ddd;
            background-color: #fff;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }

        .company-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
            border-bottom: 2px solid #eee;
            padding-bottom: 10px;
        }

        .company-header img {
            max-height: 80px;
        }

        .company-details h2 {
            margin: 0;
            color: #333;
        }

        .company-details p {
            margin: 0;
            font-size: 14px;
            color: #777;
        }

        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        table th, table td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        table th {
            background-color: #f8f8f8;
            font-weight: bold;
        }

        .total-row {
            font-weight: bold;
        }

        .footer-note {
            margin-top: 30px;
            font-size: 12px;
            color: #777;
            text-align: center;
        }
    </style>
</head>
<body>

<div class="invoice-box">
    <!-- Company Header -->
    <div class="company-header">
        <div class="company-details">
            <h2>{{ ($company_info->name) ? $company_info->name : 'N/A'; }}</h2>
            <h2>{{ ($company_info->address) ? $company_info->address : 'N/A'; }}</h2>
            <p>GST No:  {{ ($company_info->gst_no) ? $company_info->gst_no : 'N/A'; }}</p>
        </div>
        <div class="company-logo" style="margin-top: 10px; ">
            <img src="storage/{{ ($company_info->logo) ? $company_info->logo : 'N/A'; }}" alt="Company Logo">
        </div>
    </div>

    <!-- Invoice Details -->
    <h1>Invoice</h1>
    <p><strong>Invoice No:</strong> {{ '00'.$invoice[0]->id }}</p>
    <p><strong>Date:</strong>{{ \Carbon\Carbon::parse($invoice[0]->created_at)->format('d-m-Y') }}</p>
    <p><strong>Customer Name:</strong> {{ ($invoice[0]->get_user_info->name) ? $invoice[0]->get_user_info->name : 'N/A' ; }}</p>
    <p><strong>GST No:</strong>  {{ ($invoice[0]->get_user_info->gst_no) ? $invoice[0]->get_user_info->gst_no : 'N/A' ; }}</p>

    <!-- Invoice Table -->
    <table>
        <tr>
            <th>Description</th>
            <th>Amount</th>
        </tr>
        <tr>
            <td>{{ ($invoice[0]->get_booking_info->vehicle_type) ? $invoice[0]->get_booking_info->vehicle_type : 'N/A' ; }}/{{ ($invoice[0]->get_booking_info->vehicle_number) ? $invoice[0]->get_booking_info->vehicle_number : 'N/A' ; }}</td>
            <td>{{ ($invoice[0]->amount) ? $invoice[0]->amount : 'N/A' ;  }}</td>
        </tr>
        {{-- <tr>
            <td>GST (18%)</td>
            <td>{{ 20 }}</td>
        </tr> --}}
        <tr class="total-row">
            <td>Total Amount</td>
            <td>{{ ($invoice[0]->amount) ? $invoice[0]->amount : 'N/A' ;  }}</td>

        </tr>
    </table>

    <!-- Footer Note -->
    <p class="footer-note">This is a computer-generated invoice and does not require a signature.</p>
</div>

</body>
</html>
