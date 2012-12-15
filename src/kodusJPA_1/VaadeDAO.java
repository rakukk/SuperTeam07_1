package kodusJPA_1;

import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;

import javax.persistence.*;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;

public class VaadeDAO {

	
	//Olemi kirjutamine andmebaasi
	public void insertVaade(Vaade vaade, EntityManagerFactory emf) {
		
       EntityManager em = emf.createEntityManager();
        
       em.getTransaction().begin();
        
        em.persist(vaade);
        
        em.getTransaction().commit();
        
        em.close();
	
	}
	
	//P2ringud3 - nimelised p2ringud
    public static List<Vaade> namedQueryVaade() {
    	
    	// SEE ON OLULINE ET OLEKS SIIN ja selle lahtikirjutus on persistence.xml-is
    	EntityManagerFactory emf = Persistence.createEntityManagerFactory("TEST");
    	
    	EntityManager em = emf.createEntityManager();
        
    	
    	// Jälle named query!
        TypedQuery<Vaade> namedQuery = em.createNamedQuery("Vaade.findAll", Vaade.class);
        		
        List <Vaade> vaated= namedQuery.getResultList();
        em.close();
        
        emf.close();
        
        return vaated;
    }
	
	
	
}
