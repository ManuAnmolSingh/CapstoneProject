<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href='https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css'>
<script src='https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
<link href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css'>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script type="text/javascript">
function openNav() {
	  document.getElementById("myNav").style.width = "100%";
	}

	/* Close when someone clicks on the "x" symbol inside the overlay */
	function closeNav() {
	  document.getElementById("myNav").style.width = "0%";
	}
</script>
<style>
.overlay {
  /* Height & width depends on how you want to reveal the overlay (see JS below) */   
  height: 100%;
  width: 0;
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  left: 0;
  top: 0;
  background-color: rgb(0,0,0); /* Black fallback color */
  background-color: rgba(0,0,0, 0.9); /* Black w/opacity */
  overflow-x: hidden; /* Disable horizontal scroll */
  transition: 0.5s; /* 0.5 second transition effect to slide in or slide down the overlay (height or width, depending on reveal) */
}

/* Position the content inside the overlay */
.overlay-content {
  position: relative;
  top: 25%; /* 25% from the top */
  width: 100%; /* 100% width */
  text-align: center; /* Centered text/links */
  margin-top: 30px; /* 30px top margin to avoid conflict with the close button on smaller screens */
}

/* The navigation links inside the overlay */
.overlay a {
  padding: 8px;
  text-decoration: none;
  font-size: 36px;
  color: #818181;
  display: block; /* Display block instead of inline */
  transition: 0.3s; /* Transition effects on hover (color) */
}

/* When you mouse over the navigation links, change their color */
.overlay a:hover, .overlay a:focus {
  color: #f1f1f1;
}

/* Position the close button (top right corner) */
.overlay .closebtn {
  position: absolute;
  top: 20px;
  right: 45px;
  font-size: 60px;
}

/* When the height of the screen is less than 450 pixels, change the font-size of the links and position the close button again, so they don't overlap */
@media screen and (max-height: 450px) {
  .overlay a {font-size: 20px}
  .overlay .closebtn {
    font-size: 40px;
    top: 15px;
    right: 35px;
  }
}
.bg {
    width: 100%;
    height: auto;
    min-height: 100vh;
    background-image: url(http://i.imgur.com/w16HASj.png);
    background-size: 100% 100%;
    background-position: top center
}

.content {
    margin-top: 20%
}

.centered {
    position: absolute;
    top: 40%;
    left: 50%;
    transform: translate(-50%, -50%)
}

.InputStyle {
    border-radius: 25px;
    border: solid 1px white;
    background: transparent;
    width: 300px;
    padding: 10px 20px
}

.InputStyle,
.InputStyle::-webkit-input-placeholder {
    font-size: 12px;
    color: white
}

.social-btn {
    position: absolute;
    bottom: 20px;
    left: 47%
}

i {
    padding: 5px;
    color: white
}

.InputStyle,
.InputStyle {
    border: solid 1px white;
    outline: 0;
    -webkit-appearance: none;
    box-shadow: nones;
    -moz-box-shadow: none;
    -webkit-box-shadow: none
}

.secondLine {
    font-weight: 350;
    font-size: 15px;
    margin-bottom: 15%;
    color: white
}

.firstLine {
    font-size: 30px;
    color: white
}

@media only screen and (max-width: 600px) {
    .firstLine {
        font-size: 20px
    }
}
</style>

</head>
<body>
<!-- The overlay -->
<div id="myNav" class="overlay">

  <!-- Button to close the overlay navigation -->
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>

  <!-- Overlay content -->
  <div class="overlay-content">
    <a href="#">About</a>
    <a href="managerdashboard.jsp">Back</a>
    <a href="contact.jsp">Contact</a>
    <a href="out">Logout</a>
  </div>

</div>




<div class="bg text-center">
    <!--Div for Centered Text & Input-->
    
    <div class="centered">

        <p class="firstLine"> E &nbsp; M &nbsp; A &nbsp; I &nbsp; L &nbsp;  &nbsp; M &nbsp; E </p>
        <p class="secondLine">For Changing the password</p>
        <span onclick="openNav()">open</span>
        <form method="post" action="otpemail.jsp">
	        <p> <input class="InputStyle" name="email" placeholder="place the emaill here" style="font-family:Arial, FontAwesome" type="text"> </p>
	        
	
	        <input type="submit" class="btn btn-info" name="save" value="submit" >
        </form>


    </div>
 

</div>


</body>
</html>