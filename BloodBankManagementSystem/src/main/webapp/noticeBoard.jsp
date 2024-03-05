<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="Project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="style.css" type="text/css" media="screen">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <title>Notice Board</title>
<style>
.darkbg1{
background-color:  #c0c0c0;
border-bottom-color: #be232b;
color: #81181d;
}
.darkbg2{
background-color:#FDF5E6;
border-top-color: #be232b;
color: yellow;
}
 .darkbg3{
background-color: #666666;
border-top-color: #be232b;
color: yellow;
}
.darkbg4 {
background-color: ;
border-top-color: #be232b;
color: #ff0000;

}
,container{
margin: 10px;
color: red;
}
ul {
  list-style-image: url('sqpurple.gif');
}
ul li {
  font-size:25px;
  color: darkblue;
  margin: 5px;
}

h4 {
	color: #A94442;
}

.text {
	background-color: yellow;
	padding: 20px;
	display: none;
}


.picture:hover .text {
	display: block;
}
</style>
</head>
<div class="header">
  <a href="#default" class="logo"><img class="logo" src="red ray Logo 1.png"></a>
  <div class="header-right">
    <a href="index.jsp"> Home  </a>
    <a href="requestPage.jsp"> Looking For Blood </a>
    <a href="formForDonar.jsp"> Want to Donate </a>
    <a href="hospitalLogin.jsp"> Hospital Login</a>
    <a href="adminLogin.jsp"> Admin Login</a>
    <a href="stockFront.jsp"> Stock </a>
    <a class="active" href="noticeBoard.jsp"> Notice Board</a>
    <a href="faq.jsp"> FAQ </a>
    <a href="aboutUs.jsp"> About </a>
  </div>
</div>
<body>
<div class="container wrapper">
		<div class="page-header">
			<h3 class="text-danger" style="font-size:40px">Notice Board</h3>
			</div>
<div class="jumbotron">			
<ul>
  <li><a href="Sreerumpur.jpeg">Blood Donation Camp at Sreerampur </a></li>
  <li><a href="Bandel.png">Blood Donation Camp in Bandel </a></li>
  <li><a href="Rishra.jpeg">Blood Donation Camp arranged by Infinity Sporting Club at Rishra </a></li>
  <li><a href="Banichakra.png">Blood Donation Camp arranged by Banichakra Sporting Club </a></li>
  <li><a href="Bidhan.jpeg">Blood Donation Camp arranged by NSS of Bidhan Chandra College </a></li>
</ul>
</div>
</div>
</body>
</html>