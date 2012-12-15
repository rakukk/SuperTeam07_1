package kodusJPA_1;

import java.io.Serializable;
import java.lang.Long;
import java.lang.String;
import java.util.Collection;


import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
//import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;


import kodusJPA_1.Employee;

/**
 * Entity implementation class for Entity: Department
 *
 */
@Entity

public class Department implements Serializable {

	   
	@Id
	@GeneratedValue //(strategy = GenerationType.TABLE)
	private Long id;
	private String name;
	
	
	@OneToMany(mappedBy = "department")
	private Collection<Employee> employees;
	
	public void setEmployees(Collection<Employee> employees) {
		this.employees = employees;
	}
	
		public Collection<Employee> getEmployees() {
		return employees;
	}
	


	
	
	//genereeritud kood eclipsega aga mis sisu ei tea
	private static final long serialVersionUID = 1L;


	
	public Department() {
		super();
	}   
	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}   
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}
   
}
