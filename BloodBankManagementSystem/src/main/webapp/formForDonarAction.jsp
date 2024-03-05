<%@page import="Project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
String id=request.getParameter("id");
String name=request.getParameter("name");
String age=request.getParameter("age");
String weight=request.getParameter("weight");
String mobilenumber=request.getParameter("mobilenumber");
String gender=request.getParameter("gender");
String email=request.getParameter("email");
String bloodgroup=request.getParameter("bloodgroup");
String donateblood=request.getParameter("donateblood");
String disease=request.getParameter("disease");
String medicines=request.getParameter("medicines");
String periods=request.getParameter("periods");
String pregnent=request.getParameter("pregnent");
String address=request.getParameter("address");
String city=request.getParameter("city");
String district=request.getParameter("district");
String pincode=request.getParameter("pincode");
String status = "pending";
try
{
	Connection con=ConnectionProvider.getCon();
	PreparedStatement ps=con.prepareStatement("insert into applicant values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
	ps.setString(1,id);
	ps.setString(2,name);
	ps.setString(3,age);
	ps.setString(4,weight);
	ps.setString(5,mobilenumber);
	ps.setString(6,gender);
	ps.setString(7,email);
	ps.setString(8,bloodgroup);
	ps.setString(9,donateblood);
	ps.setString(10,disease);
	ps.setString(11,medicines);
	ps.setString(12,periods);
	ps.setString(13,pregnent);
	ps.setString(14,address);
	ps.setString(15,city);
	ps.setString(16,district);
	ps.setString(17,pincode);
	ps.setString(18,status);
	ps.executeUpdate();
	response.sendRedirect("formForDonar.jsp?msg=valid");
	}
	catch(Exception e)
	{
		response.sendRedirect("formForDonar.jsp?msg=invalid");
	}
	%>