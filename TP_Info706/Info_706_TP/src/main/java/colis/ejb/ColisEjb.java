package colis.ejb;

import java.util.List;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import colis.jpa.Colis;
import colis.jpa.Etat;

@Stateless
@LocalBean
public class ColisEjb {
	@PersistenceContext
	private EntityManager em;
	
	
	/**
	 * Constructeur sans parametre obligatoire
	 */
	public ColisEjb() {
		super();
	}
	
	/**
	 * Ajout d'un nouvelle colis.
	 * 
	 */
	public Colis addColis(double poids, double valeur, String origine, String destination, double latitude, double longitude, String emplacement, Etat etat) {
		Colis c = new Colis(poids, valeur, origine, destination, latitude, longitude, emplacement, etat);
		em.persist(c);
		return c;
	}

	/**
	 * Recuperation d'un colis a l'aide de son identifiant unique.
	 * 
	 * @param id identifiant de la mesure
	 * @return mesure correspondant a l'identifiant ou null
	 */
	public Colis findColis(double id) {
		Colis c = em.find(Colis.class, id);
		return c;
	}
	
	public List<Colis> findAllColis() {
        TypedQuery<Colis> rq = em.createQuery("SELECT m FROM Colis m ORDER BY m.id ASC", Colis.class);
        return rq.getResultList();
    }
	
}