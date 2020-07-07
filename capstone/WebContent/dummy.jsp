<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html>
<html lang="en">
<title>Menu</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body,h1,h2,h3,h4,h5,h6 {font-family: "Lato", sans-serif}
.w3-bar,h1,button {font-family: "Montserrat", sans-serif}
.fa-anchor,.fa-coffee {font-size:200px}
</style>
<body>

<!-- Navbar -->
<div class="w3-top">
  <div class="w3-bar w3-black w3-card w3-left-align w3-large">
    <a class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-padding-large w3-hover-white w3-large w3-red" href="javascript:void(0);" onclick="myFunction()" title="Toggle Navigation Menu"><i class="fa fa-bars"></i></a>
    <a href="dummy.jsp" class="w3-bar-item w3-button w3-padding-large w3-white">Home</a>
    <a href="Loginpage.jsp?type=Manager" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">Manager</a>
    <a href="DeveloperLogin.jsp?type=Developer" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">Developer</a>
    <a href="TesterLogin.jsp?type=Tester" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">Tester</a>
    <a href="contact.jsp" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white"style="float: right">Contact</a>
    <a href="Loginpage.jsp?type=Admin" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white"style="float: right">Admin</a>
  </div>

  <!-- Navbar on small screens -->
  <div id="navDemo" class="w3-bar-block w3-white w3-hide w3-hide-large w3-hide-medium w3-large">
    <a href="Loginpage.jsp?type=Manager" class="w3-bar-item w3-button w3-padding-large">Manager</a>
    <a href="DeveloperLogin.jsp?type=Developer" class="w3-bar-item w3-button w3-padding-large">Developer</a>
    <a href="TesterLogin.jsp?type=Tester" class="w3-bar-item w3-button w3-padding-large">Tester</a>
    <a href="contact.jsp" class="w3-bar-item w3-button w3-padding-large" style="float: right">Contact</a>
    <a href="Loginpage.jsp?type=Admin" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white"style="float: right">Admin</a>
  </div>
</div>

<!-- Header -->
<header class="w3-container w3-black w3-center" style="padding:128px 16px">
  <h1 class="w3-margin w3-jumbo">Issue Tracking Tool</h1>
  <p class="w3-xlarge">Web App</p>
  <button class="w3-button w3-black w3-padding-large w3-large w3-margin-top">Get Started</button>
</header>

<!-- First Grid -->
<div class="w3-row-padding w3-padding-64 w3-container">
  <div class="w3-content">
    <div class="w3-twothird">
      <h1>Manager</h1>
      <h5 class="w3-padding-32">A project manager is a person who has the overall responsibility for the successful initiation, planning, design, execution, monitoring, controlling and closure of a project.</h5>

    </div>

    <div class="w3-third w3-center">
      <i class="fa fa-anchor w3-padding-64 w3-text-black"></i>
    </div>
  </div>
</div>

<!-- Second Grid -->
<div class="w3-row-padding w3-light-grey w3-padding-64 w3-container">
  <div class="w3-content">
    <div class="w3-third w3-center">
      <i class="fa fa-coffee w3-padding-64 w3-text-black w3-margin-right"></i>
    </div>

    <div class="w3-twothird">
      <h1>Developer</h1>
      <h5 class="w3-padding-32">Developers work in computer manufacturing companies or for software publishers. They are responsible for the design, testing and maintenance of software programs for computer operating systems or applications, such as word processing or database management systems
      </h5>
    </div>
  </div>
</div>

<!-- Third Grid -->
<div class="w3-row-padding w3-padding-64 w3-container">
  <div class="w3-content">
    <div class="w3-twothird">
      <h1>Tester</h1>
      <h5 class="w3-padding-32">A Software Tester is responsible for designing test scenarios for software usability, running these tests, and preparing reports on the effectiveness and defects to the production team.</h5>

      
    </div>

    <div class="w3-third w3-center">
      <i class="fa fa-anchor w3-padding-64 w3-text-black"></i>
    </div>
  </div>
</div>

<div class="w3-container w3-black w3-center w3-opacity w3-padding-64">
    <h1 class="w3-margin w3-xlarge">Quote of the day: live life</h1>
</div>

<!-- Footer -->
<footer class="w3-container w3-padding-64 w3-center w3-opacity">  
  <div class="w3-xlarge w3-padding-32">
    <i class="fa fa-facebook-official w3-hover-opacity"></i>
    <i class="fa fa-instagram w3-hover-opacity"></i>
    <i class="fa fa-snapchat w3-hover-opacity"></i>
    <i class="fa fa-pinterest-p w3-hover-opacity"></i>
    <i class="fa fa-twitter w3-hover-opacity"></i>
    <i class="fa fa-linkedin w3-hover-opacity"></i>
 </div>
 </footer>

<script>
// Used to toggle the menu on small screens when clicking on the menu button
function myFunction() {
  var x = document.getElementById("navDemo");
  if (x.className.indexOf("w3-show") == -1) {
    x.className += " w3-show";
  } else { 
    x.className = x.className.replace(" w3-show", "");
  }
}
</script>

</body>
</html>
