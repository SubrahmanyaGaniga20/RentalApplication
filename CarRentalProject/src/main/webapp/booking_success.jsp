<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Booking Successful</title>
    <meta charset="UTF-8">

    <!-- Inline CSS ONLY for this page -->
    <style>
        body {
            margin: 0;
            padding: 0;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background: linear-gradient(120deg, #eef2f3, #d9e4f5);
            font-family: "Segoe UI", Arial, sans-serif;
        }

        .success-box {
            background: #ffffff;
            padding: 35px;
            width: 420px;
            text-align: center;
            border-radius: 14px;
            box-shadow: 0 15px 35px rgba(0,0,0,0.12);
        }

        .success-box h2 {
            color: #16a34a;
            margin-bottom: 12px;
        }

        .success-box p {
            color: #4b5563;
            font-size: 15px;
            margin-bottom: 25px;
        }

        .success-actions a {
            display: block;
            margin: 10px 0;
            padding: 10px;
            border-radius: 6px;
            font-size: 15px;
            text-decoration: none;
            transition: all 0.3s ease;
        }

        .btn-primary {
            background: linear-gradient(135deg, #2563eb, #1e40af);
            color: white;
        }

        .btn-primary:hover {
            background: linear-gradient(135deg, #1e40af, #2563eb);
        }

        .btn-secondary {
            background: #f1f5f9;
            color: #1f2937;
            border: 1px solid #cbd5e1;
        }

        .btn-secondary:hover {
            background: #e2e8f0;
        }
    </style>
</head>

<body>

<div class="success-box">
    <h2>Booking Successful 🎉</h2>

    <p>
        Your car has been successfully reserved.<br>
        You can track your booking status anytime.
    </p>

    <div class="success-actions">
        <a href="mybookings.jsp" class="btn-primary">
            View My Booking Status
        </a>

        <a href="dashboard.jsp" class="btn-secondary">
            Back to Dashboard
        </a>
    </div>
</div>

</body>
</html>