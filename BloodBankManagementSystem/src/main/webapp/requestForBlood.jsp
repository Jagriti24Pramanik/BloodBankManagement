<%@ page import="Project.ConnectionProvider" errorPage="errorPage.jsp"%>
<%@ page import="java.sql.*" %>
<%@include file="header.html"%>
<html>
<head>
<title> List of Request for Blood</title>
<style>
#customers {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 95%;
}

#customers td, #customers th {
  border: 1px solid #ddd;
  padding: 8px;
}

#customers tr:nth-child(even){background-color: #f2f2f2;}

#customers tr:hover {background-color: #ddd;}

#customers th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #4CAF50;
  color: white;
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
<%
String msg=request.getParameter("msg");
if("valid".equals(msg))
{
%>
<center><font color="green" size="6"> Email Sent Successfully...<br></font></b></center>
<% 
}
if("invalid".equals(msg))
{
%>
<center><font color="red" size="6"> Something Went Wrong with the Email...!!!<br> Please , Try Again. <br></font></b></center>
<%	
}
%>
<br>
<center>
<table id="customers">
<tr>
<th><center>ID</center></th>
<th><center>Name</center></th>
<th><center>Mobile Number</center></th>
<th><center>Email</center></th>
<th><center>Blood Group</center></th>
<th><center>Done</center></th>
<th><center>Delete</center></th>
</tr>

<tr>
<%
try{
	Connection con = ConnectionProvider.getCon();
	Statement st= con.createStatement();
	ResultSet rs=st.executeQuery("select  *from bloodrequest where status= 'pending'");
	while(rs.next())
	{
%>
<td><center>4RB03- 30<%=rs.getString(1)%> -084</center>
<td><center><%=rs.getString(2)%></center>
<td><center><%=rs.getString(3) %></center>
<td><center><%=rs.getString(4) %></center>
<td><center><%=rs.getString(5) %></center>
<td><center><a href="requestForBloodDone.jsp?id=<%=rs.getString(1) %>&email=<%=rs.getString(4) %>"> Done </a></center>
<td><center><a href="requestForBloodDelete.jsp?id=<%=rs.getString(1) %>&email=<%=rs.getString(4) %>"> Delete </a></center>
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
<br>
</body>
</html>