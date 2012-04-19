package pharmacy;

public class Price {
	private double price;
	
	public Price (double price){
		this.price = price;
	}

	public double getPrice() {
		return this.price;
	}

	public void setPrice(double price) {
		 System.out.println("Price - Price: "+price);
		this.price = price;
	}
	
}
