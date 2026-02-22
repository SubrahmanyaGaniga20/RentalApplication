<%@ page import="java.sql.*, com.carrental.util.DBConnection"%>
<%
    // Protect admin dashboard
    String admin = (String) session.getAttribute("adminLog");
    if (admin == null) {
        response.sendRedirect("adminlogin.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/style.css">
    <title>Admin Dashboard - Manage Rentals</title>
    <meta charset="UTF-8">
</head>
<body>

<h2>Admin Dashboard - Manage Rentals</h2>

<a href="add_car.jsp">Add New Car</a> |
<a href="view_feedback.jsp">View Feedback</a> |
<a href="LogoutServlet">Logout</a>

<hr>

<!-- ================= RECENT BOOKINGS ================= -->

<h3>Recent Bookings</h3>

<table border="1" cellpadding="8">
    <tr>
        <th>ID</th>
        <th>User Email</th>
        <th>Car ID</th>
        <th>Status</th>
        <th>Action</th>
    </tr>

<%
    try (Connection conn = DBConnection.getConnection();
         Statement stmt = conn.createStatement();
         ResultSet rs = stmt.executeQuery("SELECT * FROM booking ORDER BY BOOK_ID DESC")) {

        while (rs.next()) {
            String status = rs.getString("BOOK_STATUS");
%>
    <tr>
        <td><%= rs.getInt("BOOK_ID") %></td>
        <td><%= rs.getString("EMAIL") %></td>
        <td><%= rs.getInt("CAR_ID") %></td>
        <td><strong><%= status %></strong></td>
        <td>
            <%
                if ("UNDER PROCESSING".equals(status)) {
            %>
                <a href="ApproveBooking?id=<%= rs.getInt("BOOK_ID") %>">Approve</a>
            <%
                } else if ("APPROVED".equals(status)) {
            %>
                <a href="ReturnCar?id=<%= rs.getInt("BOOK_ID") %>">Return</a>
            <%
                } else {
            %>
                <span><%= status %></span>
            <%
                }
            %>
        </td>
    </tr>
<%
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

</table>

<hr>

<!-- ================= MANAGE CARS ================= -->

<h3>Manage Cars</h3>

<table border="1" cellpadding="8">
    <tr>
        <th>Car ID</th>
        <th>Car Name</th>
        <th>Fuel</th>
        <th>Price</th>
        <th>Available</th>
        <th>Action</th>
    </tr>

<%
    try (Connection conn = DBConnection.getConnection();
         Statement stmt = conn.createStatement();
         ResultSet rs = stmt.executeQuery("SELECT * FROM cars ORDER BY CAR_ID")) {

        while (rs.next()) {
%>
    <tr>
        <td><%= rs.getInt("CAR_ID") %></td>
        <td><%= rs.getString("CAR_NAME") %></td>
        <td><%= rs.getString("FUEL_TYPE") %></td>
        <td>&#8377;<%= rs.getInt("PRICE") %></td>
        <td><%= rs.getString("AVAILABLE") %></td>
        <td>
            <a href="DeleteCarServlet?id=<%= rs.getInt("CAR_ID") %>"
               onclick="return confirm('Are you sure you want to delete this car?');">
               Delete
            </a>
        </td>
    </tr>
<%
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

</table>

</body>
</html>