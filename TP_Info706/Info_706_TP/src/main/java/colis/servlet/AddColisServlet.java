package colis.servlet;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import colis.ejb.ColisEjb;
import colis.jpa.Colis;
import colis.jpa.Etat;

/**
 * Servlet implementation class AddColisServlet
 */
@WebServlet("/AddColisServlet")

public class AddColisServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	// injection de la reference de l'ejb
	@EJB
	private ColisEjb ejb;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddColisServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// recuperation et parsing des parametres de la requete
		double poids = Double.parseDouble(request.getParameter("poids"));
		double valeur = Double.parseDouble(request.getParameter("valeur"));
		String origine = request.getParameter("origine");
		String destination = request.getParameter("destination");
		double latitude = Double.parseDouble(request.getParameter("latitude"));
		double longitude = Double.parseDouble(request.getParameter("longitude"));
		String emplacement = request.getParameter("emplacement");
		Etat etat = Etat.ENREGISTREMENT;
		// appel de la methode d'ajout sur l'ejb
		Colis c = ejb.addColis(poids,valeur,origine,destination,latitude,longitude,emplacement,etat);		
		// ajout de la Colis dans la requete
		request.setAttribute("colis",c);
		// transfert a la JSP d'affichage
		request.getRequestDispatcher("/ajoutColis.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}