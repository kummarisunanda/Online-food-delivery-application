<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Map" %>
<%@ page import="com.food.model.CartItem" %>
<%@ page import="com.food.model.Cart" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart</title>
<style>
    table {
        width: 80%;
        margin: 20px auto;
        border-collapse: collapse;
    }
    th, td {
        border: 1px solid #ddd;
        padding: 10px;
        text-align: center;
    }
    th {
        background-color: #f4f4f4;
    }
    .actions button {
        margin: 0 5px;
    }
    .total {
        font-weight: bold;
        text-align: right;
        margin-right: 10%;
        font-size: 18px;
    }
</style>
</head>
<body>

<h1 style="text-align:center;">Shopping Cart</h1>

<%
    Cart cart = (Cart) session.getAttribute("cart");
    if (cart == null || cart.getItems().isEmpty()) {
%>
    <p style="text-align:center;">Your cart is empty.</p>
<%
    } else {
        Map<Integer, CartItem> items = cart.getItems();
        double grandTotal = 0.0;
%>
    <table>
        <thead>
            <tr>
                <th>Name</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Subtotal</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
        <%
            for (CartItem item : items.values()) {
                double subtotal = item.getPrice() * item.getQuantity();
                grandTotal += subtotal;
        %>
            <tr>
                <td><%= item.getName() %></td>
                <td>₹<%= item.getPrice() %></td>
                <td>
                    <form action="CartServlet" method="post" style="display:inline;">
                        <input type="hidden" name="itemId" value="<%= item.getItemid() %>">
                        <input type="number" name="quantity" value="<%= item.getQuantity() %>" min="1" style="width: 50px;">
                        <input type="hidden" name="action" value="update">
                        <button type="submit">Update</button>
                    </form>
                </td>
                <td>₹<%= String.format("%.2f", subtotal) %></td>
                <td class="actions">
                    <form action="CartServlet" method="post" style="display:inline;">
                        <input type="hidden" name="itemId" value="<%= item.getItemid() %>">
                        <input type="hidden" name="action" value="remove">
                        <button type="submit">Delete</button>
                    </form>
                </td>
            </tr>
        <%
            }
        %>
        </tbody>
    </table>
    <div class="total">
        Grand Total: ₹<%= String.format("%.2f", grandTotal) %>
    </div>
<%
    }
%>

</body>
</html>
