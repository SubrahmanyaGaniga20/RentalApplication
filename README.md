🚗 Car Rental Management System
📌 Project Overview

The Car Rental Management System is a Java-based web application developed using Servlets, JSP, JDBC, and Maven following the MVC architecture.
It allows users to register, log in, book cars, return cars, and provide feedback, while admins can manage cars, approve bookings, and view feedback.

This project is suitable for academic submissions, mini-projects, and placement interviews.

🧠 Key Features
👤 User Features
1. User Registration & Login
2. View available cars
3. Book a car
4. View booking history
5. Return booked cars
6. Submit feedback
7. Logout securely

🛠️ Admin Features
1. Admin Login
2. Add new cars
3. Delete existing cars
4. Approve or reject bookings
5. View user feedback
6. Admin dashboard

🧱 Project Architecture

The project follows MVC (Model–View–Controller) architecture:
Controller → Servlets handle requests
Model → Java classes represent data
DAO → Database interaction using JDBC
View → JSP pages for UI


🛠️ Technology Stack

Layer	                     Technology
------                     ------------
Language	                 Java (JDK 8)
Backend	                   Java Servlets
Frontend	                 JSP, HTML, CSS
Database	                 MySQL
Build Tool                 Maven
Server	                   Apache Tomcat
IDE                      	 Eclipse / IntelliJ


⚙️ Prerequisites

1. Before running the project, ensure you have:
2. Java JDK 8+
3. Apache Tomcat 9+
4. MySQL Server
5. Maven
6. IDE (Eclipse / IntelliJ)


💽 Database Setup

1. Create a database:

CREATE DATABASE car_rental_db;

2. Create required tables (users, cars, bookings, feedback, admin).

3. Update database credentials in your DB utility class:

String url = "jdbc:mysql://localhost:3306/car_rental_db";
String username = "root";
String password = "your_password";

🚀 How to Run the Project

1. Clone the repository
   git clone https://github.com/SubrahmanyaGaniga20/RentalApplication.git

2.Import into IDE as Maven Project
3.Configure Tomcat Server
4.Run the project
Right-click project → Run on Server
5.Open browser:
http://localhost:8080/CarRentalProject

🔐 Default Roles

User → Can register and book cars
Admin → Manages cars and bookings


📸 Screens (Optional)

1. Login Page
2. User Dashboard
3. Admin Dashboard
4. Booking Page
5. Feedback Page

🎯 Learning Outcomes
1. Hands-on experience with Servlets & JSP
2. MVC architecture understanding
3. JDBC & database connectivity
4. Session management
5. Web application deployment using Tomcat

📄 License

This project is created for educational purposes.
Free to use and modify.

👨‍💻 Author

Subrahmanya Ganiga
GitHub: https://github.com/SubrahmanyaGaniga20




   




