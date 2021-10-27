package colis.jpa;

public enum Etat {
	ENREGISTREMENT,
	EN_ATTENTE,
	EXPEDIE,
	BLOQUE,
	LIVRE;
	
	
	public static Etat getEtatByString(String etat) {
		return Etat.valueOf(etat);
	}
	
}
