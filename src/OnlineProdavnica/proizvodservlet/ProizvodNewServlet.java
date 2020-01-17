package OnlineProdavnica.proizvodservlet;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import OnlineProdavnica.adminservlet.AdminDao;

/**
 * Servlet implementation class ProizvodNewServlet
 */
public class ProizvodNewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProizvodNewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String txtNaziv="", txtOpis="", txtURLSlike="";
		txtNaziv=request.getParameter("naziv");
		txtOpis=request.getParameter("opis");
		txtURLSlike=request.getParameter("urlslika");
		int AdministratorId = 0;
		
		Cookie cookie = null;
        Cookie[] cookies = null;
        cookies = request.getCookies();
        if( cookies != null )
        {
       	 boolean findUser = false;
           for (int i = 0; i < cookies.length; i++) {
              cookie = cookies[i];
              if(cookie.getName( ).equals("username"))
              {
            	  AdminDao admindao = new AdminDao();
            	  AdministratorId = admindao.FindbyUsername(cookie.getValue( ));
              }
           }
        } 
		
		ProizvodDao proizvoddao = new ProizvodDao();
		
		Date date = Calendar.getInstance().getTime();  
		DateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");  
		String strDate = dateFormat.format(date);  
		
		proizvoddao.New(txtNaziv, txtOpis, strDate, txtURLSlike, AdministratorId);
		
		response.sendRedirect("Meni.jsp");
	}
}
