package kodusJPA_1;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

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
 
    public static void closeEntityManagerFactory() {
    	
        emf.close();
        
    }
    
    
  //-------------Tabelite loomine andmebaasi
    
    public static void looTabelid () throws ClassNotFoundException, SQLException {
  	  
  		//nii saab sal file hsqldb-sse lugeda
  		Connection connection = null;
  		try {
  		
  		 Class.forName("org.hsqldb.jdbcDriver");

  		 //SIIN ON ÜKS DB
            connection = DriverManager.getConnection(
                "file:C:\\Users\\Raido\\i377\\Team07d\\db;shutdown=true", "sa", "");
         
            ScriptRunner runner = new ScriptRunner(connection, true, false);
            
  			// kui tahan seda ka kuskil mujal kasutada peab olema web-content all need sql failid
            // C:\tomcat\webapps\piirivalve\WEB-INF\classes\piirivalve\model
            try {
  				runner.runScript(new BufferedReader(new FileReader("src\\SuperTeam07_1\\model\\piir.sql")));
  			} catch (IOException e) {
  				
  				e.printStackTrace();
  			}
  			
  		} finally {
            // Closing the connection
            if (connection != null) {
                connection.close();
            }
  	  
  		}  
    }
    
    /*
     * See on persistence xml vahe kas serveripõhine või file põhine! 
     * 
    		<properties>
			<property name="javax.persistence.jdbc.url" value="jdbc:hsqldb:hsql://localhost/test"/>
			<property name="javax.persistence.jdbc.driver" value="org.hsqldb.jdbc.JDBCDriver"/>		
		
	*/
    
	
	
}
