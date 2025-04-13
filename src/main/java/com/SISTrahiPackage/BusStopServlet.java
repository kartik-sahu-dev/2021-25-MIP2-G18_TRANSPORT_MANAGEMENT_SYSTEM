package com.SISTrahiPackage;

import jakarta.servlet.*;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.*;
import java.sql.*;

public class BusStopServlet extends HttpServlet {

	String bStop;
	int busNum;

	String s1;
	String s2;
	String s3;
	String s4;
	String s5;

	String dName;
	String sName;
	String dContact;
	String sContact;

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		bStop = req.getParameter("busStop");
		
		System.out.println(bStop);

		PrintWriter out = res.getWriter();
		res.setContentType("text/html");

		out.println("<html><body>");
		out.println("<h1> Kartik Jaiswal </h1>");

		

		try {

			Class.forName("com.mysql.cj.jdbc.Driver");

			String url = "jdbc:mysql://localhost:3306/busDB";
			String username = "root";
			String password = "root";

			Connection con = DriverManager.getConnection(url, username, password);

			String q = "SELECT busID from busnumber where (stop1='" + bStop + "' or stop2 = '" + bStop + "' or stop3 = '"
					+ bStop + "' or stop4='" + bStop + "' or stop5='" + bStop + "')";
//			AND fuel = 'CNG'
            
//			System.out.println("Value of Q is:------------------------"+q);
			Statement stmt = con.createStatement();
			ResultSet set = stmt.executeQuery(q);
			
			

			if (set.isBeforeFirst()) {
				out.println("<h1>Following are the Bus Number which passes by: " + bStop + "</h1>");
				while (set.next()) {

					busNum = set.getInt(1);

					out.println("<h3>BusNumber: " + busNum + "</h3>");

					out.println("</br>");
				}
				
			} else {
				out.println("<h1>There is no Bus which passes by: " + bStop + "</h1>");
			}

			

			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		out.print("</html></body>");

	}

}
