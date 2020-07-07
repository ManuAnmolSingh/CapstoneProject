package capstone;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.http.HttpSession;


@WebServlet("/devlogout")
public class devlogout extends HttpServlet {
    private static final long serialVersionUID = 1L;
 
    public devlogout() {
        super();
    }
 
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.removeAttribute("name");
             
            RequestDispatcher dispatcher = request.getRequestDispatcher("DeveloperLogin.jsp");
            dispatcher.forward(request, response);
        }
    }
}