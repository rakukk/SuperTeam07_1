package piirivalve.beans;


import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Entity
// Tabelile nõutud nimi
@Table (name="RIIGI_ADMIN_YKSUSE_LIIK") 


@NamedQuery (name="AdminYksuseLiik.findAll", query="SELECT e FROM RIIGI_ADMIN_YKSUSE_LIIK e")


public class AdminYksusLiik {
	/*
	 ID
	avaja                VARCHAR(32) NOT NULL,
    avatud               DATE NOT NULL,
    muutja               VARCHAR(32) NOT NULL,
    muudetud             DATE NOT NULL,
    sulgeja              VARCHAR(32),
    suletud              DATE NOT NULL,
    kood                 VARCHAR(10) NOT NULL,
    nimetus              VARCHAR(100) NOT NULL,
    kommentaar           LONG VARCHAR,
    alates               DATE NOT NULL,
    kuni                 DATE NOT NULL,
	*/
	
	@Id 
	@GeneratedValue //(strategy = GenerationType.TABLE)
	private int riigi_admin_yksuse_lik_id;
	
	private String kood;
	private String nimetus;
	
	
	private String avaja;
	private Date avatud;
	
	private String sulgeja;
	private Date suletud;
	
	private String muutja;
	private Date muudetud;
	
	private String kommentaar;
	
	private Date alates;
	private Date kuni;
	
	
	public AdminYksusLiik() {
		
		// TODO Auto-generated constructor stub
	
	}
	
	
	
	public String getKood() {
		return kood;
	}



	public void setKood(String kood) {
		this.kood = kood;
	}



	public String getNimetus() {
		return nimetus;
	}




	public void setNimetus(String nimetus) {
		this.nimetus = nimetus;
	}



	public String getAvaja() {
		return avaja;
	}



	public void setAvaja(String avaja) {
		this.avaja = avaja;
	}




	public String getSulgeja() {
		return sulgeja;
	}



	public void setSulgeja(String sulgeja) {
		this.sulgeja = sulgeja;
	}



	public String getMuutja() {
		return muutja;
	}




	public void setMuutja(String muutja) {
		this.muutja = muutja;
	}



	public Date getMuudetud() {
		return muudetud;
	}




	public void setMuudetud(Date muudetud) {
		this.muudetud = muudetud;
	}




	public String getKommentaar() {
		return kommentaar;
	}




	public void setKommentaar(String kommentaar) {
		this.kommentaar = kommentaar;
	}




	public Date getAlates() {
		return alates;
	}





	public void setAlates(Date alates) {
		this.alates = alates;
	}




	public Date getKuni() {
		return kuni;
	}




	public void setKuni(Date kuni) {
		this.kuni = kuni;
	}






	// GETTERS & SETTERS
	public int getId() {
		return riigi_admin_yksuse_lik_id;
	}


	public void setId(int id) {
		this.riigi_admin_yksuse_lik_id = id;
	}




	public Date getAvatud() {
		return avatud;
	}


	public void setAvatud(Date avatud) {
		this.avatud = avatud;
	}


	public Date getSuletud() {
		return suletud;
	}


	public void setSuletud(Date suletud) {
		this.suletud = suletud;
	}



		
	
	

}
