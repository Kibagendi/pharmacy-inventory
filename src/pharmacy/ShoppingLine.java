package pharmacy;

public class ShoppingLine {

	private PharmacyLine pharmacyLine;
	private int quantity;
	private double totalPrice;
	
	public ShoppingLine (PharmacyLine pharmacyLine, int quantity, double totalPrice)
	{
		this.pharmacyLine = pharmacyLine;
		this.quantity = quantity;
		this.totalPrice = totalPrice;
	}

	public PharmacyLine getPharmacyLine() {
		return pharmacyLine;
	}

	public void setPharmacyLine(PharmacyLine pharmacyLine) {
		this.pharmacyLine = pharmacyLine;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public double getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}
	
	
}
