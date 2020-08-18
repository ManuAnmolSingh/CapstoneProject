
<?xml version="1.0" encoding="ISO-8859-1" ?>
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

<html>

<head>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
  <script src="jquery-3.5.1.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   <script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<style>


@charset "UTF-8";
@import url(https://fonts.googleapis.com/css?family=Open+Sans:300,400,700);


body {
  font-family: 'Open Sans', sans-serif;
  font-weight: 300;
  line-height: 1.68em;
  color:#A7A1AE;
  background-color:#1F2739;
}

h1 {
  font-size:1em; 
  font-weight: 300;
  line-height:1em;
  text-align: center;
  color: #4DC3FA;
}

h2 {
  font-size:1em; 
  font-weight: 300;
  text-align: center;
  display: block;
  line-height:1em;
  padding-bottom: 2em;
  color: #FB667A;
}

.back{
padding-top: 2em;
padding-bottom: 2em;
color:black;
}


.yellow { color: #FFF842; }

.container th h1 {
      
	  font-weight: bold;
	  font-size: 1em;
  text-align: left;
  color: #185875;
}

.container td {
      
	  font-weight: normal;
	  font-size: 0.80em;
  -webkit-box-shadow: 0 2px 2px -2px #0E1119;
	   -moz-box-shadow: 0 2px 2px -2px #0E1119;
	        box-shadow: 0 2px 2px -2px #0E1119;
}

.container {

	  text-align: left;
	  overflow: hidden;
	  width:100%;
	  margin: 0 auto;
  display: table;
  padding: 0 1em 8em 1em;
  table-layout: fixed;
  
}


.container td {
	  padding-bottom: 2%;
	  padding-top: 2%;
  padding-left:1.5%;  
 table-layout: fixed;

}
.container th {
 padding-bottom: 1%;
	  padding-top: 2%;
  padding-left:1.5%;
}

/* Background-color of the odd rows */
.container tr:nth-child(odd) {
	  background-color: #323C50;
}

/* Background-color of the even rows */
.container tr:nth-child(even) {
	  background-color: #2C3446;
}

.container th {
	  background-color: #1F2739;
}

.container td:first-child { color: #FB667A; }

.container tr:hover {
   background-color: #464A52;
-webkit-box-shadow: 0 6px 6px -6px #0E1119;
	   -moz-box-shadow: 0 6px 6px -6px #0E1119;
	        box-shadow: 0 6px 6px -6px #0E1119;
}

.container td:hover {
  background-color: #FFF842;
  color: #403E10;
  font-weight: bold;
  
  box-shadow: #7F7C21 -1px 1px, #7F7C21 -2px 2px, #7F7C21 -3px 3px, #7F7C21 -4px 4px, #7F7C21 -5px 5px, #7F7C21 -6px 6px;
  transform: translate3d(6px, -6px, 0);
  
  transition-delay: 0s;
	  transition-duration: 0.4s;
	  transition-property: all;
  transition-timing-function: line;
}

@media (max-width: 800px) {
.container td:nth-child(4),
.container th:nth-child(4) { display: none; }
} 
#exampleModalLong,.modal-footer,.modal-body{
background-color: black;
color: white;
}
.modal-header{
background-color: black;
}
.table{
  border-radius: 20px !important;

}
</style>
</head>
<body>
<%String type=request.getParameter("type"); %>
<% if(session.getAttribute("name")==null)
	response.sendRedirect("TesterLogin.jsp");
	%>
<br>

<h1> <span class="yellow">BugStatus-Report</pan></h1>
<h2>Table!</h2>
<br>
<br>
<table class="container">

		<thead class="thead-dark">
		   <tr>
		     <th><h1>Bugid</h1></th>
		     <th><h1>Bugtitle</h1></th>
		     <th><h1>Projectcode</h1></th>
		     <th><h1>Tickettype</h1></th>
		     <th><h1>Datetype</h1></th>
		     <th><h1>Description</h1></th>
		     <th><h1>Bughours</h1></th>
		     <th><h1>Empcode</h1></th>
		     <th><h1>Ticketstatus</h1></th>
		     <th><h1>Duedate</h1></th>
		     <th class="text-center"><h1>Action</h1></th>
		     <th><h1>popup</h1></th>
		   </tr>
		
		</thead>
        <tbody>
            <%
			try{
			connection = DriverManager.getConnection(connectionUrl, userid, password);
			statement=connection.createStatement();
			String sql ="select * from bugreport";
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
				
				<td>

			    <a href="bugstatuseditsample.jsp?u=<%=resultSet.getInt("id")%>&type=Tester" class="btn btn-warning">Edit</a>	
				</td>
				<td><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalLong">Solution
</button></td>
			</tr>
			
			<%
			}
			connection.close();
			} catch (Exception e) {
			e.printStackTrace();
			}
			%>
		</tbody>

</table>
<div class="modal fade" id="exampleModalLong" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="text-primary">Solutions/Comments data</h5>
      </div>
      <div class="modal-body">
        <table class="table table-hover table-dark">

		<thead>
		   <tr>
		     <th scope="col">Bugid</th>
		     <th scope="col">Developer</th>
		     <th scope="col">Solution</th>
		     <th scope="col">Date</th>
		   </tr>
		
		</thead>
        <tbody>
            <%
			try{
			connection = DriverManager.getConnection(connectionUrl, userid, password);
			statement=connection.createStatement();
			//@resultSet.getInt("bugid");
			String sql ="select * from solutions";
			resultSet = statement.executeQuery(sql);
			while(resultSet.next()){
			%>
			<tr>
				<td><%=resultSet.getInt("bugid") %></td>
				<td><%=resultSet.getString("developer") %></td>
				<td><%=resultSet.getString("solution") %></td>
				<td><%=resultSet.getString("date") %></td>
			</tr>
			
			<%
			}
			connection.close();
			} catch (Exception e) {
			e.printStackTrace();
			}
			%>
		</tbody>

</table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>

      </div>
    </div>
  </div>
</div>
    <%
	if("Updated".equals((String)request.getParameter("msg")))
	out.print("<div align=center class=errortext>Updated Successfully</div>");
    
	%>






<br>
<br>

<div class="back" align="center"><input type="button" class="btn btn-secondary" 
value="Take me back" onclick="return but()"></div>

<SCRIPT type="text/javascript">

function but(){
	    n=2;
	    if("<%=type%>" === "Developer"){
	    	window.location.href="http://localhost:8080/capstone/Devloperdashboard.jsp";
	    }else if("<%=type%>" === "Tester"){
	    	window.location.href="http://localhost:8080/capstone/Testerdasboard.jsp";
	    	
	    }else if("<%=type%>" === "Manager"){
	    	window.location.href="http://localhost:8080/capstone/managerdashboard.jsp";
	    }else{
	    	window.location.href="http://localhost:8080/capstone/dummy.jsp";
	    }
		
	
		
	
	
}
</SCRIPT>	

</body>
</html>