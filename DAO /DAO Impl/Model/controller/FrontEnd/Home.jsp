<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.food.model.User,com.food.model.Restaurent,java.util.ArrayList,java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Welcome Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f7f7f7;
            margin: 0;
            padding: 0;
        }

        .navbar {
            background-color: #333;
            color: white;
            padding: 10px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .navbar .logo {
            font-size: 20px;
            font-weight: bold;
            color: #ff6f61;
        }

        .navbar .menu {
            display: flex;
            align-items: center;
        }

        .navbar .menu a {
            color: white;
            text-decoration: none;
            margin-left: 20px;
            padding: 10px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .navbar .menu a:hover {
            background-color: #555;
        }

        .profile-dropdown {
            position: relative;
            display: inline-block;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #f9f9f9;
            box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.1);
            z-index: 1;
            right: 0;
        }

        .dropdown-content a {
            color: black;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
            transition: background-color 0.3s ease;
        }

        .dropdown-content a:hover {
            background-color: #ddd;
        }

        .profile-dropdown:hover .dropdown-content {
            display: block;
        }

        .container {
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 30px;
            max-width: 1200px;
            margin: 20px auto;
        }

        h1 {
            font-size: 24px;
            color: #333;
            margin-bottom: 20px;
            text-align: center;
        }

        .card-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }

        .card {
            background-color: #f4f4f4;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
            width: 30%;
            margin-bottom: 20px;
            text-align: center;
        }

        .card h3 {
            color: #ff6f61;
        }

        .card p {
            margin: 5px 0;
            color: #555;
        }

        input[type="submit"] {
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #ff6f61;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #e65c50;
        }

    </style>
</head>
<body>
<%!
User u;
List<Restaurent> resList;
%>
<%
    u = (User)session.getAttribute("user");
    resList = (List<Restaurent>)session.getAttribute("resList");
%>

<div class="navbar">
    <div class="logo">Foodie Haven</div>
    <div class="menu">
        <%
        if (u != null) {
        %>
        <span>Welcome, <%= u.getUsername() %></span>
        <div class="profile-dropdown">
            <button>Profile</button>
            <div class="dropdown-content">
                <a href="#">Username: <%= u.getUsername() %></a>
                <a href="#">Change Password</a>
                <a href="logout.jsp">Logout</a>
            </div>
        </div>
        <%
        } else {
        %>
        <a href="login.jsp">Login</a>
        <a href="Register.html">Register</a>
        <%
        }
        %>
    </div>
</div>

<div class="container">
    <%
    if (u != null) {
    %>
        <h1 class="welcome-message">Welcome,  
        <%
        out.println(u.getUsername());
        %>!</h1>
    <%
    }
    %>
<%if(resList!=null){ %>
    <div class="card-container">
        <% for (Restaurent r : resList) { %>
        <div class="card">
            <h3><%= r.getName() %></h3>
            <p>Cuisine: <%= r.getCuisineType() %></p>
            <p>Delivery Time: <%= r.getDeliveryTime() %></p>
            <p>Rating: <%= r.getRating() %></p>
            <p>Status: <%= r.getIsActive() ? "Open" : "Closed" %></p>
            <a href="MenuServlet?id=<%=r.getRestaurentId()%>"><button>View Menu</button></a>
        </div>
        <% } }%>
    </div>
</div>
</body>
</html>
