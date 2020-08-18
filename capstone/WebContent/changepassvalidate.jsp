<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%
String currentPassword=request.getParameter("current");
String Newpass=request.getParameter("new");
String conpass=request.getParameter("confirm");
String connurl = "jdbc:mysql://localhost:3306/udemy";
Object n=session.getAttribute("name");
Connection con=null;
String pass="";
int id=0;
try{
Class.forName("com.mysql.jdbc.Driver");
con = DriverManager.getConnection(connurl, "root", "manoj123");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from signup where password='"+currentPassword+"' and name='"+n+"'");
while(rs.next()){
id=rs.getInt(1);
pass=rs.getString(3);
} System.out.println(id+ " "+pass);
if(pass.equals(currentPassword)){
Statement st1=con.createStatement();
int i=st1.executeUpdate("update login set password='"+Newpass+"' where id='"+id+"' and name='"+n+"'");

out.println("Password changed successfully");

st1.close();
con.close();
response.sendRedirect("changepassword.jsp?msg=updated");
}
else{
response.sendRedirect("changepassword.jsp?msg=");

}
}
catch(Exception e){
out.println(e);
}
%>