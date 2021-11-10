package colis.ejb;

import java.util.List;

import colis.jpa.Colis;
import colis.jpa.Etat;
import colis.jpa.HistoryColis;

public interface ColisEjbInt {

	public Colis addColis(double poids, double valeur, String origine, String destination, double latitude, double longitude, String emplacement, Etat etat);
	
	public Colis findColis(double id);
	
	public List<Colis> findAllColis();
	
	public List<HistoryColis> findHistory(long id);
	
	public HistoryColis addHistoryColis(long id, double latitude, double longitude, String emplacement,
			Etat etat);
	
	
	public void editColis(long id, double latitude, double longitude, String emplacement, Etat etat);
	
	public void deleteColis(long id);

}
