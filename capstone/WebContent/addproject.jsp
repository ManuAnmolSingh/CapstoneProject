<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <style>
  .form-control,.control-label{
  margin: 10px;
}
  h3{
 
    border-bottom: 1px solid #000000;
    padding: 5px;}
    /* Remove the navbar's default margin-bottom and rounded borders */ 
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
    }
    
    /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
    .row.content {height: 450px}
    
    /* Set gray background color and 100% height */
    .sidenav {
      padding-top: 20px;
      background-color: #f1f1f1;
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
  </style>
</head>
<body>
<% 


if(session.getAttribute("name")==null)
	response.sendRedirect("Loginpage.jsp");
	
%>
<div class="text-center">

</div>
<div class="container-fluid"> 
  <div class="row">
    <div class="col-lg-4 text-center text-white-50 bg-dark">
      <h2>E-Bug Tracking System</h2>
      <p>Manage Project and Track bugs online</p>
    </div>
    <div class="col-lg-8 text-right text-white-50 bg-dark"><h4>Welcome Manoj | Logout</h4></div>
  </div>
</div>
  <div class="w3-bar w3-black">
    <a href="#" class="w3-bar-item w3-button w3-desktop w3-white">Home</a>
    <a href="#" class="w3-bar-item w3-button w3-desktop">View Projects</a>
    <a href="#" class="w3-bar-item w3-button w3-desktop">Contact</a>
    
    <div class="w3-dropdown-hover w3-desktop">
      <button class="w3-button">Dropdown <i class="fa fa-caret-down"></i></button>
      <div class="w3-dropdown-content w3-bar-block w3-dark-grey">
        <a href="#" class="w3-bar-item w3-button w3-desktop">Link 1</a>
        <a href="#" class="w3-bar-item w3-button w3-desktop">Link 2</a>
        <a href="#" class="w3-bar-item w3-button w3-desktop">Link 3</a>
      </div>
    </div>
    <a href="#" class="w3-bar-item w3-button w3-desktop">Back</a>
  </div>
 
<div class="container-fluid text-center">    
  <div class="row centered-form">
  
    <form class="txt-center" id="form" name="form" method="get" action="projectform">
     <div class="col-lg-12 text-left">
      <h3>Project Form</h3>
      <div class="col-lg-6">
	    <div class="form-group">
	        <label for="inputEmail3" class="col-lg-4 control-label">Project Name:</label>
	        <div class="col-lg-10">
	            <input type="text" class="form-control" id="pname" name="pname">
	        </div>
	    </div>
	    <div class="form-group">
	        <label for="inputPassword3" class="col-lg-4 control-label">Client Name</label>
	        <div class="col-lg-10">
	            <input type="text" class="form-control" id="cname" name="cname">
	        </div>
	    </div>
	    <div class="form-group">
	        <label for="inputPassword3" class="col-lg-4 control-label">Project Type</label>
	        <div class="col-lg-10">
	              <select class="form-control" id="ptype" name="ptype">
	                <option></option>
				    <option>front-end</option>
				    <option>back-end</option>
				    <option>Middleware</option>
				  </select>
	        </div>
	    </div>
	    
		<div class="form-group">
		  <label for="comment" class="col-lg-2 control-label">Description</label>
		  <div class="col-lg-10">
		  <textarea class="form-control" rows="5" id="desc" name="desc"></textarea>
		  </div>
		</div>
		
	  </div>
	  <div class="col-lg-6">
	    <div class="form-group">
	        <label for="inputEmail3" class="col-lg-4 control-label">Project Manager</label>
	        <div class="col-lg-10">
			  <select class="form-control" id="pmanager" name="pmanager">
			    <option></option>
			    <option>Trump</option>
			    <option>Modi</option>
			    <option>Putin</option>
			    <option>Boris Johnson</option>
			  </select>
	        </div>
	    </div>
	    <div class="form-group">
	        <label for="inputPassword3" class="col-lg-6 control-label">Project Technology</label>
	        <div class="col-lg-10">
	            <input type="text" class="form-control" id="ptech" name="ptech">
	        </div>
	    </div>
	    <div class="form-group">
	        <label for="inputEmail3" class="col-lg-6 control-label">Database Technology</label>
	        <div class="col-lg-10">
	            <input type="text" class="form-control" id="dtech" name="dtech" >
	        </div>
	    </div>
     </div>  
    </div>
    <button type="submit" class="btn btn-warning">Update</button>
   
    <input class="btn btn-primary" type="reset" value="Reset">
    <a href="admindashboard.jsp" class="btn btn-secondary btn-md active" role="button" aria-pressed="true">Back</a>
    </form>
   
  
  </div>

</div>


</body>

</html>


