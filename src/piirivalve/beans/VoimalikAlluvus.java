package piirivalve.beans;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.Table;



@Entity
//Tabelile nõutud nimi
@Table (name="VOIMALIK_ALLUVUS") 


@NamedQuery (name="VOIMALIK_ALLUVUS.findYks", query="SELECT e FROM VOIMALIK_ALLUVUS e")





public class VoimalikAlluvus {

	/*
	CREATE TABLE VOIMALIK_ALLUVUS (
		       voimalik_alluvus_id  INTEGER,
		       avaja                VARCHAR(32) NOT NULL,
		       avatud               DATE NOT NULL,
		       muutja               VARCHAR(32) NOT NULL,
		       muudetud             DATE NOT NULL,
		       sulgeja              VARCHAR(32),
		       suletud              DATE NOT NULL,
		       
		       riigi_admin_yksuse_lik_id INTEGER NOT NULL,
		       voimalik_alluv_liik_ID INTEGER NOT NULL,
		       
		       kommentaar           LONG VARCHAR,
		       
		       PRIMARY KEY (voimalik_alluvus_id), 
		       FOREIGN KEY (voimalik_alluv_liik_ID)
		                             REFERENCES RIIGI_ADMIN_YKSUSE_LIIK
		                             ON DELETE RESTRICT, 
		       FOREIGN KEY (riigi_admin_yksuse_lik_id)
		                             REFERENCES RIIGI_ADMIN_YKSUSE_LIIK
		                             ON DELETE RESTRICT
		);
	*/
	
	
	@Id 
	@GeneratedValue //(strategy = GenerationType.TABLE)
	private int voimalik_alluvus_id;
	
	private String avaja;
	private Date avatud;
	
	private String sulgeja;
	private Date suletud;
	
	private String muutja;
	private Date muudetud;
	
	private String kommentaar;
	
	private int riigi_admin_yksuse_lik_id;
	private int voimalik_alluv_liik_ID;
	
	public VoimalikAlluvus() {
		
		// TODO Auto-generated constructor stub
	
	}
	
	
	
	
	
	
	

	
	
	
}
