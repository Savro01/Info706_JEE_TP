package colis.ejb;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import colis.jpa.Colis;
import colis.jpa.HistoryColis;
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
		
		this.addHistoryColis(c.getId(), latitude, longitude, emplacement, etat);

		return c;
	}

	/**
	 * Recuperation d'un colis a l'aide de son identifiant unique.
	 * 
	 * @param id identifiant de la mesure
	 * @return mesure correspondant a l'identifiant ou null
	 */
	public Colis findColis(long id) {
		Colis c = em.find(Colis.class, id);
		return c;
	}
	
	public List<Colis> findAllColis(Boolean byState) {
		if (byState) {
	        TypedQuery<Colis> rq = em.createQuery("SELECT m FROM Colis m ORDER BY m.etat ASC", Colis.class);
	        return rq.getResultList();
		}else {
	        TypedQuery<Colis> rq = em.createQuery("SELECT m FROM Colis m ORDER BY m.id ASC", Colis.class);
	        return rq.getResultList();
		}
    }

	public List<HistoryColis> findHistory(long id) {
		 TypedQuery<HistoryColis> rq = em.createQuery("SELECT h FROM HistoryColis h WHERE idColis="+ id +"ORDER BY h.id ASC", HistoryColis.class);
	        return rq.getResultList();
	}

	public HistoryColis addHistoryColis(long id, double latitude, double longitude, String emplacement,
			Etat etat) {
		
		SimpleDateFormat formatter= new SimpleDateFormat("dd/MM/YYYY (HH:mm)");
		Date date = new Date(System.currentTimeMillis());
		String dateString = formatter.format(date);
		
		
		HistoryColis hc = new HistoryColis(id, latitude, longitude, emplacement, etat, dateString);
		em.persist(hc);
		return hc;
	}

	public void editColis(long id, double latitude, double longitude, String emplacement, Etat etat) {
		
		Colis colis= (Colis)em.find(Colis.class ,id);
		 colis.setLatitude(latitude);
		 colis.setLongitude(longitude);
		 colis.setEmplacement(emplacement);
		 colis.setEtat(etat);
		 
		 em.merge(colis);
		 
		 
		 this.addHistoryColis(id, latitude, longitude, emplacement, etat);

	}

	public void deleteColis(long id) {
		Colis colis= (Colis)em.find(Colis.class ,id);
		
		em.remove(colis);
	}
	
}