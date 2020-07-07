
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
<% if(session.getAttribute("name")==null)
	response.sendRedirect("TesterLogin.jsp");
	%>
<h1>Retrieve data from database in jsp</h1>
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
		     <th class="text-center">Action</th>
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
		          <a href="bugstatusedit.jsp?u=<%=resultSet.getInt("id") %>" class="btn btn-warning">Edit</a>	
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