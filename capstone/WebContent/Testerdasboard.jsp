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
  <script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/momentjs/2.14.1/moment.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/css/bootstrap-datetimepicker.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script>

	    $(function () {
	        $('#datetimepicker1').datetimepicker();
	        $('#datetimepicker2').datetimepicker({
	            useCurrent: false //Important! See issue #1075
	        });
	        $("#datetimepicker1").on("dp.change", function (e) {
	            $('#datetimepicker2').data("DateTimePicker").minDate(e.date);
	        });
	        $("#datetimepicker2").on("dp.change", function (e) {
	            $('#datetimepicker1').data("DateTimePicker").maxDate(e.date);
	        });
	    });
  </script>
  <style>

  body {
  font-family: "Lato", sans-serif;
}

.sidenav {
  height: 100%;
  width: 0;
  position: fixed;
  z-index: 1;
  top: 0;
  left: 0;
  background-color: #111;
  overflow-x: hidden;
  transition: 0.5s;
  padding-top: 60px;
}

.sidenav a {
  padding: 16px 16px 16px 32px;
  text-decoration: none;
  font-size: 25px;
  color: #818181;
  display: block;
  transition: 0.3s;
}

.sidenav a:hover {
  color: #f1f1f1;
}

.sidenav .closebtn {
  position: absolute;
  top:-10px;
  right: 0;
  font-size: 36px;
  margin-left: 50px;
}

#main {
  transition: margin-left .5s;
  padding: 0px;

}

@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}
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
    .row.content {height: 850px}
    
    /* Set gray background color and 100% height */
    .sidenav {
      padding-top: 20px;
      background-color: black;
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
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");

if(session.getAttribute("name")==null)
	response.sendRedirect("TesterLogin.jsp");
	
	%>


<div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <a href="bugstatusreport.jsp">View status-report</a>
  <a href="Testerdasboard.jsp">Report-Bug</a>
  <a href="out">Logout</a>
  <a href="contact.jsp">Contact</a>
</div>

<div id="main">

  <div class="container-fluid"> 
	  <div class="row">
	    <div class="col-lg-4 text-center text-white-50 bg-dark">
	      <h2>E-Bug Tracking System</h2>
	      <p>Manage Project and Track bugs online</p>
	    </div>
	    <div class="col-lg-8 text-right text-white-50 bg-dark"><h4><%if (session != null) {
	    		         if (session.getAttribute("name") != null) {
	    		            String name = (String) session.getAttribute("name");
	    		            out.print("Welcome tester, " + name +"");
	    		         } 
	    		      }%> | Logout</h4></div>
	  </div>
  </div>
  <div class="w3-bar w3-black">
    <a href="dummy.jsp" class="w3-bar-item w3-button w3-desktop w3-white">Home</a>
    <a href="Reportviewstatus.jsp" class="w3-bar-item w3-button w3-desktop">View Projects</a>
    <a href="contact.jsp" class="w3-bar-item w3-button w3-desktop">Contact</a>
    
    <div class="w3-dropdown-hover w3-desktop">
      <button class="w3-button">Dropdown <i class="fa fa-caret-down"></i></button>
      <div class="w3-dropdown-content w3-bar-block w3-dark-grey">
        <a href="#" class="w3-bar-item w3-button w3-desktop">Link 1</a>
        <a href="#" class="w3-bar-item w3-button w3-desktop">Link 2</a>
        <a href="#" class="w3-bar-item w3-button w3-desktop">Link 3</a>
      </div>
    </div>
    
  </div>
  <span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776;</span>
  <div class="container-fluid text-center">    
  <div class="row centered-form">
  
    <form class="txt-center" id="form" name="form" method="get" action="bugform">
     <div class="col-lg-12 text-left">
      <h3>Bug-Report Form</h3>
      <div class="col-lg-6">
        <div class="form-group">
	        <label for="inputEmail3" class="col-lg-4 control-label">Bugid</label>
	        <div class="col-lg-10">
	            <input type="text" class="form-control" id="bid" name="bugid">
	        </div>
	    </div>
	    <div class="form-group">
	        <label for="inputEmail3" class="col-lg-4 control-label">Bug Title</label>
	        <div class="col-lg-10">
	            <input type="text" class="form-control" id="btitle" name="bugtitle">
	        </div>
	    </div>
	    <div class="form-group">
	        <label for="inputPassword3" class="col-lg-4 control-label">Project Code</label>
	        <div class="col-lg-10">
	            <input type="text" class="form-control" id="pcode" name="projectcode">
	        </div>
	    </div>
	    <div class="form-group">
	        <label for="inputPassword3" class="col-lg-4 control-label">Ticket Type</label>
	        <div class="col-lg-10">
	              <select class="form-control" id="ttype" name="tickettype">
	                <option></option>
				    <option>front-end</option>
				    <option>back-end</option>
				    <option>Middleware</option>
				  </select>
	        </div>
	    </div>
        <div class="form-group">
                  <label class="col-lg-4 control-label">Start Date</label>
                  <div class='col-lg-10 input-group date' id='datetimepicker1'>
                     <input type='text' class="form-control" name="datetype"/>
                     <span class="input-group-addon">
                     <span class="glyphicon glyphicon-calendar"></span>
                     </span>
                  </div>
        </div>
	    
		<div class="form-group">
		  <label for="comment" class="col-lg-2 control-label">Description</label>
		  <div class="col-lg-10">
		  <textarea class="form-control" rows="5" id="descriptio" name="descriptio"></textarea>
		  </div>
		</div>
		
	  </div>
	  <div class="col-lg-6">
	    <div class="form-group">
	        <label for="inputPassword3" class="col-lg-4 control-label">Bug Hours</label>
	        <div class="col-lg-10">
	            <input type="text" class="form-control" id="bhours" name="bughours">
	        </div>
	    </div>
	    <div class="form-group">
	        <label for="inputEmail3" class="col-lg-4 control-label">Employee Code</label>
	        <div class="col-lg-10">
			  <select class="form-control" id="ecode" name="empcode">
			    <option></option>
			    <option>Trump</option>
			    <option>Modi</option>
			    <option>Putin</option>
			    <option>Boris Johnson</option>
			  </select>
	        </div>
	    </div>
	    <div class="form-group">
	        <label for="inputEmail3" class="col-lg-4 control-label">Ticket Status</label>
	        <div class="col-lg-10">
			  <select class="form-control" id="tstatus" name="ticketstatus">
			    <option></option>
			    <option>opened</option>
			    <option>on hold</option>
			    <option>closed</option>
			  </select>
	        </div>
	    </div>
	    <div class="form-group">
                  <label class="col-lg-4 control-label">Due Date</label>
                  <div class='col-lg-10 input-group date' id='datetimepicker2'>
                     <input type='text' class="form-control" name="duedate"/>
                     <span class="input-group-addon">
                     <span class="glyphicon glyphicon-calendar"></span>
                     </span>
                  </div>
        </div>


     </div>  
    </div>
    <button type="submit" class="btn btn-warning">Update</button>
   
    <input class="btn btn-primary" type="reset" value="Reset"><br>
    <%
	if("added".equals((String)request.getParameter("msg")))
	out.print("<div align=center class=errortext>Tester added</div>");
	%>
    </form>
  </div>
  </div>
  
</div>

<script>
function openNav() {
  document.getElementById("mySidenav").style.width = "250px";
  document.getElementById("main").style.marginLeft = "250px";
}

function closeNav() {
  document.getElementById("mySidenav").style.width = "0";
  document.getElementById("main").style.marginLeft= "0";
}
</script>
   
 

</body>

</html>


