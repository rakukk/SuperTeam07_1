package kodusJPA_1;


import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import kodusJPA_1.GenericDAO;
import kodusJPA_1.EmployeeDAO;
import kodusJPA_1.VaadeDAO;
import kodusJPA_1.Employee;
import kodusJPA_1.Project;

public class Launcher {

	/**
	 * @param args
	 * @throws ClassNotFoundException, SQLException 
	 */
	public static void main(String[] args) throws ClassNotFoundException, SQLException {
				
			String workingDir = System.getProperty("user.dir");
		
		 		//nii saab sal file hsqldb-sse lugeda
				Connection connection = null;
		 		try {
		 		
				 Class.forName("org.hsqldb.jdbcDriver");

	                connection = DriverManager.getConnection(
	                    "jdbc:hsqldb:hsql://localhost/test", "sa", "");
	             
	                ScriptRunner runner = new ScriptRunner(connection, true, false);
	                
					// kui tahan seda ka kuskil mujal kasutada peab olema web-content all need sql failid
	                // C:\tomcat\webapps\piirivalve\WEB-INF\classes\piirivalve\model
	                try {
						runner.runScript(new BufferedReader(new FileReader("src\\piirivalve\\model\\piir.sql")));
					} catch (IOException e) {
						
						e.printStackTrace();
					}
					
		 		} finally {
	                // Closing the connection
	                if (connection != null) {
	                    connection.close();
	                }
		 		
		 		
		 		
		
		// SEE ON OLULINE ET OLEKS SIIN
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("KodusJPA_1");
	
		try {
			OtseHSQLDB.kirjutaDB();
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		
		VaadeDAO vaadeDao = new VaadeDAO();
		
		Vaade vaade1 = new Vaade();
		vaade1.setName("PUU");
		
		 // Sisestamine Vaade
        try {
            vaadeDao.insertVaade(vaade1, emf);
           
        } catch (Exception e) {
            System.err.println("Exception while saving departments! ");
            System.err.println(e);
            e.printStackTrace();
        }
			
        
		Vaade vaade2 = new Vaade();
		vaade2.setName("Adminyksuse vaatamine");
		
		 // Sisestamine Vaade
        try {
            vaadeDao.insertVaade(vaade2, emf);
           
        } catch (Exception e) {
            System.err.println("Exception while saving departments! ");
            System.err.println(e);
            e.printStackTrace();
        }
        
        //VAATE kontroll
               
       List <Vaade> vaated = VaadeDAO.namedQueryVaade();
        
		
		DepartmentDAO departmentDao = new DepartmentDAO();
		 
		 	Department hullar = new Department();
		 	hullar.setName("Hullar");
		 
		 	Department normull = new Department();
		 	normull.setName("Normull");
		 	
	        // Sisestamine Department
	        try {
	            departmentDao.insertDepartment(hullar, emf);
	           
	        } catch (Exception e) {
	            System.err.println("Exception while saving departments! ");
	            System.err.println(e);
	            e.printStackTrace();
	        }
	        
	        // Sisestamine Department 2
	        try {
	           
	            departmentDao.insertDepartment(normull, emf);
	        } catch (Exception e) {
	            System.err.println("Exception while saving departments! ");
	            System.err.println(e);
	            e.printStackTrace();
	        }
		 	
	        
	        
	        ProjectDAO projectDao = new ProjectDAO();
	        
	        Project project1 = new Project();
	        
	        project1.setName("Projekt1");
	        
	        // Sisestamine Project
	        try {
	            projectDao.insertProject(project1, emf);
	           
	        } catch (Exception e) {
	            System.err.println("Exception while saving departments! ");
	            System.err.println(e);
	            e.printStackTrace();
	        }
	        
	        
	        
		 	
	        EmployeeDAO employeeDao = new EmployeeDAO();
	        
	        
	        Employee employee1 = new Employee();
	        employee1.setName("Fedja");
	        employee1.setSalary(100);
	        employee1.setDepartment(hullar);
	        
	 
	        Employee employee2 = new Employee();
	        employee2.setName("Peeter");
	        employee2.setSalary(20000);
	        employee2.setDepartment(normull);
	        
	        
	        // Sisestamine 1
	        try {
	            employeeDao.insertEmployee(employee1, emf);
	        } catch (Exception e) {
	            System.err.println("Exception while saving employee: " + employee1);
	            System.err.println(e);
	            e.printStackTrace();
	        }
	        // Sisestamine 2
	        try {
	            employeeDao.insertEmployee(employee2, emf);
	        } catch (Exception e) {
	            System.err.println("Exception while saving employee: " + employee2);
	            System.err.println(e);
	            e.printStackTrace();
	        }
	       
	        
	        // Olemi lugemine
	        try {
	            System.out.println("Mudru siia: " + employeeDao.findEmployee(emf));
	        } catch (Exception e) {
	            System.err.println("Exception findEmployee: ");
	            System.err.println(e);
	            e.printStackTrace();
	        }
	        
	        // Olemi muutmine
	        try {
	            System.out.println("Olemi muutus!");
	            employeeDao.changeEmployee(emf);
	        } catch (Exception e) {
	            System.err.println("Exception changeEmployee: ");
	            System.err.println(e);
	            e.printStackTrace();
	        }
	        
	        // Olemi kustutamine
	        try {
	            System.out.println("Olemi kustutamine!");
	            employeeDao.deleteEmployee(1,emf);
	        } catch (Exception e) {
	            System.err.println("Exception deleteEmployee: ");
	            System.err.println(e);
	            e.printStackTrace();
	        }
	        
	        // Olemi kustutamine p2ringuga
	        try {
	            System.out.println("Olemi kustutaminep2ringuga!");
	            employeeDao.queryDeleteEmployee(emf);
	        } catch (Exception e) {
	            System.err.println("Exception queryDeleteEmployee: ");
	            System.err.println(e);
	            e.printStackTrace();
	        }
	        
	        // P2ringud2 - p2ringu parameetrid
	        try {
	        	
	        	employee1.setSalary(111111);
	        	employeeDao.mergeEmployee(employee1,emf);
	        	
	        	System.out.println("Olemi p2ringu parameetrid !");
	            
	            List <Employee> employees = employeeDao.queryParameterEmployee(emf);
	            
	            System.out.print("Siin on p2ring2 return " + employees);
	            
	        } catch (Exception e) {
	            System.err.println("Exception queryDeleteEmployee: ");
	            System.err.println(e);
	            e.printStackTrace();
	        }
	        
	        // P2ringud3 - nimelised p2ringud
	        try {
	        	
	        	
	        	System.out.println("P2ring3 - olemi nimelised p2ringud !");
	            
	            List <Employee> employees = employeeDao.namedQueryEmployee(emf);
	            
	            System.out.print("Siin on P2ringud3 return: " + employees);
	        } catch (Exception e) {
	            System.err.println("Exception queryDeleteEmployee: ");
	            System.err.println(e);
	            e.printStackTrace();
	        }
	        
	        // P2ringud4 - nimelised p2ringud eraldi xml
	        try {
	        	
	        	System.out.println("PRINDI TEST!");
	        	
	        	//Miski p2rast see enam l6puks ei kajastu baasis???
	        	employeeDao.mergeEmployee(employee2,emf);
	        	//
	        	System.out.println("KAS SELLE PRINDIB?");
	        	
	        	System.out.println("Olemi nimelised p2ringud eraldi xml!");
	            
	            List <Employee> employees = employeeDao.namedQueryEmployee_1(emf);
	            
	            System.out.print("Siin on P2ringud4 return: " + employees);
	        } catch (Exception e) {
	            System.err.println("Exception P2RINGUD_4: ");
	            System.err.println(e);
	            e.printStackTrace();
	        }
	        
	        // Otsime DB-st millises osakonnas tootaja tootab
	        
	        try {
	        		        	
	        	System.out.println("Tootaja departmenti leidmine baasist!");
	            
	            Department department = new Department();
	            department = employeeDao.getEmployeeDepartment(emf);
	            
	            System.out.print("Siin isik Id=3 tootab osakonnas: " + department.getName());
	        } catch (Exception e) {
	            System.err.println("Exception millises osakonnas totoaja tootab: ");
	            System.err.println(e);
	            e.printStackTrace();
	        }
	        
	        	        
	        try {
		        EntityManager em = emf.createEntityManager();
		        Project project0 = em.find(Project.class, 1);

		        // See sumber ongi ID mille baasist leian
		        employee2 = em.find(Employee.class, 4);
		        project0.getEmployees().add(employee2);
		        
		        employee2.getProjects().add(project0);
		        
		        
		        // Kirjutame ikka baasi kah!
		        employeeDao.mergeEmployee(employee2, emf);
		        
	        } catch (Exception e) {
	            System.err.println("Exception MANYTOMANY: ");
	            System.err.println(e);
	            e.printStackTrace();
	        }

	        
	        
	        //GenericDAO.closeEntityManager();
	        
	}

	}
	
	
}
	
