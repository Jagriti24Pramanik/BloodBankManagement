<%@ page import="Project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<%@include file="header.html"%>
<!DOCTYPE html>
<html>
<head>
<title>Accepted Online Application </title>
<style>
details > summary {
  padding: 4px;
  width: 200px;
  background-color: #eeeeee;
  border: none;
  box-shadow: 1px 1px 2px #bbbbbb;
  cursor: pointer;
}

details > p {
  background-color: #eeeeee;
  padding: 4px;
  margin: 0;
  box-shadow: 1px 1px 2px #bbbbbb;
}
details {
  display: block;
}
#customers {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
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
<br> 
<center>
<form action = "requestCompleted.jsp">
<font color="black" size="5">Search By ID: <input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search for Details.." title="Type in a id"></font>
</form>
</center>
<br>
<table  id="customers">
 <tr>
<th><center>ID</center></th>
<th><center>Name & Details</center></th>
<th><center> Blood Group</center></th>
<th><center> Location</center></th>
</tr>
<%
try{
	Connection con = ConnectionProvider.getCon();
	Statement st= con.createStatement();
	ResultSet rs=st.executeQuery("select  *from applicant where status= 'completed'");
	while(rs.next())
	{
%>
<td><center> 9DA07- 20<%=rs.getString(1)%> -045</center>
  <td><details><summary><%=rs.getString(2)%></summary>
  <p><font color="blue" size="3">Age : <%=rs.getString(3)%><br>Weight : <%=rs.getString(4)%> <br>Mobile Number : <%=rs.getString(5)%><br>Gender : <%=rs.getString(6)%><br>
  Email ID : <%=rs.getString(7)%><br>Donate Blood in 4 Months : <%=rs.getString(9)%><br>Any Disease : <%=rs.getString(10)%><br>
  Any Medicines : <%=rs.getString(11)%><br> Periods : <%=rs.getString(12)%><br>Pregnant : <%=rs.getString(13)%><br>Address : <%=rs.getString(14)%><br>
  District : <%=rs.getString(16)%><br>Pin Code : <%=rs.getString(17)%></font></p></details>
  <td><center><%=rs.getString(8)%></center></td>
  <td><center><%=rs.getString(15)%></center></td>
</tr>
<%			}
}
catch(Exception e){
	System.out.println(e);
}
%>
</table>
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
