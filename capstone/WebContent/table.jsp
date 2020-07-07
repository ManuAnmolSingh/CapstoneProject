
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

<h1>Retrieve data from database in jsp</h1>
<table class="table table-bordered table-striped table-hover" border="1">
		<thead>
		   <tr>
		     <th>id</th>
		     <th>password</th>
		     <th>name</th>
		     <th>email</th>
		     <th>username</th>
		     <th class="text-center">Action</th>
		   </tr>
		
		</thead>
        <tbody>
            <%
			try{
			connection = DriverManager.getConnection(connectionUrl, userid, password);
			statement=connection.createStatement();
			String sql ="select * from login";
			resultSet = statement.executeQuery(sql);
			while(resultSet.next()){
			%>
			<tr>
			<td><%=resultSet.getString("id") %></td>
			<td><%=resultSet.getString("password") %></td>
			<td><%=resultSet.getString("name") %></td>
			<td><%=resultSet.getString("email") %></td>
			<td><%=resultSet.getString("username") %></td>
			<td>
		          <a href="edit.jsp?u=<%=resultSet.getString("id") %>" class="btn btn-warning">Edit</a>	
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