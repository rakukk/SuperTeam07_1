package piirivalve.beans;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Entity
//Tabelile nõutud nimi
@Table (name="RIIGI_ADMIN_YKSUS") 


@NamedQuery (name="AdminYksus.findAll", query="SELECT e FROM RIIGI_ADMIN_YKSUS e")


public class AdminYksus {

	/*
	CREATE TABLE RIIGI_ADMIN_YKSUS (
		       riigi_admin_yksus_ID INTEGER,
		       avaja                VARCHAR(32) NOT NULL,
		       avatud               DATE NOT NULL,
		       muutja               VARCHAR(32) NOT NULL,
		       muudetud             DATE NOT NULL,
		       sulgeja              VARCHAR(32),
		       suletud              DATE NOT NULL,
		       kood                 VARCHAR(20),
		       nimetus              VARCHAR(100),
		       kommentaar           LONG VARCHAR,
		       alates               DATE NOT NULL,
		       kuni                 DATE NOT NULL,
		       riigi_admin_yksuse_lik_id INTEGER NOT NULL,
		       
		       PRIMARY KEY (riigi_admin_yksus_ID), 
		       
		       FOREIGN KEY (riigi_admin_yksuse_lik_id)
		                             REFERENCES RIIGI_ADMIN_YKSUSE_LIIK
		                             ON DELETE RESTRICT
		);

		CREATE UNIQUE INDEX XPKRIIGI_ADMIN_YKSUS ON RIIGI_ADMIN_YKSUS
		(
		       riigi_admin_yksus_ID
		);

		CREATE INDEX XIF5RIIGI_ADMIN_YKSUS ON RIIGI_ADMIN_YKSUS
		(
		       riigi_admin_yksuse_lik_id
		);
	*/
	
	
	@Id 
	@GeneratedValue //(strategy = GenerationType.TABLE)
	private int riigi_admin_yksuse_id;
	
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
	
	private int riigi_admin_yksuse_lik_id;
	
	public AdminYksus() {
		
		// TODO Auto-generated constructor stub
	
	}

	public int getRiigi_admin_yksuse_id() {
		return riigi_admin_yksuse_id;
	}

	public void setRiigi_admin_yksuse_id(int riigi_admin_yksuse_id) {
		this.riigi_admin_yksuse_id = riigi_admin_yksuse_id;
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

	public Date getAvatud() {
		return avatud;
	}

	public void setAvatud(Date avatud) {
		this.avatud = avatud;
	}

	public String getSulgeja() {
		return sulgeja;
	}

	public void setSulgeja(String sulgeja) {
		this.sulgeja = sulgeja;
	}

	public Date getSuletud() {
		return suletud;
	}

	public void setSuletud(Date suletud) {
		this.suletud = suletud;
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

	public int getRiigi_admin_yksuse_lik_id() {
		return riigi_admin_yksuse_lik_id;
	}

	public void setRiigi_admin_yksuse_lik_id(int riigi_admin_yksuse_lik_id) {
		this.riigi_admin_yksuse_lik_id = riigi_admin_yksuse_lik_id;
	}
	
	
	
}
