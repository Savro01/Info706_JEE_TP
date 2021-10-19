package colis.ejb;

import colis.jpa.Colis;
import colis.jpa.Etat;

public interface ColisEjbInt {

	public Colis addColis(double poids, double valeur, String origine, String destination, double latitude, double longitude, String emplacement, Etat etat);
	
	public Colis findColis(double id); 
}
