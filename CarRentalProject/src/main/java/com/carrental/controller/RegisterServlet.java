package com.carrental.controller;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;



import com.carrental.util.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String email = request.getParameter("email");
        String lic = request.getParameter("lic_num");
        long phone = Long.parseLong(request.getParameter("phone"));
        String pass = DBConnection.hashPassword(request.getParameter("password"));
        String gender = request.getParameter("gender");

        try (Connection conn = DBConnection.getConnection()) {
            String sql = "INSERT INTO users (FNAME, LNAME, EMAIL, LIC_NUM, PHONE_NUMBER, PASSWORD, GENDER) VALUES (?,?,?,?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, fname);
            ps.setString(2, lname);
            ps.setString(3, email);
            ps.setString(4, lic);
            ps.setLong(5, phone);
            ps.setString(6, pass);
            ps.setString(7, gender);
            
            int result = ps.executeUpdate();
            if (result > 0) {
                response.sendRedirect("login.jsp?msg=success");
            } else {
                response.sendRedirect("register.jsp?msg=failed");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}