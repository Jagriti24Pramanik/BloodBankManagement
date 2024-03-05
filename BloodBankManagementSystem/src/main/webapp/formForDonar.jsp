
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="Project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title> Online Donation Form </title>
 <link rel="stylesheet" href="style.css" type="text/css" media="screen">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
     <style>
img{
width:50%;
height:150px;
}
.darkbg1{
background-color:  #c0c0c0;
border-bottom-color: #be232b;
color: #81181d;
}
.darkbg2{
background-color:;
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
</style>
<style>
input[type="text"], input[type="password"], input[type="email"], select,input[type="number"]
{
    border: none;
    background:silver;
    height: 50px;
    font-size: 16px;
	padding:15px;
	width:60%;	
	border-radius: 25px;
	margin-left:20%;
}
input[type="radio"]
{
     
     left: 100px;
     margin-left:22%;
}
h3
{	
	margin-left:22%;
	color:rgb(128, 0, 0);
}
hr
{
    width:60%;	   
}
.center {
  margin: 0;
  position: absolute;
  top: 365%;
  left: 50%;
  -ms-transform: translate(-50%, -50%);
  transform: translate(-50%, -50%);
}
</style>
</head>
<div class="header">
  <a href="#default" class="logo"><img class="logo" src="red ray Logo 1.png"></a>
  <div class="header-right">
    <a href="index.jsp"> Home  </a>
    <a href="requestPage.jsp"> Looking For Blood </a>
    <a class="active" href="formForDonar.jsp"> Want to Donate </a>
    <a href="hospitalLogin.jsp"> Hospital Login</a>
    <a href="adminLogin.jsp"> Admin Login</a>
    <a href="stockFront.jsp"> Stock </a>
    <a href="noticeBoard.jsp"> Notice Board</a>
    <a href="faq.jsp"> FAQ </a>
    <a href="aboutUs.jsp"> About </a>
  </div>
</div>

<body>
<h2 style="color:purple"><b><center> For Donating Blood , Please Fill the Form Carefully... <center></center></b></h2>
<%
String msg=request.getParameter("msg");
if("valid".equals(msg))
{
%>
<center><font color="green" size="5"> Successfully Updated...<br> You will be notified within 24 hours via Email...<br></font></b></center>
<% 
}
if("invalid".equals(msg))
{
%>
<center><font color="red" size="5"> Something Went Wrong...!!!<br> Please , Try Again. <br></font></b></center>
<%	
}
%>
<%
int id=1;
try
{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select max(id) from applicant");
	while(rs.next())
	{
		id=rs.getInt(1);
		id=id+1;
	%>
    <div class="container"></div>
    <h3 style="color:red; 	margin-left:25%; "><b>Donar ID : 9DA07- 20<%out.println(id); %> -045</b></h3>
<% 
	}
}
catch(Exception e){
	System.out.println(e);
}
%>
<div class="container">
   <form action="formForDonarAction.jsp", method="post">

        <input type="hidden" name="id" value="<%out.println(id);%>" >
        <h3><b>Name</b></h3>
        <input type="text" placeholder="Enter Name" name="name" required>
        <hr>
        <h3><b>Age</b></h3>
        <input type="number" placeholder="Enter Age" name="age" required>
        <hr>
        <h3><b>Weight</b></h3>
        <input type="number" placeholder="Enter Weight" name="weight" required>
        <hr>
        <h3><b>Mobile Number</b></h3>
        <input type="number" placeholder="Enter Valid Mobile numner" name="mobilenumber" required>
        <hr>
        <h3><b>Gender</b></h3>
        <select name="gender" required>
        <option value="" disabled selected>Select your Gender</option>
             <option value= "Male" > Male </option>
             <option value= "Female"> Female </option>
             <option value= "Others"> Others </option>
        </select>
        <hr>
        <h3><b>Email</b></h3>
        <input type="email" placeholder="Enter Valid Email ID" name="email" required>
        <hr>
        <h3><b>Blood Group</b></h3>
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
        <hr>
        <h3><b>Address</b></h3>
        <input type="text" placeholder="Enter Address" name="address" required>
        <hr>
        <h3><b>City</b></h3>
        <input type="text" placeholder="Enter City" name="city" required>
        <hr>  
        <h3><b>District</b></h3>
        <input type="text" placeholder="Enter District" name="district" required>
        <hr>      
        <h3><b>Pin code</b></h3>
        <input type="number" placeholder="Enter Pin Code" name="pincode" required>
        <hr>
                <h3><b>Have you donated blood in 4 months?</b></h3>
          <input type="radio" id="yes" name="donateblood" value="Yes" required>
                <label for="yes">Yes</label>
            <input type="radio" id="no" name="donateblood" value="No" required>
                <label for="no">No</label><br>
        <hr>
        <h3><b>Do you have any disease?</b></h3>
              <input type="radio" id="yes" name="disease" value="Yes" required>
                 <label for="yes">Yes</label>
             <input type="radio" id="no" name="disease" value="No" required>
                 <label for="no">No</label><br>
        <hr>
        <h3><b>Are you taking any medicines?</b></h3>
              <input type="radio" id="yes" name="medicines" value="Yes" required>
                  <label for="yes">Yes</label>
             <input type="radio" id="no" name="medicines" value="No" required>
                  <label for="no">No</label><br>
        <hr>
        <h3><b>Are you on your periods? (only for Female)</b></h3>
              <input type="radio" id="yes" name="periods" value="Yes" >
                  <label for="yes">Yes</label>
             <input type="radio" id="no" name="periods" value="No" >
                  <label for="no">No</label><br>
        <hr>
        <h3><b>Are you Pregnant ? (only for Female)</b></h3>
              <input type="radio" id="yes" name="pregnent" value="Yes" >
                  <label for="yes">Yes</label>
             <input type="radio" id="no" name="pregnent" value="No" >
                  <label for="no">No</label><br>
        <hr>
        <div class="center"><center><button type="submit" class="button1"><span> Submit </span></button></center></div>
        </form><br>
  </div>
</body>
</html>