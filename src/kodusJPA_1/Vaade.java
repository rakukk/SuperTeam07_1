package kodusJPA_1;



import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.NamedQuery;

@Entity


@NamedQuery (name="Vaade.findAll", query="SELECT e FROM Vaade e")

public class Vaade {

	
		@Id 
		@GeneratedValue //(strategy = GenerationType.TABLE)
		private int id;
		  
		private String name;

		
		
		public Vaade(){
			
		}
		
		
		

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


}