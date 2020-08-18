
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
	  width: 100%;
	  margin: 0 auto;
  display: table;
  padding: 0 1em 8em 1em;
}

.container td {
	  padding-bottom: 2%;
	  padding-top: 2%;
  padding-left:1.5%;  
}
.container th {
 padding-bottom: 1%;
	  padding-top: 2%;
  padding-left:1%;
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
</style>
</head>
<body>
<%String type=request.getParameter("type"); %>
<% if(session.getAttribute("name")==null)
	response.sendRedirect("Loginpage.jsp");
	%>

<h1> <span class="yellow">Project-Report</pan></h1>
<h2>Table</h2>
<h1>Retrieve data from database in jsp</h1>
<table class="container">
		<thead>
		   <tr>
		     <th><h1>ProjectName</h1></th>
		     <th><h1>ProjectManager</h1></th>
		     <th><h1>ClientName</h1></th>
		     <th><h1>ProjectTechnology</h1></th>
		     <th><h1>ProjectType</h1></th>
		     <th><h1>Database</h1></th>
		     <th><h1>Description</h1></th>
		     
		   </tr>
		
		</thead>
        <tbody>
            <%
			try{
			connection = DriverManager.getConnection(connectionUrl, userid, password);
			statement=connection.createStatement();
			String sql ="select * from projects";
			resultSet = statement.executeQuery(sql);
			while(resultSet.next()){
			%>
			<tr>
			<td><%=resultSet.getString("ProjectName") %></td>
			<td><%=resultSet.getString("ProjectManager") %></td>
			<td><%=resultSet.getString("ClientName") %></td>
			<td><%=resultSet.getString("ProjectTechnology") %></td>
			<td><%=resultSet.getString("ProjectType") %></td>
			<td><%=resultSet.getString("DatabaseTech") %></td>
			<td><%=resultSet.getString("comments") %></td>

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
<br>

<br>
<div class="back" align="center"><input type="button" class="btn btn-secondary" value="Take me back" onclick="return but()"></div>

<SCRIPT type="text/javascript">

function but(){
	    n=2;
	    if("<%=type%>" === "Admin"){
	    	window.location.href="http://localhost:8080/capstone/admindashboard.jsp";
	    }else if("<%=type%>" === "Manager"){
	    	window.location.href="http://localhost:8080/capstone/managerdashboard.jsp";
	    }else if("<%=type%>" === "Tester"){
	    	window.location.href="http://localhost:8080/capstone/Testerdasboard.jsp";
	    }else if("<%=type%>" === "Developer"){
	    	window.location.href="http://localhost:8080/capstone/Devloperdashboard.jsp";
	    }else{
	    	window.location.href="http://localhost:8080/capstone/dummy.jsp";
	    }
	
}
</SCRIPT>
</body>
</html>