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
		String name = request.getParameter("first_name");
        String last = request.getParameter("last_name");
        String email = request.getParameter("email");
        String pass = request.getParameter("password");
        String type=request.getParameter("type");
		/*String name=(String)request.getParameter("name");
		String id=(String)request.getParameter("id");
		String password=(String)request.getParameter("password");
		String repassword=(String)request.getParameter("repassword");
		String address=(String)request.getParameter("address");
		String city=(String)request.getParameter("city");
		String state=(String)request.getParameter("state");
		String country=(String)request.getParameter("country");
		String email=(String)request.getParameter("email");
		String number=(String)request.getParameter("number");
		String emprole=(String)request.getParameter("emprole");
		String empmagcode=(String)request.getParameter("empmagcode");
		String type=(String)request.getParameter("type");*/
		if("".equals(name)||"".equals(email)||"".equals(pass)){
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
                String insertquery = "insert into dum values(?,?,?,?)" ;
                PreparedStatement stmt = myConn.prepareStatement(insertquery);
    			//myStmt = myConn.createStatement();
    			
    			// Step 4:  Execute SQL query
    			//myRs = myStmt.executeQuery
			    //Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/finalproject", "root", "12345qwert");
                stmt.setString(1, name);
                stmt.setString(2, last);
                stmt.setString(3, email);
                stmt.setString(4, pass);
			    
			    /*stmt.setString(1,id);
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
			    stmt.setString(12,empmagcode);*/
				stmt.executeUpdate();
			    stmt.close();
				myConn.close();
				out.println("inserted");
				/*if("Tester".equals(type)){
					HttpSession session=request.getSession();
					session.setAttribute("login", "yes");
					session.setAttribute("type", type);
					session.setAttribute("user", name);
					session.setAttribute("loginid", id);
					RequestDispatcher rd=request.getRequestDispatcher("manager.jsp?msg=added");
					rd.forward(request, response);
				}else{
					RequestDispatcher rd=request.getRequestDispatcher("manager.jsp?msg=added");
					rd.forward(request, response);
				}
				*/	
			}
			catch(Exception e){
				
				/*if("Tester".equals(type)){
					RequestDispatcher rd=request.getRequestDispatcher("register.jsp?msg=error");
					rd.forward(request, response);
				}else{
					RequestDispatcher rd=request.getRequestDispatcher("adddeveloper.jsp?msg=error");
					rd.forward(request, response);
				}*/
				e.printStackTrace();
				out.println("someerror");
				
			}
		}
		
	}

}
