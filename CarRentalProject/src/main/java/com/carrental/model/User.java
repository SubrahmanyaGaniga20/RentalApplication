package com.carrental.model;

public class User {
	private String fname;
	private String lname;
	

	private String email;
	private String licNum;
	private long phoneNumber;
	private String password;
	private String gender;

	// Constructors
	public User() {
	}

	public User(String fname, String lname, String email, String licNum, long phoneNumber, String password,
			String gender) {
		this.fname = fname;
		this.lname = lname;
		this.email = email;
		this.licNum = licNum;
		this.phoneNumber = phoneNumber;
		this.password = password;
		this.gender = gender;
	}

	// Getters and Setters (Important for JSP to read data)
	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getLname() {
		return lname;
	}

	public void setLname(String lname) {
		this.lname = lname;
	}
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	// ... You can add the rest of the getters/setters here or let Eclipse generate
	// them
}