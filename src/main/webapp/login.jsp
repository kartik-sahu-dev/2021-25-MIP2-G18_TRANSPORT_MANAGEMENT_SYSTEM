<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome to SISTrahi</title>

<link rel="stylesheet" href="login.css" />

</head>
<body>

	<input type="hidden" id="status" value="<%= request.getAttribute("status")%> " >
     <form action="login" method="post">
     	
     	<!--Heading Container  -->
     	<div class="headingsContainer">
     		<h1>Welcome To The SISTrahi!</h1>
     		<p>Enter your Username and Password</p>
     	</div>
     	
     	<!-- Main Container -->
     	<div class="mainContainer">
     		<label for="username">Your Username</label>
     		<input type="text" name="username" placeholder="Enter username or email" required />
     		
     		 <br/>
     		 <br/>
     		
     		<label for="pword">Your Password</label>
     		<input type="password" name="pword" placeholder="Enter password" required />
     		
     		
     		<div class="subcontainer">
     		   <label for="">
     		     <input type="checkbox" checked="checked" name="remember" />Remember me
     		   </label>
     		   
     		   <span class="forgotpsd"><a href="#">Forget Password?</a></span>
     		</div>
     		   
     		   
     		
     		<br/>
     		
     		<button type="submit">Login</button>
     		
     		<p class="register">Not a member? <a href="registration.jsp">Register here!</a></p>
     	</div>
     
     </form>
     
     
     
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">

	<script type="text/javascript">
		var status = document.getElementById("status").value;
		if (status == "failed") {
			swal("Sorry", "Wrong Username or Password", "error");
		}
	</script>
</body>
</html>













