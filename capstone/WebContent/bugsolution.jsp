<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%

//String id = request.getParameter("userid");
String driver = "com.mysql.cj.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/udemy?useSSL=false&serverTimezone=UTC";

String userid = "root";
String password = "manoj123";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

/*@Resource(name="jdbc/web_student_tracker")
private DataSource dataSource;*/

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
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


if(session.getAttribute("name")==null)
	response.sendRedirect("DeveloperLogin.jsp");
	
	%>


<div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <a href="bugstatusreport.jsp">View status-report</a>
  <a href="Testerdasboard.jsp">Report-Bug</a>
  <a href="#">Logout</a>
  <a href="contact.jsp">Contact</a>
</div>

<div id="main">

  <div class="container-fluid"> 
	  <div class="row">
	    <div class="col-lg-4 text-center text-white-50 bg-dark">
	      <h2>E-Bug Tracking System</h2>
	      <p>Manage Project and Track bugs online</p>
	    </div>
	    <div class="col-lg-8 text-right text-white-50 bg-dark"><h4><%
	    		   
	    		      if (session != null) {
	    		         if (session.getAttribute("name") != null) {
	    		            String name = (String) session.getAttribute("name");
	    		            out.print("Welcome, " + name +"");
	    		         } 
	    		      }
	    		   %></h4>
	    </div>
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
  <h2>Bug Details related to developer</h2>
  <table class="table table-bordered table-striped table-hover" border="1">
		<thead>
		   <tr>
		     <th>bugid</th>
		     <th>bugtitle</th>
		     <th>projectcode</th>
		     <th>tickettype</th>
		     <th>datetype</th>
		     <th>descriptio</th>
		     <th>bughours</th>
		     <th>empcode</th>
		     <th>ticketstatus</th>
		     <th>duedate</th>

		   </tr>
		
		</thead>
        <tbody>
            <%
			try{
			connection = DriverManager.getConnection(connectionUrl, userid, password);
			statement=connection.createStatement();
		    String u=request.getParameter("u");
		    int num=Integer.parseInt(u);
			String sql ="select * from bugreport where id='"+u+"'";
			resultSet = statement.executeQuery(sql);
			while(resultSet.next()){
			%>
			<tr>
			<td><%=resultSet.getInt("id") %></td>
			<td><%=resultSet.getString("bugtitle") %></td>
			<td><%=resultSet.getString("projectcode") %></td>
			<td><%=resultSet.getString("tickettype") %></td>
			<td><%=resultSet.getString("datetype") %></td>
			<td><%=resultSet.getString("descriptio") %></td>
			<td><%=resultSet.getString("bughours") %></td>
			<td><%=resultSet.getString("empcode") %></td>
			<td><%=resultSet.getString("ticketstatus") %></td>
			<td><%=resultSet.getString("duedate") %></td>
			</tr>
			<%
			}
			connection.close();
			} catch (Exception e) {
			e.printStackTrace();
			}
			%>
		</tbody>
<tr><td colspan="4">Developer Comments/Solutions</td></tr>
<tr><td colspan="4">
<form name="form" method="post" action="addcomment.jsp">
<textarea cols="60" rows="4" class="inputtext" name="sol"></textarea>
<input type="hidden" name="bugid" value="<%=(String)request.getParameter("u")%>" />

<input type="hidden" name="developer" value="<%=session.getAttribute("name")%>" /><br /><br />
<div align="center"><input type="submit" value="Add Your Comment" /></div>
</form>
</td></tr>
</table>
<table class="table">
<tr><td >Audit Trail</td></tr>
<tr bgcolor=#F2F2F2><td>Developer</td><td class="smalltext">Comments</td></tr>
<%

try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/udemy", "root", "manoj123");
	Statement stmt = con.createStatement();
	String query = "select * from solutions where bugid="+(String)request.getParameter("u");
	ResultSet rs = stmt.executeQuery(query);
	while(rs.next()){
	out.print("<tr>");
	out.print("<td class=smalltext>"+rs.getString("developer")+"</td>");
	out.print("<td class=smalltext>"+rs.getString("solution")+"</td>");
	out.print("</tr>");	
	}
	rs.close();
	stmt.close();
	con.close();
}catch(Exception e){
	System.out.print(e);
}  

%>
</table>
<div align="center"><hr width="100" /><a href="Devloperdashboard.jsp">Back</a><hr width="100" /></div>

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


