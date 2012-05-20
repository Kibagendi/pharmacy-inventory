
package pharmacy;

public class Product implements Comparable{

	private String brandName;//Seroquel
	private String primaryIngredient;//Quetiapine Fumarate
	private String strength; //mg
	private String sizeOrCount;//pack size
	private String doseForm;//Aerosol, chewable, capsule, tablet, concentrate, cream, Drops, Spray
	private String administrationRoute;//Buccal, Oral, Dental, Implantation, Injection, Intramuscular, Ophthalmic, Nasal

	/*
	 * Constructors
	 */
	public Product() {
	}

	public Product(String name, String strength, String sizeOrCount) {
		this.brandName = name;
		this.strength = strength;
		this.sizeOrCount = sizeOrCount;
	}

	public Product(String name, String primaryIngredient, String strength, String sizeOrCount, String doseForm, String administrationRoute) {
		this.brandName = name;
		this.primaryIngredient = primaryIngredient;
		this.strength = strength;
		this.sizeOrCount = sizeOrCount;
		this.doseForm = doseForm;
		this.administrationRoute = administrationRoute;
	}

	public boolean equals( Object object ) {
		// Indica en base a que atributos se iguala el objeto 
		if (object == null) return false; 
		Product product = (Product)object; 
		if (this.getBrandName().equals(product.getBrandName()) ) return true; 

		return false;
	} 

	public int hashCode() {
		// retorna un identificador unico del objeto. 
		return this.getBrandName().hashCode();
	} 

	public int compareTo( Object object ) {
		// Indica en base a que atributos se compara el objeto 
		// Devuelve +1 si this es > que objeto 
		// Devuelve -1 si this es < que objeto 
		// Devuelve 0 si son iguales 

		Product product = (Product)object; 
		String objectName = product.getBrandName().toLowerCase(); 
		String thisName = this.getBrandName().toLowerCase(); 

		return( thisName.compareTo( objectName ) );
	}

	public String getBrandName() {
		return brandName == null ? " " : brandName;
	}

	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}

	public String getPrimaryIngredient() {
		return primaryIngredient == null ? " " : primaryIngredient;	}

	public void setPrimaryIngredient(String primaryIngredient) {
		this.primaryIngredient = primaryIngredient;
	}

	public String getStrength() {
		return strength == null ? " " : strength;
	}

	public void setStrength(String strength) {
		this.strength = strength;
	}

	public String getSizeOrCount() {
		return sizeOrCount == null ? " " : sizeOrCount;
	}

	public void setSizeOrCount(String sizeOrCount) {
		this.sizeOrCount = sizeOrCount;
	}

	public String getDoseForm() {
		return doseForm == null ? " " : doseForm;
	}

	public void setDoseForm(String doseForm) {
		this.doseForm = doseForm;
	}

	public String getAdministrationRoute() {
		return administrationRoute == null ? " " : administrationRoute;
	}

	public void setAdministrationRoute(String administrationRoute) {
		this.administrationRoute = administrationRoute;
	}

}
