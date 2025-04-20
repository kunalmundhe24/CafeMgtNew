<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/water.css@2/out/water.css">
    <title>Staff Members</title>
    <style>
        table {
            border-collapse: collapse;
            width: 50%;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <h1>Staff Members</h1>

    <%
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/Cafe", "root", "root");
            stmt = conn.createStatement();
            String query = "SELECT username FROM staff";
            rs = stmt.executeQuery(query);

            // Display the usernames in a table with serial numbers
            out.println("<table>");
            out.println("<tr><th>Sr No</th><th>Username</th></tr>");

            int srNo = 1;
            while (rs.next()) {
                String username = rs.getString("username");
                out.println("<tr><td>" + srNo + "</td><td>" + username + "</td></tr>");
                srNo++;
            }

            out.println("</table>");
        } catch (Exception e) {
            out.println("<p>Error: " + e.getMessage() + "</p>");
        } finally {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        }
    %>
</body>
</html>


