package capstone;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

/**
 * Servlet implementation class Manlogin
 */
@WebServlet("/Manlogin")
public class Manlogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Resource(name="jdbc/web_student_tracker")
	private DataSource dataSource;
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		response.setContentType("text/plain");
		
		// Step 2:  Get a connection to the database
		Connection myConn = null;
		Statement myStmt = null;
		ResultSet myRs = null;
		String name = request.getParameter("UserName");
        String pass = request.getParameter("Password");
        String type=request.getParameter("type");
        //boolean flag=false;
        if(type.equals("Manager")) {
        	try {
    			myConn = dataSource.getConnection();
    			
    			// Step 3:  Create a SQL statements
    			//String sql = "select * from login2";
    			myStmt = myConn.createStatement();
    			
    			// Step 4:  Execute SQL query
    			myRs = myStmt.executeQuery("select * from login2 where name='"+name+"' and password='"+pass+"'");
    			  
    		      
    		      if(myRs.next()) {
    		    	HttpSession session = request.getSession();
    			    session.setAttribute("name", name);
    		        response.sendRedirect("managerdashboard.jsp");
    		        
    		       
    		        
    		        
    		      }else {
    		    	
    		    	RequestDispatcher rd=request.getRequestDispatcher("Loginpage.jsp?msg=loginerror");
      				rd.forward(request, response);
    		      }
    			
    			// Step 5:  Process the result set
    			/*while (myRs.next()) {
    				String name = myRs.getString("name");
    				out.println(name);
    			}*/
    		}
    		catch (Exception exc) {
    			exc.printStackTrace();
    		}
        }else {
        	try {
    			myConn = dataSource.getConnection();
    			
    			// Step 3:  Create a SQL statements
    			//String sql = "select * from login2";
    			myStmt = myConn.createStatement();
    			
    			// Step 4:  Execute SQL query
    			myRs = myStmt.executeQuery("select * from signup where name='"+name+"' and password='"+pass+"'");
    			  
    		      
    		      if(myRs.next()) {
    		    	    HttpSession session=request.getSession();
    					//session.setAttribute("login", "yes");
    					//session.setAttribute("type", type);
    					session.setAttribute("name", name);
    					//session.setAttribute("loginid", myRs.getString("id"));


    					RequestDispatcher rd=request.getRequestDispatcher("admindashboard.jsp");
    		    	    //RequestDispatcher rd=request.getRequestDispatcher("Loginpage.jsp?msg=loginerror");
        			    rd.forward(request, response);
        			    
    		       
    		        
    		        
    		      }else {
    		    	
    		    	  RequestDispatcher rd=request.getRequestDispatcher("Loginpage.jsp?msg=loginerror");
        			  rd.forward(request, response);
    		      }
    			
    			// Step 5:  Process the result set
    			/*while (myRs.next()) {
    				String name = myRs.getString("name");
    				out.println(name);
    			}*/
    		}
        	catch (Exception exc) {
    			exc.printStackTrace();
    		}
        }
		
	
	}

}
