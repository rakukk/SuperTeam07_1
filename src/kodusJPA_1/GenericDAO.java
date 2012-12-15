package kodusJPA_1;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;



/**
 * Generic DAO for other DAOs to extend.
 *
 * @author Raido Kukk
 *
 */

public abstract class GenericDAO {

	private static EntityManagerFactory emf = Persistence.createEntityManagerFactory("KodusJPA_1");
	
    public EntityManager createEntityManager() {
        return emf.createEntityManager();
    }
 
    public static void closeEntityManager() {
        emf.close();
    }
	
	
}
