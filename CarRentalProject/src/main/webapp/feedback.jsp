<%@ page import="com.carrental.model.User" %>
<%@ page contentType="text/html; charset=UTF-8" %>

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
<link rel="stylesheet" href="css/style.css">
    <title>Give Feedback</title>
    <meta charset="UTF-8">
</head>
<body>

<h2>User Feedback</h2>

<form action="FeedbackServlet" method="post">
    <p><strong>User:</strong> <%= user.getEmail() %></p>

    <label>Your Feedback:</label><br><br>
    <textarea name="comment" rows="5" cols="50" required></textarea><br><br>

    <input type="submit" value="Submit Feedback">
</form>

<br>
<center>
<a href="dashboard.jsp">Back to Dashboard</a>
</center>

</body>
</html>