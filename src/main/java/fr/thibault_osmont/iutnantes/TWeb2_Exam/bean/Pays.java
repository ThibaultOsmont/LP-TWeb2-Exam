package fr.thibault_osmont.iutnantes.TWeb2_Exam.bean;

public class Pays {

	private String code ;
	private String nom ;
	
	public Pays(String code, String nom) {
		super();
		this.code = code;
		this.nom = nom;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	
}
