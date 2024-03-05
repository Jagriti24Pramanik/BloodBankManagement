<%@ page import="Project.ConnectionProvider" errorPage="errorPage.jsp" %>
<%@ page import="java.sql.*" %>
<%@include file="header.html"%>
<!DOCTYPE html>
<html>
<head>
<title>Online Applications</title>
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
<br>
<%
     response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
     response.setHeader("Expires", "0");
     if(session.getAttribute("username")==null){
    	 response.sendRedirect("adminLogin.jsp");
     }
%>
<%
String msgs=request.getParameter("msgs");
if("valid".equals(msgs))
{
%>
<center><font color="green" size="6"> Email Sent Successfully...<br></font></b></center>
<% 
}
if("invalid".equals(msgs))
{
%>
<center><font color="red" size="6"> Something Went Wrong with the Email...!!!<br> Please , Try Again. <br></font></b></center>
<%	
}
%>
<table  id="customers">
 <tr>

<th><center>ID</center></th>
<th><center>Name & Details</center></th>
<th><center>Accept</center></th>
<th><center>Reject</center></th>
</tr>
<%
try{
	Connection con = ConnectionProvider.getCon();
	Statement st= con.createStatement();
	ResultSet rs=st.executeQuery("select *from applicant where status= 'pending'");
	while(rs.next())
	{
%>

<td><center> 9DA07 - 20<%=rs.getString(1) %> - 045</center>
  <td><details><summary><%=rs.getString(2)%></summary>
  <p><font color="blue" size="3.5" > 1. Age : <%=rs.getString(3)%><br>2. Weight : <%=rs.getString(4)%><br> 3. Mobile Number : <%=rs.getString(5)%><br> 4. Gender : <%=rs.getString(6)%><br>
  5. Email ID : <%=rs.getString(7)%><br> 6. Blood Group : <%=rs.getString(8)%><br>7. Donate Blood in 4 Months : <%=rs.getString(9)%><br> 8. Any Disease : <%=rs.getString(10)%><br>
  9. Any Medicines : <%=rs.getString(11)%><br> 10. Periods : <%=rs.getString(12)%><br> 11. Pregnant : <%=rs.getString(13)%><br> 12. Address : <%=rs.getString(14)%><br>
  13. City : <%=rs.getString(15)%><br> 14. District : <%=rs.getString(16)%><br> 15. Pin Code : <%=rs.getString(17)%></font></p>
<td><center><a href="applicantRequestAccept.jsp?id=<%=rs.getString(1) %>&email=<%=rs.getString(7) %>"> Accept </a></center>
<td><center><a href="applicantRequestReject.jsp?id=<%=rs.getString(1) %>&email=<%=rs.getString(7) %>"> Reject </a></center>
</tr>
<%		
	}
}
catch(Exception e){
	System.out.println(e);
}
%>
</details>
</table>
</body>
</html>
