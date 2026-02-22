<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTFUTF-8">
    <title>Add New Car</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<div class="login-page">

    <h2>Add New Car</h2>

    

        <form action="AddCarServlet" method="post" enctype="multipart/form-data">
            <input type="text" name="carname" placeholder="Car Name" required>

            <input type="text" name="fuel" placeholder="Fuel (Petrol/Diesel)" required>

            <input type="number" name="capacity" placeholder="Capacity" required>

            <input type="number" name="price" placeholder="Price Per Day" required>

            <input type="file" name="image" required>

            <button type="submit">Add Car</button>
        </form>

   

</div>

</body>
</html>