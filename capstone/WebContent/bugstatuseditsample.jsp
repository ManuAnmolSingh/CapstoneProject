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
<head>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style>
       body {
    margin: 0;
    padding-left: 10%;
    padding-right: 10%;
    font-family: sans-serif;
    background: linear-gradient(to right, #b92b27, #1565c0)
}

.box {
    width: 1000px;
    padding: 20px;
    position: center;
    top: 50%;
    background: #191919;
    border-radius:30px;
    
    text-align: center;
    transition: 0.25s;
    margin-top: 50px;
    margin-bottom: 50px;
    
}

.box input[type="text"]{
    border: 0;
    background: none;
    display: block;
    margin: 20px auto;
    text-align: center;
    border: 2px solid #3498db;
    padding: 10px 10px;
    width: 450px;
    outline: none;
    color: white;
    border-radius: 24px;
    transition: 0.45s
}

.box h1 {
    color: white;
    text-transform: uppercase;
    font-weight: 500
}

.box input[type="text"]:focus,
.box input[type="password"]:focus {
    width: 600px;
    border-color: #2ecc71
}

.box input[type="submit"] {
    border: 0;
    background: none;
    display: block;
    margin: 20px auto;
    text-align: center;
    border: 2px solid #2ecc71;
    padding: 14px 40px;
    outline: none;
    color: white;
    border-radius: 24px;
    transition: 0.25s;
    cursor: pointer
}

.box input[type="submit"]:hover {
    background: #2ecc71
}

.forgot {
    text-decoration: underline
}
</style>
</head>
<body>
<%String type=request.getParameter("type"); %>
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
<div class="container">
    <div class="row">
        <div class="col-md-6">
            <div class="card">  
 
    <form class="box" action="" method="post">
       <%
       stat=connection.createStatement();
       String u=request.getParameter("u");
       int num=Integer.parseInt(u);
	   String sql ="select * from bugreport where id='"+u+"'";
	   resultSet = stat.executeQuery(sql);
	   while(resultSet.next()){
       %>
       
       <input type="hidden" name="bid" value='<%=resultSet.getInt("id") %>'/>

                
                    <h1>Edit</h1>
                    <p class="text-muted"> Please update information here!</p>
				          <label>Bug-Title</label>
				          <input type="text" class="form-control" name="title" value='<%=resultSet.getString("bugtitle") %>'/>
				       
				       
				       
				          <label>projectcode</label>
				          <input type="text" class="form-control" name="pc" value='<%=resultSet.getString("projectcode") %>'/>
				       
				       
				          <label>tickettype</label>
				          <input type="text" class="form-control" name="tt" value='<%=resultSet.getString("tickettype") %>'/>
				       
				       
				          <label>datetype</label>
				          <input type="text" class="form-control" name="dt" value='<%=resultSet.getString("datetype") %>'/>
				       
				       
				          <label>description</label>
				          <input type="text" class="form-control" name="de" value='<%=resultSet.getString("descriptio") %>'/>
				       
				       
				          <label>bughours</label>
				          <input type="text" class="form-control" name="bh" value='<%=resultSet.getString("bughours") %>'/>
				       
				       
				          <label>empcode</label>
				          <input type="text" class="form-control" name="ec" value='<%=resultSet.getString("empcode") %>'/>
				       
				       
				          <label>ticketstatus</label>
				          <input type="text" class="form-control" name="ts" value='<%=resultSet.getString("ticketstatus") %>'/>
				       
				       
				          <label>duedate</label>
				          <input type="text" class="form-control" name="dd" value='<%=resultSet.getString("duedate") %>'/>

 
       
       <%
	    }
       %>
       <button type="submit" class="btn btn-warning" onclick="return but()">Update</button>

       <a href="bugstatusreportsample.jsp?type=Tester" class="btn btn-default">Back</a>
               </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
<% 
 String te="Tester";
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
	 
	 response.sendRedirect("bugstatusreportsample.jsp?msg=Updated&&type=Tester");
 }

	 

%>