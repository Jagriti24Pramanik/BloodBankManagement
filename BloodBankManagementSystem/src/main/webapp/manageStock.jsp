<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="errorPage.jsp" isErrorPage="false"%>
<%@ page import="Project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<%@ include file="header.html" %>
<!DOCTYPE html>
<html>
<head>
   <title> Stock </title>
  <link rel="stylesheet" herf="style.css" type="text/css" media="screen">
  <style>
   
input[type="text"], input[type="password"], input[type="submit"],select
   {
       border: none;
       background: silver;
       height: 50px;
       width: 33%;
       font-size: 16px;
       margin-left: 35%;
       padding: 15px; 
       border-radius: 25px;
   }
#customers 
{
    font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
    border-collapse: collapse;
    width: 55%;
}
#customers td, #customers th
{
    border: 1px solid #add;
    padding: 8px;
}
#customers tr:nth-child(even){background-color: #f2f2f2;}

#customers tr:hover{background-color: #ddd;}

#customer th 
{
      padding-top: 12px;
      padding-bottom: 12px;
      text-align: left;
      background-color: #4CAF50;
      color: white;
}
</style>
</head>
<body>
<div class="container">
<br>
<%
     response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
     response.setHeader("Expires", "0");
     if(session.getAttribute("username")==null){
    	 response.sendRedirect("adminLogin.jsp");
     }
%>
<%
String msg=request.getParameter("msg");
if("valid".equals(msg))
{
%>
<center><font color="green" size="5"> Successfully Updated...!!! </font></center>
<% 	
}
%>
<%
if("invalid".equals(msg))
{
%>
<center><font color="red" size="5"> Something Went Wrong...!!! Please , Try Again. </font></center>
<% 	
}
%>
<form action="manageStockAction.jsp" method="post" name="myform" onsubmit="return validateForm()">
<div class="form-group">
<center><h2> Select Blood Group </h2></center>
<select name="bloodgroup" required>
    <option value="" disabled selected>Select your Blood Group</option>
    <option value="A+">A+</option>
    <option value="A-">A-</option>
    <option value="B+">B+</option>
    <option value="B-">B-</option>
    <option value="O+">O+</option>
    <option value="O-">O-</option>
    <option value="AB+">AB+</option>
    <option value="AB-">AB-</option>
</select>

<center><h2> Select Increase/Decrease </h2></center>
<select name="incdec" required>
    <option value="" disabled selected>Select your choice</option>
    <option value="inc">Increase</option>
    <option value="dec">Decrease</option>
</select>

<center><h2>Units of Blood</h2></center>
<input type="text" placeholder="Enter Units" name="units" id="myUnit" required>
<center><br><button type="submit" class="button"> Save </button></center>
</div>
</form>
<br>
<center>
<table id="customers">
<tr style="background-color: green;">
<th>Blood Group</th>
<th>Units</th>
</tr>
</center>
<center>
<tr>
<%
String id=request.getParameter("id");
try{
	Connection con = ConnectionProvider.getCon();
	Statement st= con.createStatement();
	ResultSet rs=st.executeQuery("select  *from stock");
	while(rs.next())
	{
%>

<td><center><%=rs.getString(1) %></center>
<td><center><%=rs.getString(2) %></center>
</tr>

<%
	}
}
catch(Exception e){
	System.out.println(e);
}
%>
</table>
</center>
</div>
  <script type="text/javascript" defer>
 function validateForm(){
	 var myUnit = document.getElementById("myUnit");
	  if (myUnit.value<0 ) {
		    window.alert("Something Wrong...!!!");
		    myUnit.focus();
		    return false;
		  } 
      return true;
 }
 </script>
</body>
</html>

