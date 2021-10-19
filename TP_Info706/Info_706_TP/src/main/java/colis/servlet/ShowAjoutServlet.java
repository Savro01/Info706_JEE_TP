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
import colis.jpa.Etat;

/**
 * Servlet implementation class Main
 */
@WebServlet("/ShowAjoutServlet")
public class ShowAjoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@EJB
	private ColisEjb ejb;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowAjoutServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Etat> etats = Arrays.asList(Etat.values());
		request.setAttribute("etats", etats);
		request.getRequestDispatcher("/ajoutColis.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
