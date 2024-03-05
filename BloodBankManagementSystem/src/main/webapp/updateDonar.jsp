<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="errorPage.jsp" %>
<%@ page import="Project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Update Details</title>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="style.css" type="text/css" media="screen">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style> 
   
input[type="text"], input=[type="email"], sinput[type="number"]
   {
    border: none;
    background:silver;
    height: 50px;
    font-size: 16px;
	padding:15px;
	width:60%;	
	border-radius: 25px;
	margin-left: 20%;
	Left: 150px;
   }   
h3,h1,h2
   {
       margin-left: 20%;
   }
hr
   {
       width: 60%;
   }
  </style>
</head>	
<body>
<%
     response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
     response.setHeader("Expires", "0");
     if(session.getAttribute("username")==null){
    	 response.sendRedirect("hospitalLogin.jsp");
     }
%>
<%
String id=request.getParameter("id");
try{
	Connection con = ConnectionProvider.getCon();
	Statement st= con.createStatement();
	ResultSet rs=st.executeQuery("select *from donar where id='"+id+"'");
	while(rs.next())
	{
		%>
		<div class="container">
	    <h2 style="color:red;"> Donar ID : 9DA07- 20<%out.println(id);%> -084</h2>

<div class="container">
     <form action="updateDonarAction.jsp" method="post">
           <input type="hidden" name="id" value="<%out.println(id);%>">
           <h3>Name</h3>
           <font style="margin-left: 20%;"><input type="text" value="<%=rs.getString(2)%>" name="name" >
           <hr>
           <h3>Age</h3>
           <font style="margin-left: 20%;"><input type="number" value="<%=rs.getString(3)%>" name="age" ></font>
           <hr>
           <h3>Weight</h3>
           <font style="margin-left: 20%;"><input type="number" value="<%=rs.getString(4)%>" name="weight" >
           <hr>
           <h3>Mobile Number</h3>   
           <font style="margin-left: 20%;"><input type="number" value="<%=rs.getString(5)%>" name="mobilenumber" >
           <hr>
           <h3>Email</h3>
           <font style="margin-left: 20%;"><input type="email" value="<%=rs.getString(7)%>" name="email" >
           <hr>
           <h3>Address</h3>
           <font style="margin-left: 20%;"><input type="text" value="<%=rs.getString(9)%>" name="address" >
           <hr>
           <br><center><button type="submit" class="button"> Save </button></center>
</form>
</div>
</div>

<% 
}
}
catch(Exception e){
    System.out.println(e);	
}
%>
</body>
</html>