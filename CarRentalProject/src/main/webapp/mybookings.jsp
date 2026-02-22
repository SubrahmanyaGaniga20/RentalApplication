<%@ page import="java.sql.*, com.carrental.util.DBConnection, com.carrental.model.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
    User user = (User) session.getAttribute("currentUser");
    if (user == null) { response.sendRedirect("login.jsp"); return; }
%>
<html>
<head><title>My Bookings</title>
<link rel="stylesheet" href="css/style.css"></head>
<body>
    <h2>Your Booking History</h2>
    <table border="1">
        <tr>
            <th>Car ID</th>
            <th>Book Date</th>
            <th>Return Date</th>
            <th>Total Price</th>
            <th>Status</th>
        </tr>
        <%
            try (Connection conn = DBConnection.getConnection()) {
                String sql = "SELECT * FROM booking WHERE EMAIL = ?";
                PreparedStatement ps = conn.prepareStatement(sql);
                ps.setString(1, user.getEmail());
                ResultSet rs = ps.executeQuery();
                
                while(rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("CAR_ID") %></td>
            <td><%= rs.getDate("BOOK_DATE") %></td>
            <td><%= rs.getDate("RETURN_DATE") %></td>
            <td>&#8377;<%= rs.getInt("PRICE") %></td>
            <td><strong><%= rs.getString("BOOK_STATUS") %></strong></td>
        </tr>
        <%
                }
            } catch(Exception e) { e.printStackTrace(); }
        %>
    </table>
    <br>
    <a href="dashboard.jsp">Back to Dashboard</a>
</body>
</html>