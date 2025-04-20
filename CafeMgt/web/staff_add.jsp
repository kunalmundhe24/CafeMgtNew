<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Staff Member</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/water.css@2/out/water.css">
</head>
<body>
    <h1>Add Staff Member</h1>
    
    <form method="post" action="addStaff.jsp">
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required>
        <br>
        
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required>
        <br>
        
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required>
        <br>
        
        <button type="submit">Add Staff Member</button>
    </form>
</body>
</html>
