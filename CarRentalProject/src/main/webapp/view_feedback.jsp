<%@ page import="java.sql.*, com.carrental.util.DBConnection" %>
<html>
<head>

<link rel="stylesheet" href="css/style.css">
</head>
<body>
    <h2>User Feedback</h2>
    <table border="1">
        <tr><th>User Email</th><th>Comment</th></tr>
        <%
            try (Connection conn = DBConnection.getConnection();
                 Statement stmt = conn.createStatement();
                 ResultSet rs = stmt.executeQuery("SELECT * FROM feedback")) {
                while(rs.next()) {
        %>
        <tr>
            <td><%= rs.getString("EMAIL") %></td>
            <td><%= rs.getString("COMMENT") %></td>
        </tr>
        <% } } catch(Exception e) { e.printStackTrace(); } %>
    </table>
    <br><a href="admin_dashboard.jsp">Back to Dashboard</a>
</body>
</html>