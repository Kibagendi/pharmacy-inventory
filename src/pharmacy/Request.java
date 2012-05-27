package pharmacy;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Request {
	
	private int quantity;
	private Date requestDate;
	private DateFormat df = new SimpleDateFormat ("yyyy-M-dd HH:mm:ss");
	private Laboratory laboratory;
	private PharmacyLine pharmacyLine;
	
	public Request(PharmacyLine pharmacyLine, int quantity){
		this.quantity = quantity;
		this.requestDate = new Date();
	}
	
	public String getRequestDateString(){
		return df.format(requestDate);
	}

	public Date getRequestDate(){
		return this.requestDate;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

}
