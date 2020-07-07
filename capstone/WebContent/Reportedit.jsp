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
       //int num=Integer.parseInt(u);
	   String sql ="select * from projects where ProjectName='"+u+"'";
	   resultSet = stat.executeQuery(sql);
	   while(resultSet.next()){
       %>
       <input type="hidden" name="id" value='<%=resultSet.getString("ProjectName") %>'/>
       <div class="form-group">
          <label>ProjectManager</label>
          <input type="text" class="form-control" name="pm" value='<%=resultSet.getString("ProjectManager") %>'/>
       </div>
       <div class="form-group">
          <label>ClientName</label>
          <input type="text" class="form-control" name="cn" value='<%=resultSet.getString("ClientName") %>'/>
       </div>
       <div class="form-group">
          <label>ProjectTechnology</label>
          <input type="text" class="form-control" name="pt" value='<%=resultSet.getString("ProjectTechnology") %>'/>
       </div>
       <div class="form-group">
          <label>ProjectType</label>
          <input type="text" class="form-control" name="ptype" value='<%=resultSet.getString("ProjectType") %>'/>
       </div>
       <div class="form-group">
          <label>Database</label>
          <input type="text" class="form-control" name="db" value='<%=resultSet.getString("DatabaseTech") %>'/>
       </div>
       <div class="form-group">
          <label>Description</label>
          <input type="text" class="form-control" name="desc" value='<%=resultSet.getString("comments") %>'/>
       </div>
       <%
	    }
       %>
       <button type="submit" class="btn btn-warning">Update</button>
       <a href="Reportviewstatus.jsp" class="btn btn-default">Back</a>
    </form>
</body>
</html>
<% 
 String a=request.getParameter("id");
 String b=request.getParameter("pm");
 String c=request.getParameter("cn");
 String d=request.getParameter("pt");
 String e=request.getParameter("ptype");
 String f=request.getParameter("db");
 String g=request.getParameter("desc");
 if(a!=null && b!=null && c!=null && d!=null && e!=null && f!=null && g!=null){
	 String query="update projects set ProjectManager=?, ClientName=?, ProjectTechnology=?, ProjectType=?, DatabaseTech=?, comments=?  where ProjectName='"+a+"'";
	 stmt =connection.prepareStatement(query);
	 stmt.setString(1,b);
	 stmt.setString(2,c);
	 stmt.setString(3,d);
	 stmt.setString(4,e);
	 stmt.setString(5,f);
	 stmt.setString(6,g);
	 stmt.executeUpdate();
	 response.sendRedirect("Reportviewstatus.jsp");
 }
%>