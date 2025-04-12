<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    body {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
        font-family: Arial, sans-serif;
        background-color: #f9f9f9;
    }
    form {
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        border: 1px solid #ccc;
        padding: 20px;
        border-radius: 8px;
        background-color: white;
        box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.15);
    }
    h2 {
        margin-bottom: 20px;
        font-size: 26px;
        color: #333;
        text-align: center;
    }
    h2 span {
        color: #28a745;
    }
    input[type="text"], input[type="password"] {
        margin-bottom: 10px;
        padding: 10px;
        width: 220px;
        border-radius: 6px;
        border: 1px solid #ccc;
        font-size: 16px;
    }
    input[type="submit"] {
        padding: 10px 20px;
        background-color: #28a745;
        color: white;
        border: none;
        border-radius: 6px;
        font-size: 16px;
        cursor: pointer;
        width: 240px;
        margin-top: 10px;
    }
    input[type="submit"]:hover {
        background-color: #218838;
    }
    p {
        margin-top: 15px;
        font-size: 14px;
    }
    p a {
        color: #007bff;
        text-decoration: none;
    }
    p a:hover {
        text-decoration: underline;
    }
</style>
</head>
<body>
    <form action="LoginServlet">
        <h2><span>Foodie Haven</span> Login</h2>
        <label for="email">Email</label>
        <input type="text" name="email" id="email"><br>
        <label for="password">Password</label>
        <input type="password" name="password" id="password"><br>
        <input type="submit" value="Login">
        <p>Don't have an account? <a href="Register.html">Register</a></p>
    </form>
</body>
</html>


