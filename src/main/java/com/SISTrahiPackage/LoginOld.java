package com.SISTrahiPackage;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;



public class LoginOld extends HttpServlet{
	String name;
	String password;
	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		name = req.getParameter("username");
		password = req.getParameter("pword");
		PrintWriter out = res.getWriter();
		res.setContentType("text/html");
		
		if(name.equals("kartik")&& password.equals("jaiswal")) {
			RequestDispatcher rd = req.getRequestDispatcher("index.html");
			rd.forward(req, res);
			 
		}else {
			String stmt = "Invalid Credentials!";
			out.print("<html><body> <h2 align='center' style='color:red'>Invalid Credentials!</h2></body></html");
			RequestDispatcher rd = req.getRequestDispatcher("login.html");
			rd.include(req, res);
		}
	}	 
		
}