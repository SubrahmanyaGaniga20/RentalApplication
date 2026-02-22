<%@ page import="java.sql.*, com.carrental.util.DBConnection, com.carrental.model.User" %>
<%@ page contentType="text/html; charset=UTF-8"%>

<%
    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Car Rental - Dashboard</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<!-- NAVBAR -->
<div class="navbar">
    <div>
        Welcome, <strong><%= user.getEmail() %></strong>
    </div>
    <div class="links">
        <a href="mybookings.jsp">My Bookings</a>
        <a href="feedback.jsp">Give Feedback</a>
        <a href="LogoutServlet">Logout</a>
    </div>
</div>

<%
    if ("feedback_sent".equals(request.getParameter("msg"))) {
%>
    <p class="success">Thank you for your feedback!</p>
<%
    }
%>

<h2>Available Cars</h2>

<div class="cards-container">
<%
    try (Connection conn = DBConnection.getConnection();
         Statement stmt = conn.createStatement();
         ResultSet rs = stmt.executeQuery("SELECT * FROM cars WHERE AVAILABLE = 'Y'")) {

        while (rs.next()) {
%>
    <div class="car-card">
        <img src="images/<%= rs.getString("CAR_IMG") %>" alt="Car Image">
        <h3><%= rs.getString("CAR_NAME") %></h3>
        <p><strong>Fuel:</strong> <%= rs.getString("FUEL_TYPE") %></p>
        <p><strong>Price:</strong> &#8377;<%= rs.getInt("PRICE") %>/day</p>
        <a href="book.jsp?id=<%= rs.getInt("CAR_ID") %>" class="book-btn">Book Now</a>
    </div>
<%
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
</div>

</body>
</html>