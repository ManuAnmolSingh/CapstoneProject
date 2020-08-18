package capstone;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.text.SimpleDateFormat;

import javax.annotation.Resource;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.sql.DataSource;

@WebServlet("/bugform")
public class bugform extends HttpServlet {
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
		
		int bugid = Integer.parseInt(request.getParameter("bugid"));
		String bugtitle = request.getParameter("bugtitle");
        String projectcode = request.getParameter("projectcode");
        String tickettype = request.getParameter("tickettype");
        String datetype = request.getParameter("datetype");
        
		String descriptio=request.getParameter("descriptio");
		String bughours=request.getParameter("bughours");
		String empcode=request.getParameter("empcode");
		String ticketstatus=request.getParameter("ticketstatus");
        String duedate=request.getParameter("duedate");
        
        
		/*String password=(String)request.getParameter("password");
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
		if("".equals(bugtitle)){
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
                String insertquery = "insert into bugreport values(?,?,?,?,?,?,?,?,?,?)" ;
                PreparedStatement stmt = myConn.prepareStatement(insertquery);
    			//myStmt = myConn.createStatement();
    			
    			// Step 4:  Execute SQL query
    			//myRs = myStmt.executeQuery
			    //Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/finalproject", "root", "12345qwert");
                stmt.setInt(1, bugid);
                stmt.setString(2, bugtitle);
                stmt.setString(3, projectcode);
                stmt.setString(4, tickettype);
                stmt.setString(5, datetype);
                stmt.setString(6, descriptio);
                stmt.setString(7, bughours);
                stmt.setString(8, empcode);
                stmt.setString(9, ticketstatus);
                stmt.setString(10, duedate);
			    
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
				RequestDispatcher rd=request.getRequestDispatcher("Testerdasboard.jsp?msg=added");
				rd.forward(request, response);
				//out.println("inserted");
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
				
				
					/*RequestDispatcher rd=request.getRequestDispatcher("addproject.jsp?msg=error");
					rd.forward(request, response);*/
					/*else{
					RequestDispatcher rd=request.getRequestDispatcher("adddeveloper.jsp?msg=error");
					rd.forward(request, response);
				}*/
					e.printStackTrace();
					out.println("someerror");
					
				
			}
		}
		
	}

}
