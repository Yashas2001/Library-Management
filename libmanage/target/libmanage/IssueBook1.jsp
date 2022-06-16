<%@page import="java.text.SimpleDateFormat"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="java.text.*" %>
<%@ page import ="java.util.*" %>

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

<table bgcolor="white"  width="300" height="100" border="0" cellspacing="10" cellpadding="0" align="center"><%
    try{
        String bid = request.getParameter("book_id");   
        String uid = request.getParameter("student_id");
        String period = request.getParameter("period");
        String date = request.getParameter("issue_date");
        DateFormat formatter ; 
        formatter = new SimpleDateFormat("yyyy/MM/dd");
		//java.util.Date date = formatter.parse(request.getParameter("userdate"));
		
      //  String issueDate = request.getParameter("issue_date");
        
        //out.println(username + "::: " + userType);
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test?" , "root", "Yashas2001");
       // Statement st1=conn.createStatement();
        
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
        
    //    Date strDate = sdf.parse(sdf);
        //String sql = "Insert into users(USERNAME, PASSWORD, USER_TYPE) VALUES ('" + username + "','" + password + "', '"+userType +"')";
        //String sql="INSERT INTO issued_books(BID,UID,PERIOD,ISSUED_DATE) VALUES (?,?,?,?)";
        PreparedStatement pstm = conn.prepareStatement("INSERT INTO issued_books(BID,UID,PERIOD,ISSUED_DATE) VALUES (?,?,?,?)");
        pstm.setString(1,bid );
        pstm.setString(2,uid );
        pstm.setString(3,period);
        pstm.setString(4,date);
       // pstm.setDate(4, date);
        //String sql="INSERT INTO BOOKS(book_isbn,book_name,book_publisher,book_edition,book_genre,book_price,book_pages)" 
        	//	+ "values ('" + isbn + "','" + name + "','" + publisher + "','" + edition + "','" +  genre + "','" +  price + "','" +  pages +"')";
        int status = pstm.executeUpdate();
        //out.println("Book " + name + " added successfully");
    }
   catch(Exception e){  
	   e.printStackTrace();
       out.println("Something went wrong!! Please try again");       
   }      
%>


<center><h1> <B>Book Issued successfully</B> </h1> </center>
<br><br>
</table>
</form>
</html>