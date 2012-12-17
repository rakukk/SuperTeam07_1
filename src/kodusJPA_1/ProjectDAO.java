package kodusJPA_1;

import javax.persistence.EntityManager;




public class ProjectDAO extends GenericDAO {

	//Olemi kirjutamine andmebaasi
	public void insertProject(Project project) {
		
       EntityManager em = createEntityManager();
        
       em.getTransaction().begin();
        
        em.persist(project);
        
        em.getTransaction().commit();
        
        em.close();
	
	}
	
	
}
