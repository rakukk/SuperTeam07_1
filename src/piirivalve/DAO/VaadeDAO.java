package piirivalve.DAO;


import java.util.List;

import javax.persistence.*;

import piirivalve.beans.Vaade;

public class VaadeDAO extends GenericDAO {

	
	//Olemi kirjutamine andmebaasi
	public void insertVaade(Vaade vaade) {
		
       EntityManager em = createEntityManager();
        
       em.getTransaction().begin();
        
        em.persist(vaade);
        
        em.getTransaction().commit();
        
        em.close();
	
	}
	
	//P2ringud3 - nimelised p2ringud
    public static List<Vaade> namedQueryVaade() {
    	
    	// SEE ON OLULINE ET OLEKS SIIN ja selle lahtikirjutus on persistence.xml-is
    	//EntityManagerFactory emf = Persistence.createEntityManagerFactory("TEST");
    	
    	EntityManager em = createEntityManager();
        
    	
    	// Jälle named query!
        TypedQuery<Vaade> namedQuery = em.createNamedQuery("Vaade.findAll", Vaade.class);
        		
        List <Vaade> vaated= namedQuery.getResultList();
        em.close();
        
        
        
        return vaated;
    }
	
	
	
}
