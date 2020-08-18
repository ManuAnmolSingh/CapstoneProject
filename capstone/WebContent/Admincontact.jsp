<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
  		<meta name="viewport" content="width=device-width, initial-scale=1">
  		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		<title>Mail details</title>
	<style>


.glow-on-hover {
    width: 220px;
    height: 50px;
    border: none;
    outline: none;
    color: #fff;
    background: #111;
    cursor: pointer;
    position: relative;
    z-index: 0;
    border-radius: 10px;
}

.glow-on-hover:before {
    content: '';
    background: linear-gradient(45deg, #ff0000, #ff7300, #fffb00, #48ff00, #00ffd5, #002bff, #7a00ff, #ff00c8, #ff0000);
    position: absolute;
    top: -2px;
    left:-2px;
    background-size: 400%;
    z-index: -1;
    filter: blur(5px);
    width: calc(100% + 4px);
    height: calc(100% + 4px);
    animation: glowing 20s linear infinite;
    opacity: 0;
    transition: opacity .3s ease-in-out;
    border-radius: 10px;
}

.glow-on-hover:active {
    color: #000
}

.glow-on-hover:active:after {
    background: transparent;
}

.glow-on-hover:hover:before {
    opacity: 1;
}

.glow-on-hover:after {
    z-index: -1;
    content: '';
    position: absolute;
    width: 100%;
    height: 100%;
    background: #111;
    left: 0;
    top: 0;
    border-radius: 10px;
}

@keyframes glowing {
    0% { background-position: 0 0; }
    50% { background-position: 400% 0; }
    100% { background-position: 0 0; }
}
@import url(https://fonts.googleapis.com/css?family=Roboto:400,100,900);
* {
  box-sizing: inherit;
  transition-property: all;
  transition-duration: 0.8s;
  transition-timing-function: ease;
}
body {
  background: black;
  font-family: 'Roboto', sans-serif;
  font-weight: 400;
}

.btn {
  color: #fff;
  cursor: pointer;
  font-size: 16px;
  font-weight: 400;
  line-height: 45px;
  margin: 0 0 2em;
  max-width: 160px;
  position: relative;
  text-decoration: none;
  text-transform: uppercase;
  
}

.btn-2 {
  letter-spacing: 0;
}
.btn-2:hover, .btn-2:active {
  letter-spacing: 10px;
}
.btn-2:after, .btn-2:before {
backface-visibility: hidden;
  border: 1px solid rgba(255, 255, 255, 0);
  bottom: 0px;
  content: " ";
  display: block;
  margin: 0 auto;
  position: relative;
  transition: all 280ms ease-in-out;
  width: 0;
}
.btn-2:hover:after, .btn-2:hover:before {
  backface-visibility: hidden;
  border-color: #fff;
  transition: width 350ms ease-in-out;
  width: 70%;
}
.btn-2:hover:before {
  bottom: auto;
  top: 0;
  width: 70%;
}

	
	</style>	
	</head>
	<body style="background-color:black; color:white">

	
	

		  <div class="container-fluid">
		    <div class="navbar-header">
		      
		      <h2><a class="btn btn-2" href="dummy.jsp">Home</a></h2>
		      
		    </div>  
		  </div>

	
	<div class="container-fluid">
	
	<h3><a  href="contact.jsp?type=contact">contact Manager</a> / Admin</h3>
	<br>
	<form id="contact-form" method="post" action="mailprocess.jsp" role="form">


        <div class="row align-items-center">
            <div class="col-sm-4">
                <div class="form-group">
                    <label for="form_name">Firstname *</label>
                    <input id="form_name" type="text" name="name" class="form-control" placeholder="Please enter your firstname *" required="required" data-error="Firstname is required.">
                    <div class="help-block with-errors"></div>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="form-group">	
                    <label for="form_lastname">Lastname *</label>
                    <input id="form_lastname" type="text" name="surname" class="form-control" placeholder="Please enter your lastname *" required="required" data-error="Lastname is required.">
                    <div class="help-block with-errors"></div>
                </div>
            </div>
        </div>
        <div class="row align-items-center">
            <div class="col-sm-4">
                <div class="form-group">
                    <label for="form_email">Email *</label>
                    <input id="form_email" type="email" name="email" class="form-control" placeholder="Please enter your email *" required="required" data-error="Valid email is required.">
                    <div class="help-block with-errors"></div>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="form-group">
                    <label for="form_need">Please specify your need *</label>
                    <select id="form_need" name="need" class="form-control" required="required" data-error="Please specify your need.">
                        <option value=""></option>
                        <option value="Add Teater">New Tester</option>
                        <option value="Add Developer">New Developer</option>
                        <option value="Regarding Bug">Report Bug</option>
                        <option value="Other">Other</option>
                    </select>
                    <div class="help-block with-errors"></div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-8">
                <div class="form-group">
                    <label for="form_message">Message*</label>
                    <textarea id="form_message" name="message" class="form-control" placeholder="Message for me *" rows="4" required="required" data-error="Please, leave us a message."></textarea>
                    <div class="help-block with-errors"></div>
                </div>
            </div>
        </div>
        <div class="row">
        	<div class="col-sm-3">
        	</div>
            <div class="col-sm-3">
                <button class="glow-on-hover" type="submit">Submit</button>
                <input type="hidden" name="type" value="<%=(String)request.getParameter("type")%>" />
            </div>
        
        </div>
        <div class="row">
        <div class="col-sm-3">
        </div>
            <div class="col-sm-8">
                <p class="text-muted">
                    <strong>*</strong>
                     These fields are required.
                    
            </div>
        </div>
    

</form>
</div>
<%      
        String t=request.getParameter("msg");
        if(t!=null){
        out.println("<script>$(document).ready(function(){swal("+t+");});</script>"); 
        }
%>
	</body>
</html>