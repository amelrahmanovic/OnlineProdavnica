package OnlineProdavnica.adminservlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AdminNewServlet
 */
public class AdminNewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminNewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String txtIme="", txtPrezime="", txtUsername="", txtPassword="";
		txtIme=request.getParameter("ime");
		txtPrezime=request.getParameter("prezime");
		txtUsername=request.getParameter("username");
		txtPassword=request.getParameter("password");
		
		AdminDao admindao = new AdminDao();
		admindao.New(txtIme, txtPrezime, txtUsername, txtPassword);

		response.sendRedirect("Meni.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
