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
public class HistoryColis implements Serializable {
	
	@Id @GeneratedValue
	private long id;
	
	private long idColis;	
	
	// Localisation
	private double latitude;
	private double longitude;
	private String emplacement;
	private Etat etat;
	
	private String date;	

	
	public HistoryColis() {
	}

	public HistoryColis(long idColis, double latitude, double longitude, String emplacement, Etat etat, String date) {
		this.idColis = idColis;
		this.setLatitude(latitude);
		this.setLongitude(longitude);
		this.setEmplacement(emplacement);
		this.setEtat(etat);
		this.setDate(date);
	}
	


		public double getLatitude() {
			return latitude;
		}

		public void setLatitude(double latitude) {
			this.latitude = latitude;
		}

		public String getDate() {
			return date;
		}

		public void setDate(String date) {
			this.date = date;
		}

		public double getLongitude() {
			return longitude;
		}

		public void setLongitude(double longitude) {
			this.longitude = longitude;
		}

		public String getEmplacement() {
			return emplacement;
		}

		public void setEmplacement(String emplacement) {
			this.emplacement = emplacement;
		}

		public Etat getEtat() {
			return etat;
		}

		public void setEtat(Etat etat) {
			this.etat = etat;
		}

	
}