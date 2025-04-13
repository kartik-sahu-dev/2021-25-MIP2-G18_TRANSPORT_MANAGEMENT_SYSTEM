<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bus Details</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        h2 {
            color: #333;
        }

        h3 {
            margin: 10px 0;
            color: #555;
        }

        .details {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .bus-number {
            font-size: 24px;
            font-weight: bold;
            color: #007BFF;
        }

        .contact-info {
            font-size: 18px;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Bus Details</h2>
        <div class="details">
            <%-- Check if the result set is not empty --%>
            <% if (request.getAttribute("busNum") != null) { %>
                <h3 class="bus-number">Bus Number: <%= request.getAttribute("busNum") %></h3>
                <h3>Fuel Type: <%= request.getAttribute("fuel") %></h3>
                <h3>Bus Stops: <%= request.getAttribute("s1") %>, <%= request.getAttribute("s2") %>, <%= request.getAttribute("s3") %>,
                    <%= request.getAttribute("s4") %>, <%= request.getAttribute("s5") %></h3>
                <h3>Driver Name: <%= request.getAttribute("dName") %> | Driver Contact: <%= request.getAttribute("dContact") %></h3>
                <h3>Supporter Name: <%= request.getAttribute("sName") %> | Supporter Contact: <%= request.getAttribute("sContact") %></h3>
                <div class="contact-info">
                    <!-- Add more contact information if needed -->
                </div>
            <% } else { %>
                <h3>No Bus Details Found for Bus ID <%= request.getParameter("busNumber") %></h3>
            <% } %>
        </div>
    </div>
</body>
</html>