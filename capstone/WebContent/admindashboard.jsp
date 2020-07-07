<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
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
  </style>
</head>
<body>

<div class="container-fluid">
  <div class="page-header">
    <h3>E-bug Tracking System</h3>      
    <p>Manage project track online</p>

  </div>    
</div>
<nav class="navbar navbar-inverse navbar-center">
  <div class="container-fluid">
   
    <ul class="nav navbar-nav">
      <li class="w3-bar-item w3-button w3-padding-large w3-white w3-hover-white"><a href="dummy.jsp">Home</a></li>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Page 1 <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="register.jsp">Add User</a></li>
          <li><a href="#">Page 1-2</a></li>
          <li><a href="#">Page 1-3</a></li>
        </ul>
      </li>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Page 2 <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="#">Page 2-1</a></li>
          <li><a href="#">Page 2-2</a></li>
          <li><a href="#">Page 2-3</a></li>
        </ul>
      </li>
      <li><a href="#">Page 3</a></li>
      <li><a href="#">Page 4</a></li>
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
    <button onclick="document.location='register.jsp'" type="button" class="btn btn-primary btn-md">Add user</button>
	<button onclick="document.location='addproject.jsp'" type="button" class="btn btn-primary btn-md">Add Project</button>
	<button onclick="document.location='table.jsp'" type="button" class="btn btn-primary btn-md">User Report</button>
	<button onclick="document.location='Reportviewstatus.jsp'" type="button" class="btn btn-primary btn-md">Project Report</button>
	<button type="button" class="btn btn-primary btn-md">Bug Report</button>
	<button onclick="document.location='changepassword.jsp'" type="button" class="btn btn-primary btn-md">Change Password</button>
	<button onclick="document.location='logout.jsp?type=Admin'" type="button" class="btn btn-primary btn-md">Logout</button>
    </div>
    
  </div>
  
</div>


<footer class="container-fluid text-center">
  <p>Nothing</p>
</footer>
</body>
</html>