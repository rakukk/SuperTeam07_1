package kodusJPA_1;

import java.util.ArrayList;
import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToMany;


@Entity
public class Project {

	
	@Id 
	@GeneratedValue //(strategy = GenerationType.TABLE)
	private int id;
	private String name;
	
	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	@ManyToMany (mappedBy = "projects")
	private Collection<Employee> employees;
	
	
	public Collection<Employee> getEmployees() {
		return employees;
	}


	public void setEmployees(Collection<Employee> employees) {
		this.employees = employees;
	}
	

	public Project(){
		employees = new ArrayList<Employee>();
	}
	
	/*
	public void addEmployee (Employee employee){
		
		employees.add(employee);
		employee.getProjects().add(this);
	}
	*/
	
}
