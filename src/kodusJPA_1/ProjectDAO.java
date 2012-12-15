package kodusJPA_1;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;



public class ProjectDAO {

	//Olemi kirjutamine andmebaasi
	public void insertProject(Project project, EntityManagerFactory emf) {
		
       EntityManager em = emf.createEntityManager();
        
       em.getTransaction().begin();
        
        em.persist(project);
        
        em.getTransaction().commit();
        
        em.close();
	
	}
	
	
}
