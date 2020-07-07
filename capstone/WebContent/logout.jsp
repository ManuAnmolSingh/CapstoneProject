<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%
String type=request.getParameter("type");
session.invalidate();

if(type.equals("Manager")){
RequestDispatcher rd=request.getRequestDispatcher("Loginpage.jsp?type=Manager");
rd.forward(request, response);
}else{
	RequestDispatcher rd=request.getRequestDispatcher("Loginpage.jsp?type=Admin");
	rd.forward(request, response);
}


%>
