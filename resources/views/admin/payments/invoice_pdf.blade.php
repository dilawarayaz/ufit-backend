<!DOCTYPE html>
<html>

<head>
    <title>Invoice #{{ $payment->id }}</title>
    <style>
        body {
            font-family: DejaVu Sans, sans-serif;
        }

        .header {
            text-align: center;
            margin-bottom: 30px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th,
        td {
            border: 1px solid #000;
            padding: 8px;
        }

        th {
            background: #eee;
        }
    </style>
</head>

<body>
    <div class="header">
        <h1>Invoice #{{ $payment->id }}</h1>
        <p>Date: {{ $payment->created_at->format('d M, Y') }}</p>
    </div>

    <p><strong>User:</strong> {{ $payment->user ? $payment->user->first_name . '' . $payment->user->last_name : 'N/A' }}</p>
    <p><strong>Gym:</strong> {{ $payment->gym ? $payment->gym->name : 'N/A' }}</p>
    <p><strong>Status:</strong> {{ ucfirst($payment->status) }}</p>

    <table>
        <tr>
            <th>Amount</th>
            <td>${{ number_format($payment->amount, 2) }}</td>
        </tr>
        <tr>
            <th>Payment Method</th>
            <td>{{ $payment->payment_method ?? '-' }}</td>
        </tr>
        <tr>
            <th>Transaction ID</th>
            <td>{{ $payment->transaction_id ?? '-' }}</td>
        </tr>
        <tr>
            <th>Notes</th>
            <td>{{ $payment->notes ?? '-' }}</td>
        </tr>
    </table>
</body>

</html>