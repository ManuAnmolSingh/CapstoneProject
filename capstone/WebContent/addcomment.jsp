<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*, java.util.*" errorPage="" %>
<%
String bugid=(String)request.getParameter("bugid");
String developer=(String)request.getParameter("developer");
String sol=(String)request.getParameter("sol");
try{
			Class.forName("com.mysql.jdbc.Driver");
		    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/udemy", "root", "manoj123");
		    					
			String insertquery = "insert into solutions values(?,?,?,?)" ;
			PreparedStatement prestmt = con.prepareStatement(insertquery);
		    
			prestmt.setString(1,bugid);
		    prestmt.setString(2,developer);
		    prestmt.setString(3,sol);
		    
		    Calendar cal = new GregorianCalendar();
		    java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
		    prestmt.setTimestamp(4,date);
		   
		    prestmt.executeUpdate();
		    prestmt.close();
			con.close();
			
			RequestDispatcher rd=request.getRequestDispatcher("bugsolution.jsp?bugid='"+bugid+"'");
			rd.forward(request, response);
			
		}catch(Exception e){System.out.println(e);
			RequestDispatcher rd=request.getRequestDispatcher("bugsolution.jsp?bugid='"+bugid+"'");
			rd.forward(request, response);
		}	
%>