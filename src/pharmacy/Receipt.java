package pharmacy;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Receipt implements Comparable{
	
	private int quantity;
	private Date receptionDate;
	private double unitPrice;
	
	private DateFormat df = new SimpleDateFormat ("yyyy-M-dd HH:mm:ss");
	private Request request;
	
	public Receipt(Request request, int quantity, double totalPrice){
		this.quantity = quantity;
		if(quantity>0)
			this.unitPrice = totalPrice/quantity;
		this.request = request;
		request.process(quantity, unitPrice);
		this.receptionDate = new Date();
	}
	

	public boolean equals( Object object ) {
		// Indica en base a que atributos se iguala el objeto 
		if (object == null) return false; 
		Receipt receipt = (Receipt)object; 
		if (this.receptionDate.equals(receipt.getReceptionDate())) return true; 

		return false;
	} 

	public int hashCode() {
		// retorna un identificador unico del objeto. 
		return this.receptionDate.hashCode();
	} 

	public int compareTo( Object object ) {
		// Indica en base a que atributos se compara el objeto 
		// Devuelve +1 si this es > que objeto 
		// Devuelve -1 si this es < que objeto 
		// Devuelve 0 si son iguales 

		Receipt receipt = (Receipt)object; 
		Date objectDate = receipt.getReceptionDate(); 
		Date thisDate = this.getReceptionDate(); 

		return( thisDate.compareTo( objectDate ) );
	}

	
	public String getReceptionDateString(){
		return df.format(receptionDate);
	}

	public Date getReceptionDate(){
		return this.receptionDate;
	}

	public int getQuantity() {
		return quantity;
	}


	public Request getRequest() {
		return request;
	}

	public double getUnitPrice() {
		return unitPrice;
	}


	
}
