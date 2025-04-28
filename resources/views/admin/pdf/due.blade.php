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
        <h2>Due Payments</h2>
        <table class="table">
            <thead>
                <tr>
                    <th>Sl. No</th>
                    <th>Customer ID</th>
                    <th>Customer Name</th>
                    {{-- <th>Policy No.</th> --}}
                    <th>Total Deposit Received</th>
                    <th>Total Policy Paid</th>
                    <th>Due</th>
                </tr>
            </thead>
            <tbody>
                @php 
                    $total_deposit_recived = 0;
                    $total_policy_paid = 0;
                    $total_due = 0;
                @endphp
                @foreach($alldata as $data)
                @php 
                    $total_deposit_recived += $data->total_credit;
                    $total_policy_paid += $data->total_debit;
                    $total_due += $data->balance;
                @endphp
                <tr>
                    <td>{{ $loop->iteration }}</td>
                    <td>{{ get_customer_id($data->customer_id) }}</td>
                    <td>{{ get_name('customers', $data->customer_id) }}</td>
                    {{-- <td>{{ $data->policy_number != 0 ? $data->policy_number : '' }}</td> --}}
                    <td>{{ number_format($data->total_credit, 2) }}</td>
                    <td>{{ number_format($data->total_debit, 2) }}</td>
                    <td>{{ number_format($data->balance, 2) }}</td>
                </tr>
                @endforeach
            </tbody>
            <tfoot>
                <tr>
                    <td colspan="3">Total:</td>
                    <td>{{ number_format($total_deposit_recived, 2) }}</td>
                    <td>{{ number_format($total_policy_paid, 2) }}</td>
                    <td>{{ number_format($total_due, 2) }}</td>
                </tr>
            </tfoot>
        </table>
        
        <p>Total Due Amount : {{ $total_due }}</p>
    </div>
</body>
</html>
