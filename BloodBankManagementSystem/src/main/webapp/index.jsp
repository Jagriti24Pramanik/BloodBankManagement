<%@page errorPage="errorPage.jsp" %>
<head>
<title>Blood Bank Management System</title>
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
width:100%;
height:450px;
}
</style>
</head>
<div style="background-color: white;">

<div class="header">
  <a href="#default" class="logo"><img class="logo" src="red ray Logo 1.png"></a>
  <div class="header-right">
    <a class="active" href="index.jsp"> Home  </a>
    <a href="requestPage.jsp"> Looking For Blood </a>
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
<div style="max-width:100%; ">
    <div style="max-width:100%; ">
      <img class="mySlides"  src="size.jpg" >
      <img class="mySlides"  src="blood-bank-head.jpg" >
      <img class="mySlides"  src="Blood-Banking-Blog.png" >

	</div>
</div>
	<script>
var myIndex = 0;
carousel();

function carousel() {
    var i;
    var x = document.getElementsByClassName("mySlides");
    for (i = 0; i < x.length; i++) {
       x[i].style.display = "none";  
    }
    myIndex++;
    if (myIndex > x.length) {myIndex = 1}    
    x[myIndex-1].style.display = "block";  
    setTimeout(carousel, 8000); // Change image every 2 seconds
}
</script>
   </div>
   <br><center><h2 style="color:red"><b>LEARN ABOUT DONATION</b></h2></center><br><br>
   <center><div style="width:1000; height:450;"><img src="bb6.png" alt="Blood Donation Chart"></div></center><br>
   <div class="container">
<div class="jumbotron">
  <header class="typeHeading">
				<center><h2 style="color:red; "><u><b>TYPES OF DONATION</b></u></h2></center><br>
			</header>
			<div class="content">
                <p style="text-align: center;">The human body contains five liters of blood, which is made of several useful components i.e. <strong>Whole blood</strong>, <strong>Platelet</strong>, and <strong>Plasma</strong>.</p>
                <p style="text-align: center;">Each type of component has several medical uses and can be used for different medical treatments. your blood donation determines the best donation for you to make.</p>
                <p style="text-align: center;">For <strong>plasma</strong> and <strong>platelet</strong> donation you must have donated whole blood in past two years.</p>
                							
            </div></div>
            <br>

	<div class="col-sm-4" style="background-color:white;">
      <h4 style="color:red;">
							<u><b>Whole Blood</b></u>
						</h4>
					
					 
					<li style="list-style-type: disc">Last for: Red cells can be stored for 42 days.
					</li><br>
					<li style="list-style-type: disc">It takes 15 minutes to donate.</li><br>
					<li style="list-style-type: disc">After every 12 weeks we can donate.</li><br>
					<li style="list-style-type: disc">You need to be 18-65 years old, weigh above 45kg</li>
				</ul>
    </div>
    <div class="col-sm-4" style="background-color:white;">
      <h4 style="color:red;">
							<u><b>Plasma</b></u>
						</h4>
					
					
					<li style="list-style-type: disc">Plasma can last up to one year when frozen.</li><br>
					<li style="list-style-type: disc">It takes 15 minutes to donate.</li><br>
					<li style="list-style-type: disc">After every 2-3 weeks we can donate.</li><br>
					<li style="list-style-type: disc">For men's : 18-70 years old, For women's : 20-70 years old, weigh above 50kg and must have given successful whole blood donation in last two years.</li>
				</ul>
    </div>
    <div class="col-sm-4" style="background-color:white;">
      <h4 style="color:red;">
							<u><b>Platelet</b></u>
						</h4>
				
					<li style="list-style-type: disc">Platelet can last upto five days..</li><br>
					<li style="list-style-type: disc">It takes 45 minutes to donate.</li><br>
					<li style="list-style-type: disc">After every 2 weeks we can donate.</li><br>
					<li style="list-style-type: disc">You need to be 18-70 years old (men), weigh above 50kg and have given a successful plasma donation in the past 12 months</li>
					
    </div>
    </div>
  </div><br><br>
</body>
</html>
</html>