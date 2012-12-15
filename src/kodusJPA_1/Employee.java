package kodusJPA_1;

import java.util.ArrayList;
import java.util.Collection;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;
//import javax.persistence.Table;


@Entity
//@Table (name="EMPLOYEES") 
//nii saaks tabelile uue nime panna muidu on classi nimi

@NamedQuery (name="Employee.findAll", query="SELECT e FROM Employee e")

public class Employee {

	
	@Id 
	@GeneratedValue //(strategy = GenerationType.TABLE)
	private int id;
	private String name;
	private long salary;
	

	@ManyToOne(optional = false)
	//mitu tootajat v6ib olla yhes departmentis
	private Department department;
	
	@ManyToMany
	private Collection<Project> projects;
	
	
	
	public Collection<Project> getProjects() {
		return projects;
	}


	public void setProjects(Collection<Project> projects) {
		this.projects = projects;
	}
	
	/*
	public void addProject (Project project){
		
		projects.add(project);
		project.getEmployees().add(this);
	}
*/

	public Employee(){
		projects = new ArrayList<Project>();
	}
	
	
	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}


	public Employee(int id) {this.id = id;}

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

	public long getSalary() {
		return salary;
	}

	public void setSalary(long salary) {
		this.salary = salary;
	}
	
	
	
	
}

