package pharmacy;

import java.util.Date;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

public class ShoppingCar {

	private String client;
	private int state; //1=open; 2=close; 3=cancel
	private Date creationDate;
	private Date finalDate;
	
	private int shoppingCarId;
	private HashMap<String, ShoppingLine>  lines;
	
	private DateFormat df = new SimpleDateFormat ("yyyy-M-dd HH:mm:ss");
	
	public ShoppingCar(String client, int shoppingCarId){
		lines = new HashMap <String, ShoppingLine>();
		this.client = client;
		this.shoppingCarId = shoppingCarId;
		this.openShoppingCar();
	}

	public boolean addItem(String lineKey, ShoppingLine item){
		boolean bool = false;
		try{
			if (!this.lines.containsKey(lineKey)){
				this.lines.put(lineKey, item);
				bool = true;
				//System.out.println("put-shoopinglineKey:"+lineKey);
				//System.out.println("put-ProductName:"+item.getPharmacyLine().getProduct().getBrandName());
			}
		}catch(Exception ex) {
			System.out.println("Error trying to add an item in the ShoppingCar.\n"+ex);
			bool = false;
		}

		return bool;
	}

	
	public ShoppingLine getItem(String lineKey){
		ShoppingLine sl = lines.get(lineKey);
		//System.out.println("get-shoopinglineKey:"+lineKey);
		//System.out.println("get-ProductName:"+sl.getPharmacyLine().getProduct().getBrandName());
		return sl;
	}

	public void openShoppingCar(){
		this.state= 1;//open
		this.creationDate = new Date();
	}

	public void closeShoppingCar(){
		this.state= 2;//close
		this.finalDate = new Date();
	}

	public void cancelShoppingCar(){
		this.state= 3;//cancel
		this.finalDate = new Date();
	}

	public int getState(){//1=open; 2=close; 3=cancel
		return this.state;
	}

	public String getCreationDateString(){
		return df.format(creationDate);
	}

	public String getFinalDateString(){
		return df.format(finalDate);
	}

	public Date getCreationDate(){
		return this.creationDate;
	}

	public Date getFinalDate(){
		return this.finalDate;
	}

	public boolean removeItem(String lineKey){
		return (null!=this.lines.remove(lineKey));
	}

	
	public String getClient() {
		return client;
	}

	public void setClient(String client) {
		this.client = client;
	}

	public int getShoppingCarId() {
		return shoppingCarId;
	}

	public void setShoppingCarId(int shoppingCarId) {
		this.shoppingCarId = shoppingCarId;
	}

	public HashMap <String, ShoppingLine> getLines() {
		return lines;
	}

	public void setLines(HashMap <String, ShoppingLine> lines) {
		this.lines = lines;
	}
	
	public Iterator <String> getIterator(){
		Collection<String> c = this.lines.keySet();
		return c.iterator();
	}

	public double getTotalPrice() {
		double totalPrice = 0;
		Collection<ShoppingLine> c = this.lines.values();
		Iterator <ShoppingLine> it = c.iterator();
		
		while (it.hasNext())
		{
			totalPrice= it.next().getTotalPrice() + totalPrice;
		}
		return totalPrice;
	}

}
