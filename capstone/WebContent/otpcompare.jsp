<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%

String email=(String)session.getAttribute("email");

int otp= (Integer) session.getAttribute("otp");
String otpvalue=request.getParameter("otpvalue");
int enterOtp=Integer.parseInt(otpvalue);
if(otp==enterOtp)
{
response.sendRedirect("changepassword.jsp");
}
else
{
out.println("OTP not matched");
}
%>