<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="errorPage.jsp"%>
    
<%@page import="Project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%
   String id=request.getParameter("id");
   String name=request.getParameter("name");
   String mobilenumber=request.getParameter("mobilenumber");
   String email=request.getParameter("email");
   String bloodgroup=request.getParameter("bloodgroup");
   String status = "pending";

   try{
	   Connection con=ConnectionProvider.getCon();
	   PreparedStatement ps=con.prepareStatement("insert into bloodrequest values(?,?,?,?,?,?)");
	   ps.setString(1,id);
	   ps.setString(2,name);
	   ps.setString(3,mobilenumber);
	   ps.setString(4,email);
	   ps.setString(5,bloodgroup);
	   ps.setString(6,status);
	   ps.executeUpdate();
	   response.sendRedirect("requestPage.jsp?msg=valid");
   }
   catch(Exception e){
	   response.sendRedirect("requestPage.jsp?msg=invalid");
   }
%>