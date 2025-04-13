<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
if (session.getAttribute("name") == null) {
	response.sendRedirect("login.jsp");
}
%>


<!DOCTYPE html>
<html>

<head>
<title>SISTrahi - Home</title>
<meta charset="UTF-8">
<link rel="icon" type="image/png" href="./images1/Logo.png">
<link rel="stylesheet" type="text/css" href="styles.css">
<link rel="stylesheet" href="common.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Abril+Fatface&family=Bitter:wght@500&display=swap"
	rel="stylesheet">
</head>

<body>
	<section>
		<div class="container">
			<nav id="navbar">
				<div id="logo">
					<img src="./images1/Logo.png" alt="SISTarthi.com">
				</div>
				<ul>
					<li><a href="index.html">Home</a></li>
					<li><a href="search-bus.html">Search Bus</a></li>
					<li><a href="services.html">Services</a></li>
					<li><a href="contactus.html">Contact Us</a></li>
					<li><a href="aboutus.html">About Us</a></li>
					<li><a href="InsertBus.jsp">Admin portal</a></li>
				</ul>
			</nav>
		</div>
	</section>

	<main>
		<section id="hero">
			<div class="hero-content">
				<h1 class="h-primary center">Welcome To The SISTrahi</h1>
				<p id="para">Never miss your bus again with our innovative bus
					tracking system. We understand the frustration of waiting at a bus
					stop uncertain about when your bus will arrive. That's why we have
					developed a state-of-the-art solution that provides you with
					real-time updates on bus locations, routes, and estimated arrival
					times.</p>
				<br> <a href="search-bus.html" class="cta-button">Search
					Bus</a>
			</div>
			<div class="hero-image">
				<!-- <img src="/roughImages/busImage.jfif" alt="Bus Image"> -->
			</div>
		</section>

		<section id="services-container">
			<h1 class="h-primary center">Key Features of SISTrahi</h1>
			<div id="services">
				<div class="box">
					<img src="./images1/interface.jpg" alt="">
					<h2 class="h-secondary center">User-friendly Interface</h2>
					<p class="center">Our bus tracking system boasts a
						user-friendly interface designed with simplicity and ease of use
						in mind. We understand that not everyone is tech-savvy, which is
						why we've created an intuitive and straightforward interface that
						anyone can navigate effortlessly. Whether you're a student,
						faculty member, or staff, you'll find our system easy to
						understand and operate. From accessing bus routes to checking
						estimated arrival times, you can quickly find the information you
						need without any hassle.</p>
				</div>
				<div class="box">
					<img src="./images1/tracking.jpg" alt="">
					<h2 class="h-secondary center">Real-time Bus Tracking</h2>
					<p class="center">With our real-time bus tracking feature, you
						can stay connected to the exact location of your college buses at
						any time. Our system utilizes advanced GPS technology to provide
						up-to-the-minute tracking information. Whether you're waiting at a
						bus stop or planning your commute, you can rely on our system to
						give you accurate and real-time updates on the whereabouts of the
						buses. No more guessing or uncertainty - you'll have peace of mind
						knowing exactly when your bus will arrive.</p>
				</div>
				<div class="box">
					<img src="./images1/searchBus.jpg" alt="">
					<h2 class="h-secondary center">Search and Filter Buses</h2>
					<p class="center">Finding the right bus is now easier than ever
						with our search and filter feature. Whether you're looking for a
						specific bus by its route or bus number, our system allows you to
						search and filter the buses to quickly locate the one you need.
						This feature saves you valuable time and ensures that you're
						always on the right bus. No more confusion or guessing - simply
						enter the relevant information, and our system will provide you
						with the buses that match your search criteria. It's a convenient
						and efficient way to track and locate the buses you rely on.</p>
				</div>
			</div>
		</section>


	</main>


	<footer>
		<p>&copy; 2023 SISTrahi. All rights reserved.</p>
	</footer>
















	<script>
		// Add smooth scrolling behavior to mouse wheel events
		window.addEventListener("wheel", function(event) {
			event.preventDefault(); // Prevent default scrolling behavior

			// Determine the direction of scroll
			var delta = event.deltaY || event.detail || (-event.wheelDelta);
			var scrollSpeed = 300; // Adjust scroll speed as desired

			// Scroll to the appropriate section based on scroll direction
			if (delta < 0) {
				// Scrolling up
				window.scrollBy({
					top : -scrollSpeed,
					behavior : "smooth"
				});
			} else {
				// Scrolling down
				window.scrollBy({
					top : scrollSpeed,
					behavior : "smooth"
				});
			}
		});
	</script>
</body>

</html>