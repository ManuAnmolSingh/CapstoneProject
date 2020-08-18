<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <title>Menu</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
  <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
  <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<style>
p{
color: white;
}
footer {
      background-color: #555;
      color: white;
      padding: 15px;
    }
h4
{
    border-bottom:1px solid #525252 ;
    padding-bottom:3px;
}
body{
    background-color: black;
}
.centered-form{
	margin-top: 60px;
}

.centered-form .panel{
	background: rgba(255, 255, 255, 0.8);
	box-shadow: rgba(0, 0, 0, 0.3) 20px 20px 20px;
}
</style>
</head>
<body>

<!------ Include the above in your HEAD tag ---------->
<div class="text-center">

       <%
Class.forName("com.mysql.jdbc.Driver");
Connection on=DriverManager.getConnection("jdbc:mysql://localhost:3306/udemy","root","manoj123");
Statement sit=on.createStatement();
String sQuery = "SELECT * FROM udemy.signup order by id desc limit 1;";
ResultSet ruk = sit.executeQuery(sQuery);
int Coow=100;
while(ruk.next()){
Coow= ruk.getInt(1);
}

%>
<%String type=request.getParameter("type"); %>
</div>
<div class="container-fluid	">
        <div class="row centered-form">
        <div class="col-xs-12 col-sm-8 col-sm-offset-2 ">
        	<div class="panel panel-default">
        		<div class="panel-heading">
			    		<h3 class="panel-title">Signup here <small>as <%=(String)request.getParameter("type")%></small></h3>
			    		
			 			</div>
			 			<div class="panel-body">
			    		<form class="txt-center" id="form" name="form" method="get" action="signup">
			    			<div class="row">
			    				<div class="col-xs-6 col-sm-6 col-md-6">
			    					<div class="form-group">
			                            <input type="number" name="id" id="id" class="form-control input-sm" readonly="readonly" value="<%=(Coow+1) %>" placeholder="ID" >
			    					</div>
			    				</div>
			    				<div class="col-xs-6 col-sm-6 col-md-6">
			    					<div class="form-group">
			                            <input type="text" name="name" id="first_name" class="form-control input-sm" placeholder="Name">
			    					</div>
			    				</div>
			    				<div class="col-xs-6 col-sm-6 col-md-6">
			    					<div class="form-group">
			    						<input type="text" name="number" id="number " class="form-control input-sm" placeholder="PH Number">
			    					</div>
			    				</div>
			    			</div>

			    			<div class="form-group">
			    				<input type="email" name="email" id="email" class="form-control input-sm" placeholder="Email Address">
			    			</div>

			    			<div class="row">
			    				<div class="col-xs-6 col-sm-6 col-md-6">
			    					<div class="form-group">
			    						<input type="password" name="password" id="password" class="form-control input-sm" placeholder="Password">
			    					</div>
			    				</div>
			    				<div class="col-xs-6 col-sm-6 col-md-6">
			    					<div class="form-group">
			    						<input type="password" name="password_confirmation" id="password_confirmation" class="form-control input-sm" placeholder="Confirm Password">
			    					</div>
			    				</div>
			    			</div>
			    			<h4>Employee Contact Details</h4>
			    			<div class="form-group">
			    				<input type="address" name="address" id="address" class="form-control input-sm" placeholder="Address">
			    			</div>
			    			<div class="row">
			    				<div class="col-xs-6 col-sm-6 col-md-6">
			    					<div class="form-group">
			    						<input type="city" name="city" id="city" class="form-control input-sm" placeholder="City">
			    					</div>
			    				</div>
			    				<div class="col-xs-6 col-sm-6 col-md-6">
			    					<div class="form-group">
			    						<input type="state" name="state" id="state" class="form-control input-sm" placeholder="State">
			    					</div>
			    				</div>
			    				<div class="col-xs-6 col-sm-6 col-md-6">
			    					<div class="form-group">
			    						<input type="country" name="country" id="country" class="form-control input-sm" placeholder="Country">
			    					</div>
			    				</div>
			    				<div class="col-xs-6 col-sm-6 col-md-6">
			    					<div class="form-group">
			    						<input type="Zipcode" name="Zipcode" id="Zipcode" class="form-control input-sm" placeholder="Zipcode">
			    					</div>
			    				</div>
			    				<div class="col-xs-6 col-sm-6 col-md-6">
			    					<div class="form-group">
			    						<input  name="emprole" id="emprole" class="form-control input-sm" placeholder="emprole">
			    					</div>
			    				</div>
			    				<div class="col-xs-6 col-sm-6 col-md-6">
			    					<div class="form-group">
			    						<input  name="empmagcode" id="empmagcode" class="form-control input-sm" placeholder="empmagcode">
			    					</div>
			    				</div>
			    				
			    			</div>
			    			<input type="hidden" name="type" value="<%=(String)request.getParameter("type")%>" />
			    			<input type="submit" value="Register" class="btn btn-info btn-block">
			    		
			    		</form>
			    	</div>
	    		</div>
    		</div>
    	</div>
    </div> 
 <div class ="row">
 <br>
 <br>
 <br>
<br></br>
    <%
	if("Updated".equals((String)request.getParameter("msg")))
	out.print("<div align=center class=errortext>Updated Successfully</div>");
	else if("error".equals((String)request.getParameter("msg")))
	out.println("<div class=errortext>Login Already exists.</div>");
	%>


 <footer class="container-fluid text-center">
  <div class="back" align="center"><input type="button" class="btn btn-secondary" value="Take me back" onclick="return but()"></div>
</footer>
<SCRIPT type="text/javascript">

function but(){
	    n=2;
	    if("<%=type%>" === "Admin"){
	    	window.location.href="http://localhost:8080/capstone/admindashboard.jsp";
	    }else if("<%=type%>" === "Manager"){
	    	window.location.href="http://localhost:8080/capstone/managerdashboard.jsp";
	    }else{
	    	window.location.href="http://localhost:8080/capstone/dummy.jsp";
	    }
		
	
		
	
	
}
</SCRIPT>
</body>   
</html>
