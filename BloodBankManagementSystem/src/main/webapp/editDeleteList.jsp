<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="Project.ConnectionProvider, java.sql.*" %>

<%@ include file="header.html" %>
<!DOCTYPE html>
<html>
<head>
<title> List of Details </title>
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
  background-color: #4CAF50;
  color: white;
}
</style>
</head>
<body>
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
<center><font color="green" size="5"> Successfully Updated... </font></center><br>
<% 	
}
%>
<%
if("invalid".equals(msg))
{
%>
<center><font color="red" size="5"> Something Went Wrong...!!! Please , Try Again. </font></center><br>
<% 	
}
%>
<%
if("deleted".equals(msg))
{
%>
<center><font color="green" size="5"> Successfully Deleted... </font></center><br>
<% 	
}
%>
<center>
<table id="customers">
<tr>
<th>ID</th>
<th>Name</th>
<th>Age</th>
<th>Weight</th>
<th>Mobile Number</th>
<th>Gender</th>
<th>Email</th>
<th>Blood Group</th>
<th>Address</th>
</tr>
<form action = "editDeleteList.jsp">
<font color="black" size="5">Search By ID: <input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search for Details.." title="Type in a id"></font>
</form>
<br>
<br>
<tr>
<%
try{
	Connection con = ConnectionProvider.getCon();
	Statement st= con.createStatement();
	ResultSet rs=st.executeQuery("select *from donar");
	while(rs.next())
	{
%>
<td><center>6ND09 - 0<%=rs.getInt(1) %>- 015</center></td>
<td><center><%=rs.getString(2)%></center></td>
<td><center><%=rs.getString(3) %></center></td>
<td><center><%=rs.getString(4) %></center></td>
<td><center><%=rs.getString(5) %></center></td>
<td><center><%=rs.getString(6) %></center></td>
<td><center><%=rs.getString(7) %></center></td>
<td><center><%=rs.getString(8) %></center></td>
<td><center><%=rs.getString(9) %></center></td>
</tr>
<%		
	}
}
catch(Exception e){
	System.out.println(e);
}
%>
<script>
function myFunction() {
  var input, filter, table, tr, td, i, txtValue;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("customers");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i <= tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[0];
    if (td) {
      txtValue = td.textContent || td.innerText;
      if (txtValue.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }       
  }
}
</script>
</table>
</center>

</body>
</html>