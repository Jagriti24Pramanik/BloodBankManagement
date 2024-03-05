<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Hospital Login</title>
<link rel="stylesheet" href="style.css" type="text/css" media="screen">
<style>
input[type="text"], input[type="password"], input[type="submit"]
{
    border: none;
    background:silver;
    height: 35px;
    font-size: 16px;
	margin-left:0;
	padding:15px;
	width:100%;	
	border-radius: 25px;
}
.form-box:before {
	background-image: url("high rel.jpg");
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
    <a class="active" href="hospitalLogin.jsp"> Hospital Login</a>
    <a href="adminLogin.jsp"> Admin Login</a>
    <a href="stockFront.jsp"> Stock </a>
    <a href="noticeBoard.jsp"> Notice Board</a>
    <a href="faq.jsp"> FAQ </a>
    <a href="aboutUs.jsp"> About </a>
  </div>
</div>
<body>
<div class="container">
<br>
     <br>
     <%
        String msg = request.getParameter("msg");
        if("invalid".equals(msg))
        {
      %>
      <center><font color="white" size="5"> Invalid Username or Password...!!! <br> Please , Try Again. </font></center>  	
      <% 
        }
      %>
     <div class="form-box">
		<div class="header-text">
     <form action="hospitalLoginAction" method="post">
     <center>HOSPITAL LOGIN</center>  <br>
    Username <input type="text" placeholder="Enter Username" name="username" required>  
    Password <input type="password" placeholder="Enter Password" name="password" required> <br>
     <center><button type="submit" class = "button"> Submit </button></center>    
     </div>
     </div>
     </form>
  </div>

</body>
</html>