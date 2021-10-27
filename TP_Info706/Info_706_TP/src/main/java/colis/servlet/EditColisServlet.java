package colis.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

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
 * Servlet implementation class EditColisServlet
 */
@WebServlet("/edit")
public class EditColisServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	@EJB
	private ColisEjb ejb;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditColisServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		long id = Long.parseLong(request.getParameter("id"));
		double latitude = Double.parseDouble(request.getParameter("latitude"));
		double longitude = Double.parseDouble(request.getParameter("longitude"));
		String emplacement = request.getParameter("emplacement");
		
		String etatString = request.getParameter("etat");		
		Etat etat = Etat.getEtatByString(etatString);

		ejb.editColis(id, latitude,longitude,emplacement,etat);
			
	}

}
