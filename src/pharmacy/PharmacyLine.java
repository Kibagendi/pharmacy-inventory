package pharmacy;

public class PharmacyLine implements Comparable{

	private String location;
	private int currentStock;
	private int minStock;
	private int maxStock;

	private Product product;
	private Laboratory laboratory;
	//private LaboratoryLine laboratoryLine;
	private Price price;
	private Request request;

	public PharmacyLine(Product product, Laboratory laboratory, Price price, int currentStock){
		this.product= product;
		this.laboratory = laboratory;
		this.price = price;
		this.currentStock = currentStock;
		this.minStock =-1;
		this.maxStock =-1;

	}
	
	public PharmacyLine(Product product, Laboratory laboratory, Price price, int currentStock,int minStock, int maxStock, String location){
		this.product= product;
		this.laboratory = laboratory;
		this.price = price;
		this.currentStock = currentStock;
		this.minStock =minStock;
		this.maxStock =maxStock;
		this.location = location;

	}

	public boolean equals( Object object ) {
		// Indica en base a que atributos se iguala el objeto 
		if (object == null) return false; 
		PharmacyLine pharmacyLine = (PharmacyLine)object; 
		if (this.getProduct().equals(pharmacyLine.getProduct()) && this.getLaboratory().equals(pharmacyLine.getLaboratory())) return true; 

		return false;
	} 

	public int hashCode() {
		// retorna un identificador unico del objeto. 
		return (this.getProduct().getBrandName() + this.getLaboratory().getName()).hashCode();
	} 

	public int compareTo( Object object ) {
		// Indica en base a que atributos se compara el objeto 
		// Devuelve +1 si this es > que objeto 
		// Devuelve -1 si this es < que objeto 
		// Devuelve 0 si son iguales 

		PharmacyLine pharmacyLine = (PharmacyLine)object; 
		Product objectProduct = pharmacyLine.getProduct(); 
		Product thisProduct = this.getProduct(); 

		Laboratory objectLaboratory = pharmacyLine.getLaboratory(); 
		Laboratory thisLaboratory = this.getLaboratory(); 

		return( thisProduct.compareTo( objectProduct ) + thisLaboratory.compareTo( objectLaboratory ));
	}

	public String getDescription(){
		return this.product.getBrandName() +" - "+ this.laboratory.getName() +" - "+ this.price.getSellPrice() +"$"; 
	}
	public String getLocation() {
		return location == null ? " " : location;
		}

	public void setLocation(String location) {
		this.location = location;
	}

	public int getCurrentStock() {
		return currentStock;
	}

	public boolean sellPharmacyLine(int quantity) {
		boolean bool = false;
		if (quantity < this.currentStock){
			this.currentStock = this.currentStock - quantity;
			bool= true;
			watcher();
		}

		return bool;
	}

	private void watcher(){
		
		if (this.currentStock< this.minStock)
		{
			requestProduct2Laboratory();
		}
	}
	
	private void requestProduct2Laboratory(){
		int orderQuantity; 
		if (this.maxStock>0 ){
			orderQuantity = this.maxStock - this.currentStock;
			request = new Request(orderQuantity);
		}
	}
	public int getMinStock() {
		return minStock;
	}

	public void setMinStock(int minStock) {
		this.minStock = minStock;
	}

	public int getMaxStock() {
		return maxStock;
	}

	public void setMaxStock(int maxStock) {
		this.maxStock = maxStock;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Laboratory getLaboratory() {
		return laboratory;
	}

	public void setLaboratory(Laboratory laboratory) {
		this.laboratory = laboratory;
	}

	public Price getPrice() {
		return price;
	}

	public void setPrice(Price price) {
		this.price = price;
	}

	public Request getRequest() {
		return request;
	}

	public void setRequest(Request request) {
		this.request = request;
	}


}
