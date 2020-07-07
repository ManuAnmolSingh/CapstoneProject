<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="header.jsp" %>
<body>
    <%
    String driver = "com.mysql.cj.jdbc.Driver";
    String connectionUrl = "jdbc:mysql://localhost:3306/udemy?useSSL=false&serverTimezone=UTC";

    String userid = "root";
    String password = "manoj123";
    PreparedStatement stmt=null;
	Connection connection = null;
	Statement stat = null;
	ResultSet resultSet = null;
	connection = DriverManager.getConnection(connectionUrl, userid, password);
	
    %>
    <form action="" method="post">
       <%
       stat=connection.createStatement();
       String u=request.getParameter("u");
       int num=Integer.parseInt(u);
	   String sql ="select * from login where id='"+num+"'";
	   resultSet = stat.executeQuery(sql);
	   while(resultSet.next()){
       %>
       <input type="hidden" name="id" value='<%=resultSet.getString("id") %>'/>
       <div class="form-group">
          <label>password</label>
          <input type="text" class="form-control" name="ps" value='<%=resultSet.getString("password") %>'/>
       </div>
       <div class="form-group">
          <label>name</label>
          <input type="text" class="form-control" name="nm" value='<%=resultSet.getString("name") %>'/>
       </div>
       <div class="form-group">
          <label>Email</label>
          <input type="text" class="form-control" name="em" value='<%=resultSet.getString("email") %>'/>
       </div>
       <div class="form-group">
          <label>username</label>
          <input type="text" class="form-control" name="us" value='<%=resultSet.getString("username") %>'/>
       </div>
       <%
	    }
       %>
       <button type="submit" class="btn btn-warning">Update</button>
       <a href="table.jsp" class="btn btn-default">Back</a>
    </form>
</body>
</html>
<% 
 String a=request.getParameter("id");
 String b=request.getParameter("ps");
 String c=request.getParameter("nm");
 String d=request.getParameter("em");
 String e=request.getParameter("us");
 if(a!=null && b!=null && c!=null && d!=null && e!=null){
	 String query="update login set password=?, name=?, email=?, username=? where id='"+a+"'";
	 stmt =connection.prepareStatement(query);
	 stmt.setString(1,b);
	 stmt.setString(2,c);
	 stmt.setString(3,d);
	 stmt.setString(4,e);
	 stmt.executeUpdate();
	 response.sendRedirect("table.jsp");
 }
%>