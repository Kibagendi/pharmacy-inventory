package pharmacy;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Request implements Comparable{
	
	private int quantity;
	private Date requestDate;
	private DateFormat df = new SimpleDateFormat ("yyyy-M-dd HH:mm:ss");
	private Laboratory laboratory;
	private PharmacyLine pharmacyLine;
	
	public Request(PharmacyLine pharmacyLine, int quantity){
		this.quantity = quantity;
		this.requestDate = new Date();
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

}
