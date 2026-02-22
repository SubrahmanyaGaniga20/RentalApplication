package com.carrental.controller;

import java.io.IOException;
import java.sql.*;

import com.carrental.util.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ApproveBooking")
public class ApproveBooking extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int bookId = Integer.parseInt(request.getParameter("id"));

        Connection conn = null;

        try {
            conn = DBConnection.getConnection();
            conn.setAutoCommit(false); // START TRANSACTION

            // 1. Get CAR_ID for this booking
            String getCarSql = "SELECT CAR_ID FROM booking WHERE BOOK_ID = ?";
            PreparedStatement ps1 = conn.prepareStatement(getCarSql);
            ps1.setInt(1, bookId);
            ResultSet rs = ps1.executeQuery();

            int carId = 0;
            if (rs.next()) {
                carId = rs.getInt("CAR_ID");
            }

            // 2. Approve selected booking
            String approveSql =
                    "UPDATE booking SET BOOK_STATUS = 'APPROVED' WHERE BOOK_ID = ?";
            PreparedStatement ps2 = conn.prepareStatement(approveSql);
            ps2.setInt(1, bookId);
            ps2.executeUpdate();

            // 3. Reject all other pending bookings for same car
            String rejectSql =
                    "UPDATE booking SET BOOK_STATUS = 'REJECTED' " +
                    "WHERE CAR_ID = ? AND BOOK_STATUS = 'UNDER PROCESSING' AND BOOK_ID <> ?";
            PreparedStatement ps3 = conn.prepareStatement(rejectSql);
            ps3.setInt(1, carId);
            ps3.setInt(2, bookId);
            ps3.executeUpdate();

            // 4. Mark car as NOT AVAILABLE
            String updateCarSql =
                    "UPDATE cars SET AVAILABLE = 'N' WHERE CAR_ID = ?";
            PreparedStatement ps4 = conn.prepareStatement(updateCarSql);
            ps4.setInt(1, carId);
            ps4.executeUpdate();

            conn.commit(); // COMMIT TRANSACTION

            response.sendRedirect("admin_dashboard.jsp");

        } catch (Exception e) {
            try {
                if (conn != null) conn.rollback(); // ROLLBACK on error
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            e.printStackTrace();
        }
    }
}