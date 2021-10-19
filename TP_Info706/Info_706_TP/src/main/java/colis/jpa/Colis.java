package colis.jpa;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import colis.jpa.Etat;

@Entity
public class Colis implements Serializable {
	
	
	@Id @GeneratedValue
	private long id;
	
	private double poids;
	
	private double valeur;
	
	private String origine;
	
	private String destination;
	
	// Localisation
	private double latitude;
	private double longitude;
	private String emplacement;
	private Etat etat;
	
	public Colis() {
	}

	public Colis(double poids, double valeur, String origine, String destination, double latitude, double longitude, String emplacement, Etat etat) {
		this.poids = poids;
		this.valeur = valeur;
		this.origine = origine;
		this.destination = destination;
		this.latitude = latitude;
		this.longitude = longitude;
		this.emplacement = emplacement;
		this.etat = etat;
	}

	// GETTER ID
	public long getId() {
		return id;
	}
	
	// GETTER origine
	public String getOrigine() {
		return origine;
	}
	
	// GETTER poids
	public double getPoids() {
		return poids;
	}
	
	// GETTER valeur
	public double getValeur() {
		return valeur;
	}
	
	// GETTER destination
	public String getDestination() {
		return destination;
	}
	
	// GETTER latitude
	public Double getLatitude() {
		return latitude;
	}
	
	// GETTER longitude	
	public Double getLongitude() {
		return longitude;
	}
	
	// GETTER emplacement
	public String getEmplacement() {
		return emplacement;
	}
	
	// GETTER etat
	public Etat getEtat() {
		return etat;
	}
	
	// SETTER destination
	public void setDestination(String destination) {
		this.destination = destination;
	}

	// SETTER origine
	public void setOrigine(String origine) {
		this.origine = origine;
	}
	
	// SETTER valeur
	public void setValeur(double valeur) {
		this.valeur = valeur;
	}
	
	// SETTER poids
	public void setPoids(double poids) {
		this.poids = poids;
	}
	
	// SETTER latitude
	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}
	
	// SETTER longitude
	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}

	// SETTER emplacement
	public void setEmplacement(String emplacement) {
		this.emplacement = emplacement;
	}
	
	// SETTER etat
	public void setEtat(Etat etat) {
		this.etat = etat;
	}
}