package piirivalve.DAO;

import javax.persistence.EntityManager;

import piirivalve.beans.AdminYksusLiik;
import piirivalve.beans.Vaade;

public class AdminYksusLiikDAO extends GenericDAO{


	//Olemi kirjutamine andmebaasi
	public void insertVaade(AdminYksusLiik liik) {
		
       EntityManager em = createEntityManager();
        
       em.getTransaction().begin();
        
       em.persist(liik);
        
       em.getTransaction().commit();
        
       em.close();
	
	}
	
	

}
