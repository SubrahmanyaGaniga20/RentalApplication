package com.carrental.dao;

import java.sql.*;
import com.carrental.model.User;
import com.carrental.util.DBConnection;

public class UserDAO {
    
	public User validateUser(String email, String password) {
	    User user = null;
	    String hashedInput = DBConnection.hashPassword(password); // Hash it first!
	    String sql = "SELECT * FROM users WHERE EMAIL = ? AND PASSWORD = ?";
	    
	    try (Connection conn = DBConnection.getConnection();
	         PreparedStatement ps = conn.prepareStatement(sql)) {
	        
	        ps.setString(1, email);
	        ps.setString(2, hashedInput); 
	        
	        ResultSet rs = ps.executeQuery();
	        if (rs.next()) {
	            user = new User();
	            user.setFname(rs.getString("FNAME"));
	            user.setLname(rs.getString("LNAME"));
	            user.setEmail(rs.getString("EMAIL"));
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return user;
	}
}