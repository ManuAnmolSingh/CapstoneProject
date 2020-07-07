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
	   String sql ="select * from bugreport where id='"+u+"'";
	   resultSet = stat.executeQuery(sql);
	   while(resultSet.next()){
       %>
       <input type="hidden" name="bid" value='<%=resultSet.getInt("id") %>'/>
       <div class="form-group">
          <label>Bug-Title</label>
          <input type="text" class="form-control" name="title" value='<%=resultSet.getString("bugtitle") %>'/>
       </div>
       
       <div class="form-group">
          <label>projectcode</label>
          <input type="text" class="form-control" name="pc" value='<%=resultSet.getString("projectcode") %>'/>
       </div>
       <div class="form-group">
          <label>tickettype</label>
          <input type="text" class="form-control" name="tt" value='<%=resultSet.getString("tickettype") %>'/>
       </div>
       <div class="form-group">
          <label>datetype</label>
          <input type="text" class="form-control" name="dt" value='<%=resultSet.getString("datetype") %>'/>
       </div>
       <div class="form-group">
          <label>descriptio</label>
          <input type="text" class="form-control" name="de" value='<%=resultSet.getString("descriptio") %>'/>
       </div>
       <div class="form-group">
          <label>bughours</label>
          <input type="text" class="form-control" name="bh" value='<%=resultSet.getString("bughours") %>'/>
       </div>
       <div class="form-group">
          <label>empcode</label>
          <input type="text" class="form-control" name="ec" value='<%=resultSet.getString("empcode") %>'/>
       </div>
       <div class="form-group">
          <label>ticketstatus</label>
          <input type="text" class="form-control" name="ts" value='<%=resultSet.getString("ticketstatus") %>'/>
       </div>
       <div class="form-group">
          <label>duedate</label>
          <input type="text" class="form-control" name="dd" value='<%=resultSet.getString("duedate") %>'/>
       </div>
       <%
	    }
       %>
       <button type="submit" class="btn btn-warning">Update</button>
       <a href="bugstatusreport.jsp" class="btn btn-default">Back</a>
    </form>
</body>
</html>
<% 
 String a = request.getParameter("bid");
 String b=request.getParameter("title");
 String c=request.getParameter("pc");
 String d=request.getParameter("tt");
 String e=request.getParameter("dt");
 String f=request.getParameter("de");
 String g=request.getParameter("bh");
 String h=request.getParameter("ec");
 String i=request.getParameter("ts");
 String j=request.getParameter("dd");
 if(b!=null && c!=null && d!=null && e!=null){
	 String query="update bugreport set bugtitle=?,projectcode=?, tickettype=?, datetype=?,descriptio=?,bughours=?,empcode=?,ticketstatus=?,duedate=? where id='"+a+"'";
	 stmt =connection.prepareStatement(query);

	 stmt.setString(1,b);
	 stmt.setString(2,c);
	 stmt.setString(3,d);
	 stmt.setString(4,e);
	 stmt.setString(5,f);
	 stmt.setString(6,g);
	 stmt.setString(7,h);
	 stmt.setString(8,i);
	 stmt.setString(9,j);

	 stmt.executeUpdate();
	 response.sendRedirect("bugstatusreport.jsp");
 }
%>