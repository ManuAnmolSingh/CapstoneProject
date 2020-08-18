<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%> 
<%
String email=(String)request.getParameter("param1");
out.println(email+" Added Succesfully");
Connection connection=null; 
try { 
 Class.forName("com.mysql.jdbc.Driver"); 
 connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/udemy","root", "manoj123");
 String t="kbjkb";
 String query="update login2 set name='"+email+"' where password='"+t+"'";
 Statement st=connection.createStatement();
 st.executeUpdate(query);
} catch (ClassNotFoundException e) {
 e.printStackTrace();
} catch (SQLException e) {
 e.printStackTrace();
}
%>