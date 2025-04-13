<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>SISTrahi - Registration</title>
<link rel="stylesheet" type="text/css" href="registration.css">
</head>

<body>


	<input type="hidden" id="status"
		value="<%= request.getAttribute("status")%> " >
	<main>
		<form action="register" method="post">

			<div class="headingsContainer">
				<h1>𝕎𝕖𝕝𝕔𝕠𝕞𝕖 𝕥𝕠 𝕥𝕙𝕖 𝕊𝕀𝕊𝕋𝕣𝕒𝕙𝕚!</h1>
				<p>Enter your details here</p>
			</div>

			<!-- Main Container -->
			<div class="mainContainer">
				<table>
					<tr>
						<td><label for="fName">First Name</label> <input type="text"
							name="fName" required></td>
						<td><label for="lName">Last Name</label> <input type="text"
							name="lName" required></td>
					</tr>
					<tr>
						<td><label for="pword">Password</label> <input
							type="password" name="pword" required></td>
						<td><label for="rpword">Re-type Password</label> <input
							type="password" name="rpword" required></td>
					</tr>
					<tr>
						<td><label for="bDate">Birthday</label> <br> <input
							type="date" name="bdate" required></td>
						<td><label for="gender">Gender</label> <br> <input
							type="radio" value="Male" name="gender" required>Male <input
							type="radio" value="Female" name="gender" required>Female
						</td>
					</tr>
					<tr>
						<td><label for="mail">Email</label> <input type="email"
							name="mail" required></td>
						<td><label for="phone">Phone Number</label> <input type="tel"
							name="phone" required></td>
					</tr>
					<tr>
						<td colspan="2"><input type="checkbox" checked="checked"
							id="checkit" /> <label for="checkit">I agree with the
								terms and conditions </label></td>
					</tr>

					<tr>
						<td colspan="2"><button type="submit">Register</button></td>
					</tr>
				</table>
			</div>

		</form>
	</main>

	<!-- <footer>
        <p>&copy; 2023 SISTrahi. All rights reserved.</p>
    </footer> -->

	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">

	<script type="text/javascript">
		var status = document.getElementById("status").value;
		if (status == "success") {
			swal("Congrats", "Account Created Successfully", "success");
		}
	</script>
</body>

</html>







