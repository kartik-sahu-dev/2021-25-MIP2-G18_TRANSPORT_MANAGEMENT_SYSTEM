<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*, java.io.*"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Bus Staff Information</title>
<link rel="stylesheet" href="InsertBus.css">
</head>

<body>
	<div class="container">
		<h2>Bus Staff Information</h2>

		<!-- Display data from the staffDetails table -->
		<h3>Staff Details Information</h3>
		<table>
			<tr>
				<th>Staff ID</th>
				<th>Driver Name</th>
				<th>Supporter Name</th>
				<th>Driver Contact</th>
				<th>Supporter Contact</th>
			</tr>
			<%
			Connection connection = null;
			try { // Establish a database connection
				Class.forName("com.mysql.cj.jdbc.Driver");
				connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/busDB", "root", "root");
				// Query to retrieve data from the staffDetails table 
				String query = "SELECT * FROM staffDetails";
				Statement statement = connection.createStatement();
				ResultSet resultSet = statement.executeQuery(query); // Loop through the result set and display data in table rows 
				while (resultSet.next()) {
					out.println("<tr>");
					out.println("<td>" + resultSet.getString("ID") + "</td>");
					out.println("<td>" + resultSet.getString("driverName") + "</td>");
					out.println("<td>" + resultSet.getString("supporterName") + "</td>");
					out.println("<td>" + resultSet.getString("driverContact") + "</td>");
					out.println("<td>" + resultSet.getString("supporterContact") + "</td>");
					out.println("</tr>");
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if (connection != null) {
				connection.close();
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			%>
		</table>

		<!-- Display data from the busNumber table -->
		<h3>Bus Numbers Information</h3>
		<table>
			<tr>
				<th>Bus ID</th>
				<th>Staff Code</th>
				<th>Stop 1</th>
				<th>Stop 2</th>
				<th>Stop 3</th>
				<th>Stop 4</th>
				<th>Stop 5</th>
				<th>Fuel</th>
			</tr>
			<%
			Connection con = null;
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");

				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/busDB", "root", "root");
				// Query                         to retrieve data from the busNumber table 
				String busQuery = "SELECT * FROM busnumber";
				Statement busStatement = con.createStatement();
				ResultSet busResultSet = busStatement.executeQuery(busQuery);
				// Loop through the result set and display data in table rows 
				while (busResultSet.next()) {
					out.println("<tr>");
					out.println("<td>" + busResultSet.getString("busID") + "</td>");
					out.println("<td>" + busResultSet.getString("staffCode") + "</td>");
					out.println("<td>" + busResultSet.getString("stop1") + "</td>");
					out.println("<td>" + busResultSet.getString("stop2") + "</td>");
					out.println("<td>" + busResultSet.getString("stop3") + "</td>");
					out.println("<td>" + busResultSet.getString("stop4") + "</td>");
					out.println("<td>" + busResultSet.getString("stop5") + "</td>");
					out.println("<td>" + busResultSet.getString("fuel") + "</td>");
					out.println("</tr>");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			%>
		</table>

		<!-- Show the form -->
		<h3>Add New Entry</h3>
		<form action="SubmitFormServlet" method="post">
			<!-- Form fields as per your provided HTML -->
			<div class="form-group">
				<label for="staffID">Staff ID</label> <input type="text"
					id="staffID" name="staffID" placeholder="Enter Staff ID" required>
			</div>
			<div class="form-group">
				<label for="driverName">Driver Name</label> <input type="text"
					id="driverName" name="driverName" placeholder="Enter Driver Name"
					required>
			</div>
			<div class="form-group">
				<label for="driverContact">Driver Contact</label> <input type="text"
					id="driverContact" name="driverContact"
					placeholder="Enter Driver Contact" required>
			</div>
			<div class="form-group">
				<label for="supporterName">Supporter Name</label> <input type="text"
					id="supporterName" name="supporterName"
					placeholder="Enter Supporter Name" required>
			</div>
			<div class="form-group">
				<label for="supporterContact">Supporter Contact</label> <input
					type="text" id="supporterContact" name="supporterContact"
					placeholder="Enter Supporter Contact" required>
			</div>
			<div class="form-group">
				<label for="busNumber">Bus Number</label> <input type="text"
					id="busNumber" name="busNumber" placeholder="Enter Bus Number"
					required>
			</div>
			<div class="form-group">
				<label for="busNumber">Fuel Type</label> <input type="text"
					id="busNumber" name="fuel" placeholder="Enter Fuel Type" required>
			</div>
			<div class="form-group">
				<label for="stops">Bus Stops (up to 5)</label> <input type="text"
					id="stop1" name="stop1" placeholder="Stop 1" required> <input
					type="text" id="stop2" name="stop2" placeholder="Stop 2"> <input
					type="text" id="stop3" name="stop3" placeholder="Stop 3"> <input
					type="text" id="stop4" name="stop4" placeholder="Stop 4"> <input
					type="text" id="stop5" name="stop5" placeholder="Stop 5">
			</div>
			<div class="form-group">
				<button type="submit">Submit</button>
			</div>
		</form>

		<!-- Form to delete a bus entry by bus ID -->
		<h3>Delete Bus Entry</h3>
		<form action="DeleteBusServlet" method="post">
			<div class="form-group">
				<label for="busIDToDelete">Bus ID to Delete</label> <input
					type="text" id="busIDToDelete" name="busIDToDelete"
					placeholder="Enter Bus ID to Delete" required>
			</div>
			<div class="form-group">
				<button type="submit" name="deleteBus">Delete Bus</button>
			</div>
		</form>
	</div>
</body>

</html>