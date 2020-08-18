package capstone;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.annotation.Resource;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.sql.DataSource;

@WebServlet("/signup")
public class signup extends HttpServlet {
	@Resource(name="jdbc/web_student_tracker")
	private DataSource dataSource;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/plain");
		Connection myConn = null;
		Statement myStmt = null;
		ResultSet myRs = null;

        String type=request.getParameter("type");
		
		String id=(String)request.getParameter("id");
		String name=(String)request.getParameter("name");
		String number=(String)request.getParameter("number");
		String email=(String)request.getParameter("email");
		String password=(String)request.getParameter("password");
		String repassword=(String)request.getParameter("password_confirmation");
		String address=(String)request.getParameter("address");
		String city=(String)request.getParameter("city");
		String state=(String)request.getParameter("state");
		String country=(String)request.getParameter("country");
		String zip=(String)request.getParameter("Zipcode");
		String emprole=(String)request.getParameter("emprole");
		String empmagcode=(String)request.getParameter("empmagcode");
		
		if("".equals(name)||"".equals(password)){
			/*if("Tester".equals(type)){
			RequestDispatcher rd=request.getRequestDispatcher("signup.jsp?msg=blank");
			rd.forward(request, response);
			}else{
				RequestDispatcher rd=request.getRequestDispatcher("adddeveloper.jsp?msg=blank");
				rd.forward(request, response);
			}*/
			out.println("type something!");
				
		}else{			
			try{
				//Class.forName("com.mysql.jdbc.Driver");
                myConn = dataSource.getConnection();
    			
    			// Step 3:  Create a SQL statements
    			//String sql = "select * from login2";
                String insertquery = "insert into udemy.signup values(?,?,?,?,?,?,?,?,?,?,?,?,?)" ;
                PreparedStatement stmt = myConn.prepareStatement(insertquery);
    			//myStmt = myConn.createStatement();
    			
    			// Step 4:  Execute SQL query
    			//myRs = myStmt.executeQuery
			    //Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/finalproject", "root", "12345qwert");

			    
			    stmt.setString(1,id);
			    stmt.setString(2,name);
			    stmt.setString(3,password);
			    stmt.setString(4,repassword);
			    stmt.setString(5,address);
			    stmt.setString(6,city);
			    stmt.setString(7,state);
			    stmt.setString(8,country);
			    stmt.setString(9,email);
			    stmt.setString(10,number);
			    stmt.setString(11,emprole);
			    stmt.setString(12,empmagcode);	    
			    stmt.setString(13, zip);
				stmt.executeUpdate();
			    
				


			    response.sendRedirect("register.jsp?msg=Updated&&type=Manager");

				
				stmt.close();
				myConn.close();
			}
			catch(Exception e){

				e.printStackTrace();
				if(type == "Admin"){
					response.sendRedirect("register.jsp?msg=erroe&&type=Admin");
			    }else if(type == "Manager"){
			    	response.sendRedirect("register.jsp?msg=error&&type=Manager");
			    }else {
			    	response.sendRedirect("register.jsp?msg=error");
			    }
				
			}
		}
		
	}

}
