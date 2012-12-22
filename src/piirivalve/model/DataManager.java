package piirivalve.model;


import java.util.Hashtable;
import java.util.List;

import piirivalve.beans.Vaade;




public class DataManager {
  
	// Need igaksjuhuks siin sest vist tuli andmebaas kasutaja ja parooliga kaitsta
  private String dbURL = "";
  private String dbUserName = "";
  private String dbPassword = "";

  public void setDbURL(String dbURL) {
    this.dbURL = dbURL;
    }
  public String getDbURL() {
    return dbURL;
    }

  public void setDbUserName(String dbUserName) {
    this.dbUserName = dbUserName;
    }
  public String getDbUserName() {
    return dbUserName;
    }

  public void setDbPassword(String dbPassword) {
    this.dbPassword = dbPassword;
    }
  public String getDbPassword() {
    return dbPassword;
    }
  
  

  
  //---------- Vaatega tegutsmine
 
  // Siin on kirjas, et võtaks VAADE tabelist kogu infi ja viskaks hashtable ümber
  public Hashtable<Integer, String> getCategories() {
    
	  //meetodi namedQueryVaade kaudu ja see on Vaade.javas kirjas nii @NamedQuery (name="Vaade.findAll", query="SELECT e FROM Vaade e")
	  // tegelik päring loomulikult VaadeDAO all toimub
	  List <Vaade> vaated = piirivalve.DAO.VaadeDAO.namedQueryVaade(); 
	  
	  
	  Hashtable <Integer, String> myHashTable = new Hashtable<Integer, String>();
	    
  	  for (int i = 0; i<vaated.size(); i++) {
  		    
  		 myHashTable.put(vaated.get(i).getId(), vaated.get(i).getName());
  		  
  	  }
	 
	  return myHashTable;
    }
    
  }
