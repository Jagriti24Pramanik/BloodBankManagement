<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="Project.ConnectionProvider" errorPage="errorPage.jsp" %>
<%@ page import="java.sql.* , javax.servlet.*, java.text.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>New Donor</title>
<head>
 <link rel="stylesheet" href="style.css" type="text/css" media="screen">
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
h2,h1
{	
	margin-left:20%;
}
hr
{
    width:60%;	
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
  <li  style="float:right"><form action="hospitalLogoutAction" method="Post"><button type="submit">Logout</button></form></li>
  </div>
</ul>
<%
     response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
     response.setHeader("Expires", "0");
     if(session.getAttribute("username")==null){
    	 response.sendRedirect("hospitalLogin.jsp");
     }
%>
<%
String msg=request.getParameter("msg");
if("valid".equals(msg))
{
%>
<center><font color="green" size="5"> Successfully Updated... </font></center>
<% 
}
if("invalid".equals(msg))
{
%>
<center><font color="red" size="5"> Something Went Wrong...!!!<br> Please , Try Again. </font></center>
<%	
}
%>
<%
int id=1;
try
{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select max(id) from donar");
	while(rs.next())
	{
		id=rs.getInt(1);
		id=id+1;
	%>
    <div class="container"></div>
    <h1 style="color:red;"> Donor ID : 6ND09 - 0<%out.println(id);%> - 015</h1>
<% 
	}
}
catch(Exception e){
	System.out.println(e);
}
%>
<div class="container">
   <form action="addNewDonarAction.jsp" method="post" name="myform" onsubmit="return validateForm()">

        <input type="hidden" name="id" value="<%out.println(id);%>" >
        <h2>Name</h2>
        <input type="text" placeholder="Enter Name" name="name" id="myName" size="40" required>
        <hr>
        <h2>Age</h2>
        <input type="number" placeholder="Enter Age" name="age" id="myAge" maxlength="2" size="2" required>
        <hr>
        <h2>Weight</h2>
        <input type="number" placeholder="Enter Weight" name="weight" id="myWeight" required>
        <hr>
        <h2>Mobile Number</h2>
        <input type="number" placeholder="Enter Mobile numner" name="mobilenumber" id="myMobilenumber" minlength="10" maxlength="10" size="10" required>
        <hr>
        <h2>Gender</h2>
        <select name="gender" required>
        <option value="" disabled selected>Select your Gender</option>
             <option value= "Male" > Male </option>
             <option value= "Female"> Female </option>
             <option value= "Others"> Others </option>
        </select>
        <hr>
        <h2>Email</h2>
        <input type="email" placeholder="Enter Email ID" name="email" id="myEmail" required>
        <hr>
        <h2>Blood Group</h2>
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
         <h2>Address</h2>
        <input type="text" placeholder="Enter Address" name="address" size="50" required>
        <hr>
        <br>
        <center><button type="submit" class="button"> Save </button></center></form>
  </div>
  
  <script type="text/javascript" defer>
 function validateForm(){
	 var myName = document.getElementById("myName");
	 var myAge = document.getElementById("myAge");
	 var myWeight = document.getElementById("myWeight");
	 var myEmail = document.getElementById("myEmail");
     var myMobilenumber=document.getElementById("myMobilenumber");
     
	  if (myName.value === "" || myName.value === null) {
	    window.alert("Name must be filled out");
        myName.focus();
        return false;
	  }
	  if (myAge.value<18 && myAge.value>70 ) {
		    window.alert("Age has to be more than 18 and less than 70");
		    myAge.focus();
		    return false;
		  } 
	  if (myWeigh.value<50 && myWeigh.value>120) {
			 window.alert("Weight has to be more than 50 and less than 120");
			 myWeight.focus();
			 return false;
		 }
      atpos = myEmail.indexOf("@");
      dotpos = myEmail.lastIndexOf(".");
      if (atpos < 1 || ( dotpos - atpos < 2 )) {
             window.alert("Please enter correct email ID");
             myEmail.focus() ;
             return false;
		    }
      if(myMobilenumber.toString().length==10){  
    	  window.alert("Mobile Number must be 10 characters long.");  
          myMobilenumber.focus() ;
          return false;
    	  }  
      return true;
 }
 </script>
</body>
</html>