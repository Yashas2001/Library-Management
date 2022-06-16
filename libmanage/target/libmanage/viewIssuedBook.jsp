<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "test";
String userId = "root";
String password = "Yashas2001";

try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>

<style>
body {
  background-color: cyan;
  background-image:url('library.jpg');
   background-repeat: no-repeat;
    background-size: cover;

}
</style>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page for Library Management</title>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
		<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        
        <style>
body, h1,h2,h3,h4,h5,h6 {font-family: "Montserrat", sans-serif}
.w3-row-padding img {margin-bottom: 12px}
/* Set the width of the sidebar to 120px */
.w3-sidebar {width: 120px;background: #222;}
/* Add a left margin to the "page content" that matches the width of the sidebar (120px) */
#main {margin-left: 120px}
/* Remove margins from "page content" on small screens */
@media only screen and (max-width: 600px) {#main {margin-left: 0}}
</style>
        
    </head>
    <body>
   
        <br>
        <br>
        <br>
        <br>
        <br>

<h2 align="center"><font color="white"><strong>List of Issued Books</strong></font></h2>
<table bgcolor="white"  align="center" cellpadding="4" cellspacing="4">
<tr>

</tr>
<tr bgcolor="white">
<td><b>Issue Id</b></td>
<td><b>User Id</b></td>
<td><b>Book Id</b></td>
<td><b>Issue Date</b></td>
<td><b>Period</b></td>
</tr>
<%
try {
connection = DriverManager.getConnection(
connectionUrl + dbName, userId, password);
statement = connection.createStatement();
String sql = "SELECT * FROM issued_books";

resultSet = statement.executeQuery(sql);
while (resultSet.next()) {
%>
<tr bgcolor="white">

<td><%=resultSet.getString("IID")%></td>
<td><%=resultSet.getString("UID")%></td>
<td><%=resultSet.getString("BID")%></td>
<td><%=resultSet.getString("ISSUED_DATE")%></td>
<td><%=resultSet.getString("Period")%></td>
</tr>

<%
}

} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
</body>
</html>