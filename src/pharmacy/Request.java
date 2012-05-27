package pharmacy;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Request implements Comparable{
	
	private int quantity;
	private Date requestDate;
	private int state;//1=sent, 2=processed 
	private DateFormat df = new SimpleDateFormat ("yyyy-M-dd HH:mm:ss");
	//private Laboratory laboratory;
	private PharmacyLine pharmacyLine;
	
	public Request(PharmacyLine pharmacyLine, int quantity){
		this.quantity = quantity;
		this.pharmacyLine = pharmacyLine;
		this.requestDate = new Date();
		this.setState2Sent();
		
	}
	
	public boolean equals( Object object ) {
		// Indica en base a que atributos se iguala el objeto 
		if (object == null) return false; 
		Request request = (Request)object; 
		if (this.requestDate.equals(request.getRequestDate())) return true; 

		return false;
	} 

	public int hashCode() {
		// retorna un identificador unico del objeto. 
		return this.requestDate.hashCode();
	} 

	public int compareTo( Object object ) {
		// Indica en base a que atributos se compara el objeto 
		// Devuelve +1 si this es > que objeto 
		// Devuelve -1 si this es < que objeto 
		// Devuelve 0 si son iguales 

		Request request = (Request)object; 
		Date objectDate = request.getRequestDate(); 
		Date thisDate = this.getRequestDate(); 

		return( thisDate.compareTo( objectDate ) );
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
	
	public void setState2Sent() {
		this.state = 1;
	}
	
	public void setState2Process() {
		this.state = 2;
	}
	
	public String getState() {
		if (state == 1)
			return "Sent";
		else if (state == 2)
			return "Processed";
		
		return "";
	}

	public PharmacyLine getPharmacyLine() {
		return pharmacyLine;
	}

	/*public void setPharmacyLine(PharmacyLine pharmacyLine) {
		this.pharmacyLine = pharmacyLine;
	}*/

	
}
