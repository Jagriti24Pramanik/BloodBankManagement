<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="header.html"%>
<!DOCTYPE html>
<html>
<head>
<title>Home Page</title>
<style>
img{
width:90%;
height:500px;
}
</style>
</head>
<body>
<%
     response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
     response.setHeader("Expires", "0");
     if(session.getAttribute("username")==null){
    	 response.sendRedirect("adminLogin.jsp");
     }
%>
<div style="max-width:100%;">
    <center><img class="mySlide" src="WelcomeBanner.png"></center>
   </div>

</body>
</html>