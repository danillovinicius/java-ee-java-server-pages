package com.learntoday.customtag;

import java.io.IOException;
import java.io.StringWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ResourceBundle;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class RatingsDisplayTag extends SimpleTagSupport {

	private String course;
	StringWriter writer = new StringWriter();

	public void setCourse(String course) {
		this.course = course;
	}

	public void doTag() throws JspException,IOException             {
	 	JspWriter out = getJspContext().getOut();
        Connection con = getConnection();
        String sql = "select count(username) as users, rating from ratings where coursetitle='"+course+"' group by rating";
        int userCount =0;
		int rating=0;
		int totalUserRating = 0;
		int totalUsers = 0;
		float courseRating= 0;
        try{
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);

			while(rs.next()) {
				userCount=rs.getInt("users");
				rating=rs.getInt("rating");
				totalUserRating+=userCount*rating;
				totalUsers+=userCount;
			}
			courseRating = totalUserRating/totalUsers;
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		System.out.println("Total count ::"+totalUserRating);
		System.out.println("Total Users ::"+totalUsers);
		
	    System.out.println("courseRating ::"+courseRating);
	    out.print(courseRating);
	}

	private Connection getConnection() {
	    Connection con = null;
	    try {
	        Class.forName("com.mysql.jdbc.Driver");
	        ResourceBundle resourceBundle = ResourceBundle.getBundle("i18n.resources");
			String databaseUrl = resourceBundle.getString("dbUrl");
			String user = resourceBundle.getString("dbUser");
			String pass = resourceBundle.getString("dbPwd");
			
			con = DriverManager.getConnection(databaseUrl, user, pass);
	    }catch(Exception ex) {
	        ex.printStackTrace();
	    }
	    return con;
	}

}