/**
 * 
 */
package kodusJPA_1;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import kodusJPA_1.Employee;



/**
 * EmployeeDAO
 * 
 * @author Raido
 *
 */
public class EmployeeDAO extends GenericDAO {

	//Olemi kirjutamine andmebaasi
	public void insertEmployee(Employee employee) {
		
       EntityManager em = createEntityManager();
        
       em.getTransaction().begin();
        
       em.persist(employee);
        
       em.getTransaction().commit();
        
       closeEntityManager();
		
	}
	
	//Olemi merge-mine andmebaasi kui esimest korda on persist tehtud
	public void mergeEmployee(Employee employee) {
		
		EntityManager em = createEntityManager();
        em.getTransaction().begin();
        
        em.merge(employee);
        
        em.getTransaction().commit();
        
        closeEntityManager();
		
	}
	
	
	//Olemi laadimine
	public Employee findEmployee (Long id){
		
		EntityManager em = createEntityManager();
	
	//	Employee e = em.find(Employee.class, 1L);
	
		Employee e = em.find(Employee.class, id);
	
		closeEntityManager();
	
	return e;
	
	}
	
	//Olemi muutmine
    public void changeEmployee(Long id, String uusNimi) {
        
    	EntityManager em = createEntityManager();
    	
        EntityTransaction tx = em.getTransaction();
        tx.begin();
 
        Employee e = em.find(Employee.class, id);
        if (e != null) e.setName(uusNimi);
 
        tx.commit();
        closeEntityManager();
    }
	
	
	//Olemi kustutamine
    public void deleteEmployee(int id) {
        EntityManager em = createEntityManager();
        EntityTransaction tx = em.getTransaction();
        tx.begin();
 
        Employee person = em.find(Employee.class, id);
        if (person != null) em.remove(person);
 
        tx.commit();
        
        closeEntityManager();
    }
    
	//P2ringud1
    public void queryDeleteEmployee() {
        EntityManager em = createEntityManager();
        em.getTransaction().begin();
        
        Query query = em.createQuery("delete from Employee");
        query.executeUpdate();
        
        em.getTransaction().commit();
        
        em.close();
        closeEntityManager();
    }
 
    
	//P2ringud2 - p2ringu parameetrid
    public List<Employee> queryParameterEmployee(int otsitavID) {
        EntityManager em = createEntityManager();
        
        TypedQuery<Employee> query = em.createQuery(
        		
        		"select e from Employee e where e.id = :id",
        		Employee.class);
        
        query.setParameter("id", otsitavID);
        
        List <Employee> employees = query.getResultList();
        em.close();
        closeEntityManager();
        
        return employees;
    }
    
	//P2ringud3 - nimelised p2ringud
    public List<Employee> namedQueryEmployee() {
        EntityManager em = createEntityManager();
        
        TypedQuery<Employee> namedQuery = em.createNamedQuery("Employee.findAll", Employee.class);
        		
        List <Employee> employees = namedQuery.getResultList();
        em.close();
        closeEntityManager();
        
        return employees;
    }
    
	//P2ringud4 - nimelised p2ringud eraldi xml
    public List<Employee> namedQueryEmployee_1() {
        EntityManager em = createEntityManager();
        
        TypedQuery<Employee> namedQuery = em.createNamedQuery("Employee.findAll_1", Employee.class);
        		
        List <Employee> employees = namedQuery.getResultList();
        em.close();
        closeEntityManager();
        return employees;
    }
    
    //Tootaja departmenti kysimine
    
    public Department getEmployeeDepartment(int otsitavID) {
        
    	EntityManager em = createEntityManager();
        
        Employee e = em.find(Employee.class, otsitavID);
        
        em.close();
        closeEntityManager();
        
        return e.getDepartment();
    }
    
    
}
