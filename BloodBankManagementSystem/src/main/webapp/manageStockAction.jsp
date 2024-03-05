<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="errorPage.jsp"%>
<%@ page import="Project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<%
     response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
     response.setHeader("Expires", "0");
     if(session.getAttribute("username")==null){
    	 response.sendRedirect("adminLogin.jsp");
     }
%>
<%
String bloodgroup = request.getParameter("bloodgroup");
String incdec = request.getParameter("incdec");
String units= request.getParameter("units");
int units1= Integer.parseInt(units);
try{
	Connection con = ConnectionProvider.getCon();
	Statement st= con.createStatement();
	
	if(incdec.equals("inc"))
	{
		st.executeUpdate("update stock set units=units+'"+units1+"'where bloodgroup='"+bloodgroup+"'");
	}
	else
	{
		st.executeUpdate("update stock set units=units-'"+units1+"'where bloodgroup='"+bloodgroup+"'");
	}
	response.sendRedirect("manageStock.jsp?msg=valid");
}
catch(Exception e){
	response.sendRedirect("manageStock.jsp?msg=invalid");
}
%>