package pharmacy;

import java.text.DecimalFormat;

public class PharmacyLine implements Comparable{

	private String location;
	private int currentStock;
	private int minStock;
	private int maxStock;

	private Product product;
	private Laboratory laboratory;
	//private LaboratoryLine laboratoryLine;
	private Price price;
	private Boolean isRequested;
	private DecimalFormat twoDec = new DecimalFormat("0.00");

	public PharmacyLine(Product product, Laboratory laboratory, Price price, int currentStock){
		this.product= product;
		this.laboratory = laboratory;
		this.price = price;
		this.currentStock = currentStock;
		this.minStock =-1;
		this.maxStock =-1;
		this.isRequested = false;
	}
	
	public PharmacyLine(Product product, Laboratory laboratory, Price price, int currentStock,int minStock, int maxStock, String location){
		this.product= product;
		this.laboratory = laboratory;
		this.price = price;
		this.currentStock = currentStock;
		this.minStock =minStock;
		this.maxStock =maxStock;
		this.location = location;
		this.isRequested = false;

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
		return this.product.getBrandName() +" - "+ this.laboratory.getName() +" - "+ twoDec.format(this.price.getSellPrice()) +" EUR"; 
	}
	public String getLocation() {
		return location == null ? " " : location;
		}

	public void setLocation(String location) {
		this.location = location;
	}

	public int getCurrentStock() {
		return this.currentStock;
	}

	public boolean takeOutPharmacyLine(int quantity) {
		boolean bool = false;
		if (quantity <= this.currentStock && quantity >0){
			this.currentStock = this.currentStock - quantity;
			bool= true;
		}

		return bool;
	}


	public boolean putInPharmacyLine(int quantity) {
		boolean bool = false;
		if (quantity >0)
			if(this.maxStock<0)//-1=infinity
			{
				this.currentStock = this.currentStock + quantity;
				bool= true;
			}
			else if ((quantity + this.currentStock) <= this.maxStock ){//si la cantidad no supera el inventario maximo
				this.currentStock = this.currentStock + quantity;
				bool= true;
			}

		return bool;
	}

	
	public void watcher(){
		
		if (this.currentStock<= this.minStock && !isRequested)
		{
			requestProduct();
		}
	}
	
	private Request requestProduct(){
		int orderQuantity;
		Pharmacy pharmacy = Pharmacy.getInstance();
		
		Request request = null;
		if (this.maxStock>0 && !isRequested){
			orderQuantity = this.maxStock - this.currentStock;
			request = new Request(this, orderQuantity);
			pharmacy.addRequestItem(request);
			this.isRequested = true;
			
		}
		return request;
	}

	public boolean recieveProduct(int quantity, double buyPrice){
		 
		boolean bool = this.putInPharmacyLine(quantity);
		
		if (bool){
			this.price.setBuyPrice(buyPrice);
			this.isRequested = false;
			watcher();//check if the inventory is enough 
		}
		return  bool;
	}
	
	public int getMinStock() {
		return this.minStock;
	}
	
	public void setMinStock(int minStock) {
		this.minStock = minStock;
	}

	public int getMaxStock() {
		return this.maxStock;
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


}
