<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        .table-container {
            width: 100%;
            margin: 0 auto;
            padding: 20px;
        }
        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }
        .table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        .table thead {
            background-color: #007BFF;
            color: white;
        }
        .table thead th {
            padding: 10px;
            text-align: left;
            font-size: 12px;
        }
        .table tbody tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        .table tbody tr td {
            padding: 8px;
            text-align: left;
            font-size: 12px;
        }
        .table tfoot {
            font-weight: bold;
        }
        .table tfoot tr td {
            padding: 10px;
            border-top: 2px solid #007BFF;
            background-color: #f1f1f1;
        }
        .compact {
            page-break-inside: avoid;
        }
    </style>
</head>
<body>
    <div class="table-container">
        <h2>Month Wise Statement @if(!empty($start_date) && !empty($end_date)) From {{ formated_date($start_date) }} to {{ formated_date($end_date) }} @endif</h2>
        <table class="table">
            <thead>
                <tr>
                    <th>Sl.No</th>
                    <th>Policy Number</th>
                    <th>Customer Name</th>
                    <th>Customer ID</th>
                    <th>Amount</th>
                    <th>Payment Mode</th>
                    <th>Transaction Date</th>
                </tr>
            </thead>
            <tbody>
                @php $i = 1 @endphp
                @foreach ($policyPaymentModes as $s)
                    <tr>
                        <td>{{ $i++ }}</td>
                        <td>{{ $s->policy_number }}</td>
                        <td>{{ $s->customer_name }}</td>
                        <td>{{ get_customer_id($s->customer_id) }}</td>
                        <td>{{ $s->amount }}</td>
                        <td>{{ get_name('payment_modes',$s->payment_mode) }}</td>
                        <td>{{ formated_date($s->payment_date) }}</td>
                    </tr>
                @endforeach
            </tbody>
            <tfoot>
                <tr>
                    <td colspan="4">Total:</td>
                    <td colspan="3">{{ $totalAmount }}</td>
                </tr>
            </tfoot>
        </table>
    </div>
</body>
</html>
