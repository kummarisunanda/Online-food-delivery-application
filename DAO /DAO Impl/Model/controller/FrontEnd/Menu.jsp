<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.food.model.Menu, java.util.ArrayList, java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Welcome Page</title>
    <style>
        .container {
            display: flex;
            justify-content: center;
            padding: 20px;
        }

        .large-card {
            display: flex;
            flex-direction: column;
            align-items: center;
            width: 90%;
            padding: 20px;
            border: 2px solid #ccc;
            border-radius: 10px;
            background-color: #FFB6C1; /* Light pink color for the entire card component */
        }

        .card-row {
            display: flex;
            justify-content: space-between;
            width: 100%;
            gap: 20px;
            margin-bottom: 30px; /* Increased spacing between rows */
        }

        .card {
            width: 30%;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            background-color: #d7d7d7; /* Light cement color for each card */
            text-align: center;
            box-sizing: border-box;
        }

        .card h3 {
            color: #FF1493; /* Darker, thicker pink */
            font-size: 1.8em;
            font-weight: bold; /* Makes the text thicker */
        }

        .card p {
            font-size: 1.1em;
            margin: 10px 0;
        }

        /* Ensures that the cards align properly for different screen sizes */
        @media screen and (max-width: 768px) {
            .card {
                width: 45%;
            }

            .card-row {
                flex-wrap: wrap;
            }
        }

        @media screen and (max-width: 480px) {
            .card {
                width: 100%;
            }

            .card-row {
                flex-wrap: wrap;
            }
        }
	        .quantity-input {
	    margin-right: 10px; /* Adds space to the right of the quantity input */
	}
	
	.form-actions {
	    margin-top: 10px; /* Adds space between the quantity input and the buttons */
	}
        
    </style>
</head>
<body>

<%! List<Menu> menuList; %>

<%
    menuList = (List<Menu>)session.getAttribute("menuList");
%>

<div class="container">
    <% if (menuList != null) { 
        int count = 0; %>
        <div class="large-card">
            <% for (Menu r : menuList) { 
                if (count % 3 == 0) { %>
                    <div class="card-row">
                <% } %>

                <div class="card">
                    <h3><%= r.getItemName() %></h3>
                    <p>Description: <%= r.getDescription() %></p>
                    <p>Price: <%= r.getPrice() %></p>
                    <p>Status: <%= r.getIsAvailable() ? "Open" : "Closed" %></p>
                    <form action="CartServlet?itemId=<%=r.getMenuId()%>" method="post">
                    Quantity<input type="number" name=quantity value="1" min="1" class="quantity-input">
                    <br>
                    <div class="form-actions">
			            <input type="submit" value="Add to cart">
			            <input type="hidden" name="action" value="add">
			        </div>
                    </form>
                </div>

                <% count++; 
                if (count % 3 == 0 || count == menuList.size()) { %>
                    </div>
                <% } 
            } %>
        </div>
    <% } %>
</div>

</body>
</html>
