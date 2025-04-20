<html>
    <head>
    </head>
<body onload="window.print()">
<%@page import="java.sql.*" %>
<%
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String item = request.getParameter("item");
    int quantity = Integer.parseInt(request.getParameter("quantity"));
    int amount = Integer.parseInt(request.getParameter("amount"));
    
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/Cafe", "root", "root");
        Statement stmt = conn.createStatement();
        
        // Generate a unique ID for each new record (you can use your own logic here)
        ResultSet rs = stmt.executeQuery("SELECT MAX(id) FROM shop");
        int newId = 1;
        if (rs.next()) {
            newId = rs.getInt(1) + 1;
        }

        // Insert the new record into the "shop" table
        String insertQuery = "INSERT INTO shop (id, name, email, item, quantity, amount, total) " +
                             "VALUES (" + newId + ", '" + name + "', '" + email + "', '" + item + "', " + quantity + ", " + amount + ", " + (quantity * amount) + ")";
        stmt.executeUpdate(insertQuery);
        
        out.println("<h1>Bill</h1>");

        // Display the inserted data nicely
        out.println("<p>Name: " + name + "</p>");
        out.println("<p>Email: " + email + "</p>");
        out.println("<p>Item: " + item + "</p>");
        out.println("<p>Quantity: " + quantity + "</p>");
        out.println("<p>Total: " + (quantity * amount) + "</p>");
        
        stmt.close();
        conn.close();
    } catch (Exception e) {
        out.println("<p>Error: " + e.getMessage() + "</p>");
    }
%>



</body>
</html>