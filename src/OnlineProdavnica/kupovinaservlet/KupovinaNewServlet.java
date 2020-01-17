package OnlineProdavnica.kupovinaservlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import OnlineProdavnica.adminservlet.AdminDao;

/**
 * Servlet implementation class KupovinaNewServlet
 */
public class KupovinaNewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public KupovinaNewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String txtIme="", txtPrezime="", proizvodid="", proizvod="", DrzavaId="", Adresa="";
		
		txtIme=request.getParameter("ime");
		txtPrezime=request.getParameter("prezime");
		proizvodid=request.getParameter("proizvodid");
		proizvod=request.getParameter("proizvod");
		DrzavaId=request.getParameter("DrzavaId");
		Adresa=request.getParameter("adresa");
		
		KupovinaDao kupovinadao = new KupovinaDao();
		kupovinadao.New(txtIme, txtPrezime, proizvodid, proizvod, DrzavaId, Adresa);

		response.sendRedirect("index.jsp");
	}
}
