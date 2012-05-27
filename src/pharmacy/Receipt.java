package pharmacy;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Receipt {
	
	private int quantity;
	private Date receiptDate;
	private DateFormat df = new SimpleDateFormat ("yyyy-M-dd HH:mm:ss");
	private Laboratory laboratory;
	private PharmacyLine pharmacyLine;
	
	public Receipt(PharmacyLine pharmacyLine, int quantity){
		this.quantity = quantity;
		this.receiptDate = new Date();
	}
	
	public String getRequestDateString(){
		return df.format(receiptDate);
	}

	public Date getRequestDate(){
		return this.receiptDate;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

}
