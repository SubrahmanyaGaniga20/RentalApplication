🚗 Car Rental Management System
📌 Project Overview

The Car Rental Management System is a Java-based web application developed using Servlets, JSP, JDBC, and Maven following the MVC architecture.
It allows users to register, log in, book cars, return cars, and provide feedback, while admins can manage cars, approve bookings, and view feedback.

This project is suitable for academic submissions, mini-projects, and placement interviews.

🧠 Key Features
👤 User Features
--->User Registration & Login
--->View available cars
--->Book a car
--->View booking history
--->Return booked cars
--->Submit feedback
--->Logout securely

🛠️ Admin Features
--->Admin Login
--->Add new cars
--->Delete existing cars
--->Approve or reject bookings
--->View user feedback
--->Admin dashboard

🧱 Project Architecture

The project follows MVC (Model–View–Controller) architecture:
Controller → Servlets handle requests
Model → Java classes represent data
DAO → Database interaction using JDBC
View → JSP pages for UI

📂 Project Structure

CarRentalProject/
│
├── src/main/java
│   └── com.carrental
│       ├── controller
│       │   ├── AddCarServlet.java
│       │   ├── AdminLoginServlet.java
│       │   ├── ApproveBooking.java
│       │   ├── BookingServlet.java
│       │   ├── DeleteCarServlet.java
│       │   ├── FeedbackServlet.java
│       │   ├── LoginServlet.java
│       │   ├── LogoutServlet.java
│       │   ├── RegisterServlet.java
│       │   └── ReturnCarServlet.java
│       │
│       ├── dao
│       ├── model
│       └── util
│
├── src/main/webapp
│   ├── css/
│   ├── images/
│   ├── WEB-INF/
│   ├── add_car.jsp
│   ├── admin_dashboard.jsp
│   ├── adminlogin.jsp
│   ├── book.jsp
│   ├── booking_success.jsp
│   ├── dashboard.jsp
│   ├── feedback.jsp
│   ├── login.jsp
│   ├── mybookings.jsp
│   ├── register.jsp
│   └── view_feedback.jsp
│
├── src/test/java
├── src/test/resources
├── pom.xml
└── README.md


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

--->Before running the project, ensure you have:
--->Java JDK 8+
--->Apache Tomcat 9+
--->MySQL Server
--->Maven
--->IDE (Eclipse / IntelliJ)


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

--->Login Page
--->User Dashboard
--->Admin Dashboard
--->Booking Page
--->Feedback Page

🎯 Learning Outcomes
--->Hands-on experience with Servlets & JSP
--->MVC architecture understanding
--->JDBC & database connectivity
--->Session management
--->Web application deployment using Tomcat

📄 License

This project is created for educational purposes.
Free to use and modify.

👨‍💻 Author

Subrahmanya Ganiga
GitHub: https://github.com/SubrahmanyaGaniga20




   




