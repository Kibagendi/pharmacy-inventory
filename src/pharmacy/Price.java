package pharmacy;

public class Price {
	private double buyPrice;
	private double sellPrice;
	private static double profit = 1.30;
	
	public Price (double buyPrice){
		this.buyPrice = buyPrice;
		this.sellPrice = buyPrice * profit;
	}

	public double getBuyPrice() {
		return buyPrice;
	}

	public void setBuyPrice(double buyPrice) {
		this.buyPrice = buyPrice;
	}

	public double getSellPrice() {
		return sellPrice;
	}

	public void setSellPrice(double sellPrice) {
		this.sellPrice = sellPrice;
	}

	
}
