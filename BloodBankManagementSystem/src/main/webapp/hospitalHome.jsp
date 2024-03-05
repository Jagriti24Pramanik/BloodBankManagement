<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 <link rel="stylesheet" href="style.css" type="text/css" media="screen">
<title>Hospital Home Page</title>
</head>
<style>
img{
width:100%;
height:600px;
}

ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: rgb(129, 10, 31);
}
ul button {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: rgb(129, 10, 31);
  font-family: inherit;
}

li {
  float: left;
  border-right:1px solid #bbb;
}
li button {
  
  float: left;
}

li:last-child {
  border-right: none;
}

li button:last-child {
  border-right: none;
  font-family: inherit;
}

li a {
  display: block;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
} 

li a:hover:not(.active) {
  background-color: #111;
}

li button {
  display: block ;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  border : none;
  border-left: 1px solid white;
  
} 

li button:hover:not(.active) {
  background-color: #111;
}

.active {
  background-color: #4CAF50;
}

.topnav .active {
  background-color: dodgerblue;
  color: white;
}
</style>
</head>
<body>


<ul><div class="topnav" id="myTopnav">
  <li  style="float:left"><a href="hospitalHome.jsp">Home</a></li>
  <li  style="float:left"><a href="addNewDonar.jsp">Add New Donor</a></li>
  <li  style="float:left"><a href="editDetails.jsp"> Donor Details</a></li>
  <li style="float:right"><form action="hospitalLogoutAction" method="Post"><button type="submit">Logout</button></form></li>
  </div>
</ul>

</style>
<body>
<%
     response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
     response.setHeader("Expires", "0");
     if(session.getAttribute("username")==null){
    	 response.sendRedirect("hospitalLogin.jsp");
     }
%>
<div style="max-width:100%;">
    <center><img class="mySlide" src="hos.jpg"></center>
   </div>
</body>
</html>