<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/water.css@2/out/water.css">
    <meta charset="UTF-8">
    <title>Overall Earnings</title>
    <style>
        .earnings-panel {
            border: 1px solid #ddd;
            padding: 20px;
            width: 50%;
            margin-top: 20px;
        }

        h2 {
            color: #006241;
        }
    </style>
</head>
<body>
    <div class="earnings-panel">
        <h2>Overall Earnings</h2>

        <%
            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost/Cafe", "root", "root");
                stmt = conn.createStatement();
                String query = "SELECT SUM(total) AS totalEarnings FROM shop";
                rs = stmt.executeQuery(query);

                if (rs.next()) {
                    double totalEarnings = rs.getDouble("totalEarnings");
                    out.println("<p>Total Earnings: $" + totalEarnings + "</p>");
                } else {
                    out.println("<p>No earnings data available</p>");
                }
            } catch (Exception e) {
                out.println("<p>Error: " + e.getMessage() + "</p>");
            } finally {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            }
        %>
    </div>
</body>
</html>
