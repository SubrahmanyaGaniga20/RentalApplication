package com.carrental.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.carrental.model.User;
import com.carrental.util.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/FeedbackServlet")
	public class FeedbackServlet extends HttpServlet {
	    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
	            throws ServletException, IOException {
	        
	        HttpSession session = request.getSession();
	        User user = (User) session.getAttribute("currentUser");
	        String comment = request.getParameter("comment");

	        try (Connection conn = DBConnection.getConnection()) {
	            String sql = "INSERT INTO feedback (EMAIL, COMMENT) VALUES (?,?)";
	            PreparedStatement ps = conn.prepareStatement(sql);
	            ps.setString(1, user.getEmail());
	            ps.setString(2, comment);
	            ps.executeUpdate();
	            response.sendRedirect("dashboard.jsp?msg=feedback_sent");
	        } catch (SQLException e) { e.printStackTrace(); }
	    }
	}

