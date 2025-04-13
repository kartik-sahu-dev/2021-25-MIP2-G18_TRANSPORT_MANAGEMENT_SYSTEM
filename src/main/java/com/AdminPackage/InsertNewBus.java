package com.AdminPackage;

import java.sql.*;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.*;

@WebServlet("/SubmitFormServlet")
public class InsertNewBus extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");		

		// Retrieve form data from request
		int staffID = Integer.parseInt(request.getParameter("staffID"));
		String driverName = request.getParameter("driverName");
		String driverContact = request.getParameter("driverContact");
		String supporterName = request.getParameter("supporterName");
		String supporterContact = request.getParameter("supporterContact");
		int busNumber = Integer.parseInt(request.getParameter("busNumber"));
		String stop1 = request.getParameter("stop1");
		String stop2 = request.getParameter("stop2");
		String stop3 = request.getParameter("stop3");
		String stop4 = request.getParameter("stop4");
		String stop5 = request.getParameter("stop5");
		String fuel = request.getParameter("fuel");

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");

			String url = "jdbc:mysql://localhost:3306/busDB";
			String username = "root";
			String password = "root";
			Connection con = DriverManager.getConnection(url, username, password);

			String q = "insert into staffDetails(ID,driverName,supporterName,driverContact,supporterContact)values(?,?,?,?,?)";

			PreparedStatement pstmt = con.prepareStatement(q);

			pstmt.setInt(1, staffID);
			pstmt.setString(2, driverName);
			pstmt.setString(3, supporterName);
			pstmt.setString(4, driverContact);
			pstmt.setString(5, supporterContact);

			pstmt.executeUpdate();

			String nq = "insert into busNumber(busID,staffCode,stop1,stop2,stop3,stop4,stop5,fuel)values(?,?,?,?,?,?,?,?)";

			PreparedStatement pstmt1 = con.prepareStatement(nq);

			pstmt1.setInt(1, busNumber);
			pstmt1.setInt(2, staffID);
			pstmt1.setString(3, stop1);
			pstmt1.setString(4, stop2);
			pstmt1.setString(5, stop3);
			pstmt1.setString(6, stop4);
			pstmt1.setString(7, stop5);
			pstmt1.setString(8, fuel);

			pstmt1.executeUpdate();

			out.println("Inserted...");

			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
