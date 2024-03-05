<%@page import="Project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
     response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
     response.setHeader("Expires", "0");
     if(session.getAttribute("username")==null){
    	 response.sendRedirect("hospitalLogin.jsp");
     }

String id=request.getParameter("id");
String name=request.getParameter("name");
String age=request.getParameter("age");
String weight=request.getParameter("weight");
String mobilenumber=request.getParameter("mobilenumber");
String gender=request.getParameter("gender");
String email=request.getParameter("email");
String bloodgroup=request.getParameter("bloodgroup");
String address=request.getParameter("address");
String status="pending";
try
{
	Connection con=ConnectionProvider.getCon();
	PreparedStatement ps=con.prepareStatement("insert into donar values(?,?,?,?,?,?,?,?,?)");
	ps.setString(1,id);
	ps.setString(2,name);
	ps.setString(3,age);
	ps.setString(4,weight);
	ps.setString(5,mobilenumber);
	ps.setString(6,gender);
	ps.setString(7,email);
	ps.setString(8,bloodgroup);
	ps.setString(9,address);
	ps.executeUpdate();
	response.sendRedirect("addNewDonar.jsp?msg=valid");
	}
	catch(Exception e)
	{
		response.sendRedirect("addNewDonar.jsp?msg=invalid");
	}
	%>