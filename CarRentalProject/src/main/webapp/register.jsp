<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Registration</title>
    <link rel="stylesheet" href="css/style.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
        }
        
        
        h2 {
            text-align: center;
        }
        input, select {
            width: 100%;
            padding: 8px;
            margin: 8px 0;
        }
        .btn {
            background-color: #007bff;
            color: white;
            border: none;
            cursor: pointer;
        }
        .btn:hover {
            background-color: #0056b3;
        }
        .msg {
            color: red;
            text-align: center;
        }
    </style>
</head>
<body>

<div class="container">
<center>
    <h2>Register</h2></center>

    <% 
        String msg = request.getParameter("msg");
        if ("failed".equals(msg)) {
    %>
        <p class="msg">Registration Failed. Try Again!</p>
    <% } %>

    <form action="RegisterServlet" method="post">
        <input type="text" name="fname" placeholder="First Name" required>
        <input type="text" name="lname" placeholder="Last Name" required>
        <input type="email" name="email" placeholder="Email" required>
        <input type="text" name="lic_num" placeholder="License Number" required>
        <input type="text" name="phone" placeholder="Phone Number" required>
        <input type="password" name="password" placeholder="Password" required>

        <select name="gender" required>
            <option value="">Select Gender</option>
            <option value="MALE">Male</option>
            <option value="FEMALE">Female</option>
            <option value="OTHER">Other</option>
        </select>

        <input type="submit" value="Register" class="btn">
    </form>

    <p style="text-align:center;">
        Already registered? <a href="login.jsp">Login</a>
    </p>
</div>

</body>
</html>