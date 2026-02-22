package com.carrental.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import jakarta.servlet.http.Part;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.carrental.util.DBConnection;

@WebServlet("/AddCarServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, maxFileSize = 1024 * 1024 * 10) 
public class AddCarServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String name = request.getParameter("carname");
        String fuel = request.getParameter("fuel");
        int capacity = Integer.parseInt(request.getParameter("capacity"));
        int price = Integer.parseInt(request.getParameter("price"));
        Part filePart = request.getPart("image");
        String fileName = filePart.getSubmittedFileName();

        // Save image to folder
        String path = getServletContext().getRealPath("/images") + "/" + fileName;
        filePart.write(path);

        try (Connection conn = DBConnection.getConnection()) {
            String sql = "INSERT INTO cars (CAR_NAME, FUEL_TYPE, CAPACITY, PRICE, CAR_IMG, AVAILABLE) VALUES (?,?,?,?,?,'Y')";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, fuel);
            ps.setInt(3, capacity);
            ps.setInt(4, price);
            ps.setString(5, fileName);
            ps.executeUpdate();
            response.sendRedirect("admin_dashboard.jsp?msg=car_added");
        } catch (SQLException e) { e.printStackTrace(); }
    }
}