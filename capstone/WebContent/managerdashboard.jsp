<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
  h4 {
    border-bottom: 1px solid #000000;
}
.panel{
background:black;}
h4,h3,p{
color: white;
}
.row.content {height: 450px}
    
    /* Set gray background color and 100% height */
    .sidenav {
      padding-top: 20px;
      background-color: #428bca;
      height: 100%;
    }
    
    /* Set black background color, white text and some padding */
    footer {
      background-color: #555;
      color: white;
      padding: 15px;
      text-align: center;
    }
    
    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content {height:auto;} 
    }
body{
    background-color: black;
}
.navbar {
  left: 100px; /* just an estimate of your sidebar's width */
  width: calc(100% - 200px);
  color:navbar-light;
}
.navbar-text { 
            color: white; 
        } 
.btn-md {
    margin: 10px;
    color:black;
    font-size: 20px;
    border-radius: 10px;
    width:70%;    //Specify your width here
}
.container {
    margin-top: 30px
}

.counter-box {
    display: block;
    background: #f6f6f6;
    padding: 40px 20px 37px;
    text-align: center;
    border-radius: 12px;
}

.counter-box p {
    margin: 5px 0 0;
    padding: 0;
    color: #909090;
    font-size: 18px;
    font-weight: 500;
    
}

.counter-box i {
    font-size: 60px;
    margin: 0 0 15px;
    color: #d2d2d2
}

.counter {
    display: block;
    font-size: 32px;
    font-weight: 700;
    color: #666;
    line-height: 28px
}

.counter-box.colored {
    background: rgba(0,0,255,0.3);
}

.counter-box.coloreds {
    background: rgba(255,255,0,0.3);
}
.counter-box.coloredss {
    background:rgba(0,255,0,0.3);
}


.counter-box.colored p,
.counter-box.colored i,
.counter-box.colored .counter {
    color: #fff
}
  </style>
</head>
<body>
<% 
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");

if(session.getAttribute("name")==null)
	response.sendRedirect("Loginpage.jsp?type=Manager");
	
	%>
<div class="container-fluid">
  <div class="page-header">
	    
	      <h2>E-Bug Tracking System</h2>
	      <p>Manage Project and Track bugs online</p>
	    

  </div>
  <div class="col-lg-8 text-right text-white-50"><h4><%if (session != null) {
	    		         if (session.getAttribute("name") != null) {
	    		            String name = (String) session.getAttribute("name");
	    		            out.print("Welcome Manager, " + name +"");
	    		         } 
	    		      }%></h4></div>
  </div>    
</div>
<nav class="navbar navbar-inverse navbar-center">
  <div class="container-fluid">
   
    <ul class="nav navbar-nav">
      <li class="w3-bar-item w3-button w3-padding-large w3-white w3-hover-white"><a href="dummy.jsp">Home</a>
      </li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="contact.jsp"><span class="glyphicon glyphicon-user"></span> Contact</a></li>
      <li><a href="out"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>

    </ul>
  </div>
</nav>

<div class="container">
  <h4>Welcome to E-bug tracker</h4>
  <div class="panel panel-default">
    <div class="panel-body">
    <button onclick="document.location='register.jsp?type=Manager'" type="button" class="btn btn-primary btn-md">Add user</button>
	<button onclick="document.location='table.jsp?type=Manager'" type="button" class="btn btn-primary btn-md">User Report</button>
	<button onclick="document.location='Reportviewstatus.jsp?type=Manager'" type="button" class="btn btn-primary btn-md">Project Report</button>
	<button onclick="document.location='developerbugreport.jsp?type=Manager'" type="button" class="btn btn-primary btn-md">Bug Report</button>
	<button onclick="document.location='otpindex2.jsp?type=Manager'" type="button" class="btn btn-primary btn-md">Change Password</button>
	<button onclick="document.location='logout.jsp?type=Manager'" type="button" class="btn btn-primary btn-md">Logout</button>
    </div>
    
  </div>
  
</div>


<footer class="w3-container w3-center">  
  <div class="w3-xlarge w3-padding-32">
    <i class="fa fa-facebook-official w3-hover-opacity"></i>
    <i class="fa fa-instagram w3-hover-opacity"></i>
    <i class="fa fa-snapchat w3-hover-opacity"></i>
    <i class="fa fa-pinterest-p w3-hover-opacity"></i>
    <i class="fa fa-twitter w3-hover-opacity"></i>
    <i class="fa fa-linkedin w3-hover-opacity"></i>
 </div>
 </footer>
</body>
</html>