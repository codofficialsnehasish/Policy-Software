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
        <h2>Customer Total Statement @if(!empty($start_date) && !empty($end_date)) From {{ formated_date($start_date) }} to {{ formated_date($end_date) }} @endif</h2>
        <table class="table">
            <thead>
                <tr>
                    <th class="text-wrap">Sl. No</th>
                    <th class="text-wrap">Customer ID</th>
                    <th class="text-wrap">Customer Name</th>
                    <th class="text-wrap">Opening Balance</th>
                    <th class="text-wrap">Cash Deposit</th>
                    <th class="text-wrap">Closing Balance</th>
                </tr>
            </thead>
            <tbody>
                @php 
                    $total_opening_balance = 0; 
                    $total_diposite_balance = 0; 
                    $total_closing_balance = 0; 
                @endphp
                @foreach($statements as $s)
                @php 
                    $total_opening_balance += $s['opening_balance'] ?? 00 ;
                    $total_diposite_balance += $s['cash_deposited'] ?? 00 ;
                    $total_closing_balance += $s['closing_balance'] ?? 00 ;
                @endphp
                    <tr>
                        <td>{{ $loop->iteration }}</td>
                        <td>{{ get_customer_id($s['customer_id']) }}</td>
                        <td>{{ $s['customer_name'] ?? '' }}</td>
                        <td>{{ $s['opening_balance'] ?? 0.00 }}</td>
                        <td>{{ $s['cash_deposited'] ?? 0.00 }}</td>
                        <td>{{ $s['closing_balance'] ?? 0.00 }}</td>
                    </tr>
                @endforeach
                <tr>
                    <td><strong>Total Amount</strong></td>
                    <td></td>
                    <td></td>
                    <td><strong>{{ $total_opening_balance }}</strong></td>
                    <td><strong>{{ $total_diposite_balance }}</strong></td>
                    <td><strong>{{ $total_closing_balance }}</strong></td>
                </tr>
            </tbody>
        </table>
    </div>
</body>
</html>
