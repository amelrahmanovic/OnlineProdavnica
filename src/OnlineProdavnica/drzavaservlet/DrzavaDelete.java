package OnlineProdavnica.drzavaservlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import OnlineProdavnica.adminservlet.AdminDao;

/**
 * Servlet implementation class DrzavaDelete
 */
public class DrzavaDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DrzavaDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String txtId="";
		txtId=request.getParameter("id");
		DrzavaDao dao = new DrzavaDao();
		dao.DeleteById(Integer.parseInt(txtId));
		response.sendRedirect("Meni.jsp");
	}
}
