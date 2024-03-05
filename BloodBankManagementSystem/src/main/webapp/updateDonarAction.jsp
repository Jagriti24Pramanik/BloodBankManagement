<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="errorPage.jsp"%>
<%@ page import="Project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<%
     response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
     response.setHeader("Expires", "0");
     if(session.getAttribute("username")==null){
    	 response.sendRedirect("hospitalLogin.jsp");
     }
%>
<%
String id = request.getParameter("id");
String name = request.getParameter("name");
String age = request.getParameter("age");
String weight = request.getParameter("weight");
String mobilenumber = request.getParameter("mobilenumber");
String email = request.getParameter("email");
String address = request.getParameter("address");

try{
	Connection con = ConnectionProvider.getCon();
	PreparedStatement ps =con.prepareStatement("update donar set name=?,age=?,weight=?,mobilenumber=?,email=?,address=? where id=?");
	ps.setString(1,name);
	ps.setString(2,age);
	ps.setString(3,weight);
	ps.setString(4,mobilenumber);
	ps.setString(5,email);
	ps.setString(6,address);
	ps.setString(7,id);
	ps.executeUpdate();
	response.sendRedirect("editDetails.jsp?msg=valid");
}
catch(Exception e){
	response.sendRedirect("editDetails.jsp?msg=invalid");
}
%>