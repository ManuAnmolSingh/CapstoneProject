
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
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="header.jsp" %>
<body>
<% 


if(session.getAttribute("name")==null)
	response.sendRedirect("TesterLogin.jsp");
	
	%>
<h1>Retrieve data from database in jsp</h1>
<table class="table table-bordered table-striped table-hover" border="1">
		<thead>
		   <tr>
		     <th>ProjectName</th>
		     <th>ProjectManager</th>
		     <th>ClientName</th>
		     <th>ProjectTechnology</th>
		     <th>ProjectType</th>
		     <th>Database</th>
		     <th>Description</th>
		     <th class="text-center">Action</th>
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
			<td>
		          <a href="Reportedit.jsp?u=<%=resultSet.getString("ProjectName") %>" class="btn btn-warning">Edit</a>	
			</td>
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

</body>
</html>