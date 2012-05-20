package pharmacy;


public class LaboratoryLine implements Comparable{

	//private int lineId;
	private int deliveryTime;//hours
	private double price;

	private Product product;
	//private Request request;
	
	public LaboratoryLine(Product product, int deliveryTime, double price){
	
		this.product = product;
		this.deliveryTime = deliveryTime;
		this.price = price;
	}
	
	public boolean equals( Object object ) {
		// Indica en base a que atributos se iguala el objeto 
		if (object == null) return false; 
		LaboratoryLine laboratoryLine = (LaboratoryLine)object; 
		if (this.getProduct().equals(laboratoryLine.getProduct()) ) return true; 

		return false;
	} 

	public int hashCode() {
		// retorna un identificador unico del objeto. 
		return this.getProduct().hashCode();
	} 

	public int compareTo( Object object ) {
		// Indica en base a que atributos se compara el objeto 
		// Devuelve +1 si this es > que objeto 
		// Devuelve -1 si this es < que objeto 
		// Devuelve 0 si son iguales 

		LaboratoryLine laboratoryLine = (LaboratoryLine)object; 
		Product objectProduct = laboratoryLine.getProduct(); 
		Product thisProduct = this.getProduct(); 

		return( thisProduct.compareTo( objectProduct ) );
	}

	public int getDeliveryTime() {
		return deliveryTime;
	}

	public void setDeliveryTime(int deliveryTime) {
		this.deliveryTime = deliveryTime;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}
	
}
