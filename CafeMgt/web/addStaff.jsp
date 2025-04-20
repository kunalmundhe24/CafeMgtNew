<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/water.css@2/out/water.css">
    
    <meta charset="UTF-8">
    <title>Staff Member Added</title>
</head>
<body>
    <%
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/Cafe", "root", "root");
            String query = "INSERT INTO staff (username, password) VALUES (?, ?)";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, username);
            pstmt.setString(2, password);
            int rowsAffected = pstmt.executeUpdate();

            if (rowsAffected > 0) {
                out.println("<h1>Staff Member Added Successfully</h1>");
            } else {
                out.println("<h1>Failed to Add Staff Member</h1>");
            }
        } catch (Exception e) {
            out.println("<h1>Error: " + e.getMessage() + "</h1>");
        } finally {
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        }
    %>
</body>
</html>
