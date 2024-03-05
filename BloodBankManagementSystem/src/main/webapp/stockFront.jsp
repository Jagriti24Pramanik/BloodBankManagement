<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="errorPage.jsp" isErrorPage="false"%>
<%@ page import="Project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="style.css" type="text/css" media="screen">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Stock Availability</title>
<style type="text/css">
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

<div class="header">
  <a href="#default" class="logo"><img class="logo" src="red ray Logo 1.png"></a>
  <div class="header-right">
    <a href="index.jsp"> Home  </a>
    <a href="requestPage.jsp"> Looking For Blood </a>
    <a href="formForDonar.jsp"> Want to Donate </a>
    <a href="hospitalLogin.jsp"> Hospital Login</a>
    <a href="adminLogin.jsp"> Admin Login</a>
    <a class="active" href="stockFront.jsp"> Stock </a>
    <a href="noticeBoard.jsp"> Notice Board</a>
    <a href="faq.jsp"> FAQ </a>
    <a href="aboutUs.jsp"> About </a>
  </div>
</div>
<div class="container wrapper">
		<div class="page-header">
			<h2 class="text-danger" >
				<font size="6"><b> <center>Stock Availability</center> </b></font>
			</h2>
		</div>
<br>
<center>
<table id="customers">
<tr style="background-color: #f2d9e4  ;">
<th><center>Blood Group</center></th>
<th><center>Units</center></th>
</tr>
</center>
<center>
<%
String id=request.getParameter("id");
try{
	Connection con = ConnectionProvider.getCon();
	Statement st= con.createStatement();
	ResultSet rs=st.executeQuery("select  *from stock");
	while(rs.next())
	{
%>
<tr>
<td><center><%=rs.getString(1) %></center></td>
<td><center><%=rs.getString(2) %></center></td>
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
</body>
</html>