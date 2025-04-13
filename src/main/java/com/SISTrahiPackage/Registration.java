package com.SISTrahiPackage;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.*;
import java.sql.*;


@WebServlet("/register")
public class Registration extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		PrintWriter out = response.getWriter();

		String fName = request.getParameter("fName");
		String lName = request.getParameter("lName");
		String pword = request.getParameter("pword");
		String rpword = request.getParameter("rpword");
		String bdate = request.getParameter("bdate");
		String gender = request.getParameter("gender");
		String mail = request.getParameter("mail");
		String phone = request.getParameter("phone");

//		out.println(fName);
//		out.println(lName);
//		out.println(pword);
//		out.println(rpword);
//		out.println(bdate);
//		out.println(gender);
//		out.println(mail);
//		out.println(phone);
		
		RequestDispatcher dispatcher = null;
		Connection con = null;

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");

			String url = "jdbc:mysql://localhost:3306/busdb?useSSL = false";
			String username = "root";
			String password = "root";

		    con = DriverManager.getConnection(url, username, password);

			String q = "insert into user(fName,lName,pWord,bDate,gender,mail,phone) values(?,?,?,?,?,?,?)";
			
			PreparedStatement pstmt = con.prepareStatement(q);
			
			pstmt.setString(1, fName);
			pstmt.setString(2,lName);
			pstmt.setString(3, pword);
			pstmt.setString(4, bdate);
			pstmt.setString(5,gender);
			pstmt.setString(6,mail);
			pstmt.setString(7, phone);
			
			int rowCount = pstmt.executeUpdate();
			
			dispatcher = request.getRequestDispatcher("registration.jsp");
			if(rowCount>0)
			{
				request.setAttribute("status", "success");
//				System.out.println("Successfully Inserted");
			}
			else
			{
//				System.out.println("Mission Successfully Failed!");
				request.setAttribute("status", "failed");
			}
			
			dispatcher.forward(request,response);
			

		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}

}
