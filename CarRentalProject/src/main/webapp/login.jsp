<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Car Rental - Login</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<div class="login-page">

    <!-- SINGLE CARD ONLY -->
    <div class="login-container">

        <h2>User Login</h2>

        <%-- Error message --%>
        <p class="error">${errorMessage}</p>

        <form action="LoginServlet" method="post">
            <input type="email" name="email" placeholder="Enter Email" required>
            <input type="password" name="password" placeholder="Enter Password" required>
            <button type="submit">Login</button>
        </form>

    </div>

    <!-- LINKS OUTSIDE CARD -->
    <div class="login-links">
        <p>
            Don’t have an account?
            <a href="register.jsp">Register here</a>
        </p>

        <a href="adminlogin.jsp" class="admin-link">
            Login as Admin
        </a>
    </div>

</div>

</body>
</html>