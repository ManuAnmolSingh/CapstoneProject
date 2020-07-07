<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Menu</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <style>
     body {
    font-family: "Lato", sans-serif;
}




.main-head{
    height: 150px;
    background: #FFF;
   
}

.sidenav {
    height: 100%;
    background-color: #000;
    overflow-x: hidden;
    padding-top: 100px;
}


.main {
    padding: 0px 10px;
}

@media screen and (max-height: 450px) {
    .sidenav {padding-top: 15px;}
}

@media screen and (max-width: 450px) {
    .login-form{
        margin-top: 10%;
    }

    .register-form{
        margin-top: 10%;
    }
}

@media screen and (min-width: 768px){
    .main{
        margin-left: 40%; 
    }

    .sidenav{
        width: 40%;
        position: fixed;
        z-index: 1;
        top: 0;
        left: 0;
    }

    .login-form{
        margin-top: 80%;
    }

    .register-form{
        margin-top: 20%;
    }
}


.login-main-text{
    margin-top: 20%;
    padding: 60px;
    color: #fff;
}

.login-main-text h2{
    font-weight: 300;
}

.btn-black{
    background-color: #000 !important;
    color: #fff;
}

  </style>
</head>
<body>
	<div class="nav">
	   <div class="w3-bar w3-black w3-card w3-left-align w3-large">
		  <a href="dummy.jsp" class="w3-bar-item w3-button w3-padding-large w3-hover-white" style="left: 540px;position:relative;">Home</a>
		  <a href="Loginpage.jsp?type=Manager" class="w3-bar-item w3-button w3-padding-large w3-hover-white" style="left: 540px;position:relative;">Manager</a>
		  <a href="DeveloperLogin.jsp?type=Developer" class="w3-bar-item w3-button w3-padding-large w3-hover-white" style="left: 540px;position:relative;">Developer</a>
		  <a href="TesterLogin.jsp?type=Tester" class="w3-bar-item w3-button w3-padding-large w3-hover-white" style="left: 540px;position:relative;">Tester</a>
		  	      <a href="Loginpage.jsp?type=Admin" class="w3-bar-item w3-button w3-padding-large w3-hover-white" style="left: 720px;position:relative;">Admin</a>
		  <a href="contact.jsp" id="cd" class="w3-bar-item w3-button w3-padding-large w3-hover-white" style="left: 725px;position:relative;">Contact</a>
	   </div>
	</div> 
    <div class="sidenav">
         <div class="login-main-text">
            <h2>Application<br>Tester Login Page</h2>
            <p>Login or register from here to access.</p>
         </div>
      </div>
      <div class="main">
         <div class="col-md-6 col-sm-12">
            <div class="login-form">
               <form class="text-center" id="form" name="form" method="get" action="TestServlet">
               <p class="h4 mb-4">Login as <%=(String)request.getParameter("type")%></p>
                  <div class="form-group">
                     <label>User Name</label>
                     <input type="text" name="UserName" class="form-control" placeholder="User">
                  </div>
                  <div class="form-group">
                     <label>Password</label>
                     <input type="password" name="Password" class="form-control" placeholder="Password">
                  </div>
                  <button type="submit" class="btn btn-black">Login</button>
                  <button type="submit" class="btn btn-secondary">Register</button>
                  

                  

                          
                  <input type="hidden" name="type" value="<%=(String)request.getParameter("type")%>" />
               </form>
            </div>
         </div>
      </div>

</body>
</html>