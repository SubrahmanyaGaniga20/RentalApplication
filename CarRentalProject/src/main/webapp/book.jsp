<%@ page import="java.sql.*, com.carrental.util.DBConnection" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/style.css">
    <title>Book Your Car</title>
    <meta charset="UTF-8">

    <!-- ✅ Simple JavaScript Validation -->
    <script>
        function validateBooking() {
            const bookDate = document.getElementById("bookDate").value;
            const duration = document.getElementById("duration").value;

            if (!bookDate) {
                alert("Please select a booking date.");
                return false;
            }

            // Prevent past date booking
            const today = new Date();
            today.setHours(0,0,0,0);
            const selectedDate = new Date(bookDate);

            if (selectedDate < today) {
                alert("Booking date cannot be in the past.");
                return false;
            }

            if (duration <= 0) {
                alert("Duration must be at least 1 day.");
                return false;
            }

            return true; // allow form submission
        }
    </script>
</head>

<body>

<%
    String carId = request.getParameter("id");
%>

<h2>Complete Your Booking</h2>

<form action="BookingServlet" method="post" onsubmit="return validateBooking();">
    <input type="hidden" name="car_id" value="<%= carId %>">

    <label>Booking Place:</label><br>
    <input type="text" name="place" required><br><br>

    <label>Destination:</label><br>
    <input type="text" name="destination" required><br><br>

    <label>Booking Date:</label><br>
    <input type="date" name="date" id="bookDate" required><br><br>

    <label>Duration (Days):</label><br>
    <input type="number" name="duration" id="duration" min="1" required><br><br>

    <label>Phone Number:</label><br>
    <input type="number" name="phone" required><br><br>

    <h3>Payment Details</h3>

    <label>Card Number:</label><br>
    <input type="text" name="card_no" pattern="[0-9]{16}" required><br><br>

    <label>Expiry Date (MM/YY):</label><br>
    <input type="text" name="exp_date" placeholder="MM/YY" required><br><br>

    <label>CVV:</label><br>
    <input type="password" name="cvv" pattern="[0-9]{3}" required><br><br>

    <button type="submit">Confirm & Pay</button>
</form>

</body>
</html>