package com.SISTrahiPackage;

import java.sql.*;

public class Rough {
	
	public static void main(String arg[])
	{
		try {
		

			Connection con = ConnectionProvider.getConnection();
			
			String q = "select stop1 from busnumber where busid = 1";
			
			Statement stmt = con.createStatement();
			ResultSet set = stmt.executeQuery(q);
			
			while(set.next())
			{
				 String s1 = set.getString(1);
				 System.out.println(s1);
			}
			
			 
			 

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
