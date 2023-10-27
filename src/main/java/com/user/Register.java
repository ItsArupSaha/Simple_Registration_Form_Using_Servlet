package com.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter outPrintWriter = response.getWriter();

		String emailString = request.getParameter("email");
		String passwordString = request.getParameter("password");
		
		//connection
		try {
			
			Thread.sleep(2000);
			
			Class.forName("com.mysql.jdbc.Driver");
			
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/register", "root", "1234");
			
			//query
			String qString = "insert into user(email, password) values(?, ?)";
			
			PreparedStatement preparedStatement = connection.prepareStatement(qString);
			preparedStatement.setString(1, emailString);
			preparedStatement.setString(2, passwordString);
			
			//fire query
			preparedStatement.executeUpdate();
			outPrintWriter.println("Registered!");
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			outPrintWriter.println("Error!");
		}
		
	}

}
