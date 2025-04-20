<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/water.css@2/out/water.css">
    <meta charset="UTF-8">
    <title>Admin Login</title>
</head>
<body>
    <h1>Admin Login</h1>
    
    <form method="post" action="adminCheck.jsp">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required>
        <br>
        
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required>
        <br>
        
        <button type="submit">Login</button>
    </form>
</body>
</html>
