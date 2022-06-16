<%@ page import ="java.sql.*" %>
 
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
   
        <br>
        <br>
        <%String showLink =""; %>
        
<table bgcolor="white" width="250" height="100" border="0" cellspacing="10" cellpadding="0" ><%
    try{
        String username = request.getParameter("username");   
        String password = request.getParameter("password");
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test?" , "root","Yashas2001");    
        PreparedStatement pst = conn.prepareStatement("Select username,password, user_type from users where username=? and password=?");
        pst.setString(1, username);
        pst.setString(2, password);
        ResultSet rs = pst.executeQuery(); 
        
        %>
    	<h1><font color="white"> Welcome <%=username %> </h1>	     
        <%
          while(rs.next()){ 
        
        	  if (rs.getInt("USER_TYPE")==1) {
        		showLink="Admin";
        	  }else if (rs.getInt("USER_TYPE")==0){ 
        		  showLink="User";
        	  }else
        		  showLink="Invalid";
          }
    }
        catch(Exception e){       
            out.println("Something went wrong !! Please try again");       
        }
              %>
               
                <% if (showLink.equals ("Admin")) {%>
              <tr><td><a href='addUser.jsp'> Add User</a></td></tr>
              <tr><td><a href='addBook.jsp'> Add Book</a></td></tr>
              <tr><td><a href='issueBook.jsp'> Issue Book</a></td></tr>
              <tr><td><a href='ReturnBook.jsp'> Return Book</a></td></tr>
              
              <tr><td><a href='ViewUser.jsp'> View User</a></td></tr>
              <tr><td><a href='viewBooks.jsp'> View Books</a></td></tr>
              <tr><td><a href='viewIssuedBook.jsp'> View Issued Books</a></td></tr>
              <tr><td><a href='viewReturnedBooks.jsp'>View Returned Books</a></td></tr>
            
		    
            <% } else if (showLink.equals("User")){ %>
             <tr><td><a href='ViewUser.jsp'> View User</a></td></tr>
              <tr><td><a href='viewBooks.jsp'> View Books</a></td></tr>
              <tr><td><a href='viewIssuedBook.jsp'> View Issued Books</a></td></tr>
              <tr><td><a href='viewReturnBooks.jsp'>View Returned Books</a></td></tr>
   		       
           <% } else { %>
             <tr><td><B>Invalid Login Credentials</B></td></tr>    	
		<%   }
         
%>
</table>
</html>