package pharmacy;

import java.util.TreeSet;

public class Laboratory {

	private String name;
	private String address;
	private String telephone;
	
	private TreeSet<LaboratoryLine> laboratoryCatalog;

	public Laboratory (String name){
		laboratoryCatalog = new TreeSet<LaboratoryLine>();
		this.name = name;
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
