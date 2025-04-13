package com.SISTrahiPackage;

import jakarta.servlet.*;

import java.io.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.sql.*;


@WebServlet("/login")
public class Login extends HttpServlet {
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String umail = request.getParameter("username");
		String pword = request.getParameter("pword");
		
		Connection con = null;
		HttpSession session = request.getSession();
		RequestDispatcher dispatcher = null;
		
		System.out.println("Hello Kartik, Speaking from Servlet");
		
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");	
		
		out.println("<html><body>");
		out.println("<h1>Kartik Jaiswal</h1>");
		out.println("</html></body>");
		
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");

			String url = "jdbc:mysql://localhost:3306/busdb?useSSL = false";
			String username = "root";
			String password = "root";

		    con = DriverManager.getConnection(url, username, password);

			String q = "select * from user where mail = ? and pWord = ?";
			
			PreparedStatement pstmt = con.prepareStatement(q);
			
			pstmt.setString(1, umail);
			pstmt.setString(2, pword);
			
			ResultSet set = pstmt.executeQuery();
			
			if(set.next()) {
				session.setAttribute("name", set.getString("fName"));
				dispatcher = request.getRequestDispatcher("index.jsp");
			}
			else 
			{
				request.setAttribute("status", "failed");
				dispatcher = request.getRequestDispatcher("login.jsp");
			}  
			
			dispatcher.forward(request,response);
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
