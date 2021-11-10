package colis.servlet;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import colis.ejb.ColisEjb;
import colis.jpa.Colis;
import colis.jpa.Etat;
import colis.jpa.HistoryColis;

/**
 * Servlet implementation class ShowColisServlet
 */
@WebServlet("/show")
public class ShowColisServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	// injection de la reference de l'ejb
	@EJB
	private ColisEjb ejb;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowColisServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// recuperation et parsing des parametres de la requete
		long id = Long.parseLong(request.getParameter("id"));
		// Appel de l'ejb
		Colis c = ejb.findColis(id);
		
		List<HistoryColis> history = ejb.findHistory(id);
		
		// ajout du colis dans la requete
		request.setAttribute("colis",c);
		
		request.setAttribute("history",history);
		
		
		List<Etat> etats = Arrays.asList(Etat.values());
		request.setAttribute("etats", etats);
		
		
		// transfert a la JSP d'affichage
		request.getRequestDispatcher("/editColis.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
