<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/water.css@2/out/water.css">
        <meta charset="UTF-8">
        <title>Login Result</title>
    </head>
    <body>
        <%
            String username = request.getParameter("username");
            String password = request.getParameter("password");

    // Hardcoded admin credentials
            String adminUsername = "admin";
            String adminPassword = "admin1234";

            try {
                if (username.equals(adminUsername) && password.equals(adminPassword)) {
                    // Admin credentials are correct
                     response.sendRedirect("panel.jsp");
                } else {
                    // Admin credentials are incorrect
                    out.println("<h1>Admin does not exist</h1>");
                }
            } catch (Exception e) {
                out.println("<h1>Error: " + e.getMessage() + "</h1>");
            }

        %>
    </body>
</html>
