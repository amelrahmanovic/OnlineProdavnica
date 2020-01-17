package OnlineProdavnica.drzavaservlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DrzavaNewServlet
 */
public class DrzavaNewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DrzavaNewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String txtNaziv="";
		txtNaziv=request.getParameter("naziv");
		
		DrzavaDao dao = new DrzavaDao();
		dao.New(txtNaziv);

		response.sendRedirect("Meni.jsp");
	}

}
