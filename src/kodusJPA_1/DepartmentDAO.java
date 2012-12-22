package kodusJPA_1;



import javax.persistence.EntityManager;


import kodusJPA_1.Department;



public class DepartmentDAO extends piirivalve.DAO.GenericDAO{

	//Olemi kirjutamine andmebaasi SuperTeam07_1
	public void insertDepartment(Department department) {
		
		EntityManager em = createEntityManager();
        em.getTransaction().begin();
        
        em.persist(department);
        
        em.getTransaction().commit();
        
        em.close();
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
