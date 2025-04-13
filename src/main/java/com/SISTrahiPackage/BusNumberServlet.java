package com.SISTrahiPackage;

import jakarta.servlet.*;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.*;
import java.sql.*;

public class BusNumberServlet extends HttpServlet {

    int busNum;
    String s1, s2, s3, s4, s5;
    String fuel, dName, sName, dContact, sContact;

    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        busNum = Integer.parseInt(req.getParameter("busNumber"));

        PrintWriter out = res.getWriter();
        res.setContentType("text/html");

        if (busNum >= 1 && busNum <= 8) {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");

                String url = "jdbc:mysql://localhost:3306/busDB";
                String username = "root";
                String password = "root";

                Connection con = DriverManager.getConnection(url, username, password);

                String q = "SELECT b.*, s.* FROM busnumber AS b INNER JOIN staffDetails AS s ON b.staffCode = s.ID WHERE b.busid = '"+ busNum +"'";

                Statement stmt = con.createStatement();
                ResultSet set = stmt.executeQuery(q);

                while (set.next()) {
                    s1 = set.getString(3);
                    s2 = set.getString(4);
                    s3 = set.getString(5);
                    s4 = set.getString(6);
                    s5 = set.getString(7);

                    fuel = set.getString(8);
                    dName = set.getString(10);
                    sName = set.getString(11);
                    dContact = set.getString(12);
                    sContact = set.getString(13);
                }

                // Set values as request attributes
                req.setAttribute("busNum", busNum);
                req.setAttribute("fuel", fuel);
                req.setAttribute("s1", s1);
                req.setAttribute("s2", s2);
                req.setAttribute("s3", s3);
                req.setAttribute("s4", s4);
                req.setAttribute("s5", s5);
                req.setAttribute("dName", dName);
                req.setAttribute("dContact", dContact);
                req.setAttribute("sName", sName);
                req.setAttribute("sContact", sContact);

                // Forward the request and response to the new JSP page
                RequestDispatcher dispatcher = req.getRequestDispatcher("BusNumber.jsp");
                dispatcher.forward(req, res);

                con.close();

            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            // Existing code...
            RequestDispatcher rd = req.getRequestDispatcher("search-bus.html");
            rd.include(req, res);
        }
    }
}
