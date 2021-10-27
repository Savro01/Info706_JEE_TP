package colis.servlet;

import java.util.List;
import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import colis.ejb.ColisEjb;
import colis.jpa.*;

/**
 * Servlet implementation class ShowSuiviServlet
 */
@WebServlet("/follow")
public class ShowSuiviServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@EJB
	private ColisEjb ejb;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowSuiviServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sort = request.getParameter("sort");
		List<Colis> listColis;
		
		if (sort == "etat") {
			listColis = ejb.findAllColis(true);
		}else {
			listColis = ejb.findAllColis(false);
		}
		

		
		request.setAttribute("allColis", listColis);
		request.getRequestDispatcher("/showColis.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	@Override
	protected final void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		long id = Long.parseLong(req.getParameter("id"));
		ejb.deleteColis(id);
	}

}
