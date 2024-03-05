<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="Project.ConnectionProvider, java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<title>Edit Details</title>
 <link rel="stylesheet" href="style.css" type="text/css" media="screen">
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
<style>
.center1 {
  margin: 0;
  position: absolute;
  top: 30%;
  left: 50%;
  -ms-transform: translate(-50%, -50%);
  transform: translate(-50%, -50%);
}
.center2 {
  margin: 0;
  position: absolute;
  top: 40%;
  left: 50%;
  -ms-transform: translate(-50%, -50%);
  transform: translate(-50%, -50%);
}
.center3 {
  margin: 0;
  position: absolute;
  top: 50%;
  left: 50%;
  -ms-transform: translate(-50%, -50%);
  transform: translate(-50%, -50%);
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
<br>
<%
     response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
     response.setHeader("Expires", "0");
     if(session.getAttribute("username")==null){
    	 response.sendRedirect("hospitalLogin.jsp");
     }
%>
<center>
<form action = "editDetails.jsp">
<font color="black" size="5">Search By ID: <input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search for Details.." title="Type in a id"></font>
</form>
</center>
<br>
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
<th>Edit</th>
</tr>

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
<td><a href="updateDonar.jsp?id=<%=rs.getString(1) %>"> Edit </a></td>
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
</body>
</html>