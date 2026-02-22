package com.carrental.controller;

import java.io.IOException;
import java.sql.*;

import com.carrental.util.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ReturnCar")
public class ReturnCarServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int bookId = Integer.parseInt(request.getParameter("id"));

        Connection conn = null;

        try {
            conn = DBConnection.getConnection();
            conn.setAutoCommit(false);

            // 1. Get CAR_ID from booking
            String getCarSql = "SELECT CAR_ID FROM booking WHERE BOOK_ID=?";
            PreparedStatement ps1 = conn.prepareStatement(getCarSql);
            ps1.setInt(1, bookId);
            ResultSet rs = ps1.executeQuery();

            int carId = 0;
            if (rs.next()) {
                carId = rs.getInt("CAR_ID");
            }

            // 2. Update booking status to RETURNED
            String returnSql =
                    "UPDATE booking SET BOOK_STATUS='RETURNED' WHERE BOOK_ID=?";
            PreparedStatement ps2 = conn.prepareStatement(returnSql);
            ps2.setInt(1, bookId);
            ps2.executeUpdate();

            // 3. Make car AVAILABLE again
            String carSql =
                    "UPDATE cars SET AVAILABLE='Y' WHERE CAR_ID=?";
            PreparedStatement ps3 = conn.prepareStatement(carSql);
            ps3.setInt(1, carId);
            ps3.executeUpdate();

            conn.commit();

            response.sendRedirect("admin_dashboard.jsp");

        } catch (Exception e) {
            try {
                if (conn != null) conn.rollback();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            e.printStackTrace();
        }
    }
}