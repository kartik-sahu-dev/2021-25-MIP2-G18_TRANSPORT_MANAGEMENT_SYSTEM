package com.SISTrahiPackage;

import java.io.*;
import java.sql.*;

public class ConnectionProvider {
	public static Connection con;
	
	public static Connection getConnection(){
		
		if(con == null)
		{
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");

				String url = "jdbc:mysql://localhost:3306/busDB";
				String username = "root";
				String password = "root";

				con = DriverManager.getConnection(url, username, password);
				 
				 

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
		
		
		return con;
	}
	
}

