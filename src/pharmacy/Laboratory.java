package pharmacy;

import java.util.TreeSet;

public class Laboratory implements Comparable{

	private String name;
	private String address;
	private String telephone;
	
	private TreeSet<LaboratoryLine> laboratoryCatalog;

	public Laboratory (String name){
		laboratoryCatalog = new TreeSet<LaboratoryLine>();
		this.name = name;
	}
	
	public boolean equals( Object object ) {
		// Indica en base a que atributos se iguala el objeto 
		if (object == null) return false; 
		Laboratory laboratory = (Laboratory)object; 
		if (this.getName().equals(laboratory.getName()) ) return true; 

		return false;
	} 

	public int hashCode() {
		// retorna un identificador unico del objeto. 
		return this.getName().hashCode();
	} 

	public int compareTo( Object object ) {
		// Indica en base a que atributos se compara el objeto 
		// Devuelve +1 si this es > que objeto 
		// Devuelve -1 si this es < que objeto 
		// Devuelve 0 si son iguales 

		Laboratory laboratory = (Laboratory)object; 
		String objectName = laboratory.getName().toLowerCase(); 
		String thisName = this.getName().toLowerCase(); 

		return( thisName.compareTo( objectName ) );
	}

	
	public String getName() {
		return name == null ? " " : name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address == null ? " " : address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getTelephone() {
		return telephone == null ? " " : telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public TreeSet<LaboratoryLine> getLaboratoryCatalog() {
		return laboratoryCatalog;
	}

	public void setLaboratoryCatalog(TreeSet<LaboratoryLine> laboratoryCatalog) {
		this.laboratoryCatalog = laboratoryCatalog;
	}
	
	
}
