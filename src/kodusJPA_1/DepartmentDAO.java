package kodusJPA_1;



import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;

import kodusJPA_1.Department;



public class DepartmentDAO { //extends GenericDAO{

	//Olemi kirjutamine andmebaasi
	public void insertDepartment(Department department, EntityManagerFactory emf) {
		
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        
        em.persist(department);
        
        em.getTransaction().commit();
        
        em.close();
		
	}
	
	
}
