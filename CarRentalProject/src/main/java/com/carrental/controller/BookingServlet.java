package com.carrental.controller;

import java.io.IOException;
import java.sql.*;

import com.carrental.model.User;
import com.carrental.util.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/BookingServlet")
public class BookingServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("currentUser");
        
        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int carId = Integer.parseInt(request.getParameter("car_id"));
        String place = request.getParameter("place");
        String destination = request.getParameter("destination");
        String date = request.getParameter("date");
        int duration = Integer.parseInt(request.getParameter("duration"));
        long phone = Long.parseLong(request.getParameter("phone"));
        
        // Payment info
        String cardNo = request.getParameter("card_no");
        String expDate = request.getParameter("exp_date");
        int cvv = Integer.parseInt(request.getParameter("cvv"));

        Connection conn = null;
        try {
            conn = DBConnection.getConnection();
            conn.setAutoCommit(false); // Start Transaction

            // 1. Get Car Price to calculate total
            PreparedStatement psPrice = conn.prepareStatement("SELECT PRICE FROM cars WHERE CAR_ID = ?");
            psPrice.setInt(1, carId);
            ResultSet rs = psPrice.executeQuery();
            int pricePerDay = 0;
            if(rs.next()) pricePerDay = rs.getInt("PRICE");
            int totalPrice = pricePerDay * duration;

            // 2. Insert into Booking Table
            String bookSql = "INSERT INTO booking (CAR_ID, EMAIL, BOOK_PLACE, BOOK_DATE, DURATION, PHONE_NUMBER, DESTINATION, RETURN_DATE, PRICE, BOOK_STATUS) VALUES (?,?,?,?,?,?,?,DATE_ADD(?, INTERVAL ? DAY),?,'UNDER PROCESSING')";
            PreparedStatement psBook = conn.prepareStatement(bookSql, Statement.RETURN_GENERATED_KEYS);
            psBook.setInt(1, carId);
            psBook.setString(2, user.getEmail());
            psBook.setString(3, place);
            psBook.setString(4, date);
            psBook.setInt(5, duration);
            psBook.setLong(6, phone);
            psBook.setString(7, destination);
            psBook.setString(8, date);
            psBook.setInt(9, duration);
            psBook.setInt(10, totalPrice);
            psBook.executeUpdate();

            // Get the new Book_ID
            ResultSet generatedKeys = psBook.getGeneratedKeys();
            if (generatedKeys.next()) {
                int bookId = generatedKeys.getInt(1);

                // 3. Insert into Payment Table
                String paySql = "INSERT INTO payment (BOOK_ID, CARD_NO, EXP_DATE, CVV, PRICE) VALUES (?,?,?,?,?)";
                PreparedStatement psPay = conn.prepareStatement(paySql);
                psPay.setInt(1, bookId);
                psPay.setString(2, cardNo);
                psPay.setString(3, expDate);
                psPay.setInt(4, cvv);
                psPay.setInt(5, totalPrice);
                psPay.executeUpdate();
            }

            conn.commit(); // Save everything
            response.sendRedirect("booking_success.jsp");

        } catch (Exception e) {
            if (conn != null) try { conn.rollback(); } catch (SQLException ex) { ex.printStackTrace(); }
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}