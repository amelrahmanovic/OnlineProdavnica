package OnlineProdavnica.adminservlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AdminLoginServlet
 */
public class AdminLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String txtUsername="", txtPassword="";
		txtUsername=request.getParameter("username");
		txtPassword=request.getParameter("password");
		
		AdminDao admindao = new AdminDao();
		boolean findAdmin = (boolean) admindao.FindbyUsernamePassword(txtUsername, txtPassword);
		
		if(findAdmin==true)
		{
			Cookie cookie = new Cookie("username", txtUsername);
		    response.addCookie(cookie);
			
			response.sendRedirect("Meni.jsp");
		}
		else 
		{
			response.sendRedirect("AdminLogin.jsp");
		}
	}
}
