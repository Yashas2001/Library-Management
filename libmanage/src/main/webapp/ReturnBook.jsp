<%@ page import = "java.io.*,java.util.*, javax.servlet.*" %>
<%@page import="java.text.SimpleDateFormat" %>  
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%! final static String DATE_FORMAT_NOW = "yyyy/MM/dd"; %>
<!DOCTYPE html>
<%
Date date = new Date();%>
<html>
 <script>

  $( function() {

    $( "#datepicker" ).datepicker();

  } );

  </script>
  
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
        <form method="post" action="ReturnBook1.jsp">
            <center>
            <table bgcolor="white" border="6" cellpadding="10" cellspacing="2">
                <thead>
                    <tr>
                        <th colspan="6">Return Book</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Book Id :</td>
                        <td><input type="text" name="book_id" required/></td>
                    </tr>
                    <tr>
                        <td>User ID :</td>
                        <td><input type="text" name="student_id" /></td>
                    </tr>
                    <tr>
                        <td>Fine  :</td>
                        <td><input type="text" name="fine" /></td>
                    </tr>
                    <tr>
                        <td>Return  Date :</td>
                        <td>
                        <input type="text" name = "return_date" > 
  
      					</td>
                    </tr>
                    
                    <tr>
                        <td colspan="2" align="center"><input type="submit" value="Return Book" />
                            &nbsp;&nbsp;
                            <input type="reset" value="Reset" />
                        </td>                        
                    </tr>
                    
                                      
                </tbody>
            </table>
            </center>
        </form>
    </body>
</html>