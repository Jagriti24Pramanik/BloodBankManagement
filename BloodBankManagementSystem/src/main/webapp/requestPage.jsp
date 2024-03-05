<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="errorPage.jsp"%>
    <%@ page import="Project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<title>Request for Blood</title>
<link rel="stylesheet" href="style.css" type="text/css" media="screen">
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
.mySlides {display:none;}

input[type="text"], input[type="mail"],select
{
    border: none;
    background:silver;
    height: 50px;
    font-size: 16px;
	margin-left:2%;
	padding:15px;	
}
img{
width:55%;
height:180px;
}
.center {
  margin: 0;
  position: absolute;
  top: 83%;
  left: 50%;
  -ms-transform: translate(-50%, -50%);
  transform: translate(-50%, -50%);
}
</style>
<div class="header">
  <a href="#default" class="logo"><img class="logo" src="red ray Logo 1.png"></a>
  <div class="header-right">
    <a href="index.jsp"> Home  </a>
    <a class="active" href="requestPage.jsp"> Looking For Blood </a>
    <a href="formForDonar.jsp"> Want to Donate </a>
    <a href="hospitalLogin.jsp"> Hospital Login</a>
    <a href="adminLogin.jsp"> Admin Login</a>
    <a href="stockFront.jsp"> Stock </a>
    <a href="noticeBoard.jsp"> Notice Board</a>
    <a href="faq.jsp"> FAQ </a>
    <a href="aboutUs.jsp"> About </a>
  </div>
</div>

<body>

<div class="info" style="max-width:100%">
    <center> <img src="request.jpg" ></center>
    </div>
 
   <center><h2><b>Enter Your Details to Request for Blood</b></h2></center>
   
<%
int id=1;
try
{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select max(id) from bloodrequest");
	while(rs.next())
	{
		id=rs.getInt(1);
		id=id+1;
	%>
    <div class="container">
    <center><h3 style="color:red;"><b> Request ID : 4RB03- 30<%out.println(id); %> -084</b></h3></center>
<% 
	}
}
catch(Exception e){
	System.out.println(e);
}
%>
    
   <center>
   <form action="requestPageAction.jsp" method ="post">
   <input type="hidden" name="id" value="<%out.println(id);%>" >
   <input type="text" name="name" placeholder="Enter Name" required>
   <input type="text" name="mobilenumber" placeholder="Enter Mobile" required>
   <input type="mail" name="email" placeholder="Enter Email Address" required>
        <select name="bloodgroup" required>
            <option value="" disabled selected>Select your Blood Group</option>
             <option value= "A+"> A+ </option>
             <option value= "A-"> A- </option>
             <option value= "B+"> B+ </option>
             <option value= "B-"> B- </option>
             <option value= "O+"> O+ </option>
             <option value= "O-"> O- </option>
             <option value= "AB+"> AB+ </option>
             <option value= "AB-"> AB- </option>
        </select>
   </center>
   </div>
<br> <div class="center"> <center><button class="button1"><span>Submit</span></button></center></div>
   </form>

<div class="container"> 
<br>         
<br>
</div>
</body>
<br>
<body>

   <%
   String msg=request.getParameter("msg");
   if("valid".equals(msg))
   {
	   %>
	   <center><font color="green" size="5"> Request Submitted Successfully. <br>You will be notified within 24 hours via Email...<br> </font></center>
	   <% 
   }
   %>
   
    <%

   if("invalid".equals(msg))
   {
	   %>
	   <center><font color="red" size="5">Invalid...!!! Try Again.</font></center>
	   <% 
   }
   %>

</body>
</html>