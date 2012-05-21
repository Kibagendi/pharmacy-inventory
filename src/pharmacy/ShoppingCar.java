package pharmacy;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class ShoppingCar {

	private String client;
	private int state; //1=open; 2=close; 3=cancel
	private int shoppingCarId;
	private List <ShoppingLine> lines;
	
	public ShoppingCar(String client, int shoppingCarId){
		lines = new ArrayList <ShoppingLine> ();
		this.client = client;
		this.shoppingCarId = shoppingCarId;
		this.openShoppingCarId();
	}

	public boolean addItem(ShoppingLine item){
		boolean bool;
		try{
			bool = this.lines.add(item);
		}catch(Exception ex) {
			System.out.println("Error trying to add an item in the ShoppingCar.\n"+ex);
			bool = false;
		}

		return bool;
	}
	
	public void openShoppingCarId(){
		this.state= 1;//open
	}

	public void closeShoppingCarId(){
		this.state= 2;//close
	}

	public void cancelShoppingCarId(){
		this.state= 3;//cancel
	}

	public int getState(){//1=open; 2=close; 3=cancel
		return this.state;
	}
	
	public boolean removeItem(ShoppingLine item){
		boolean bool = false;
		try{
			if(this.lines.size()>0){
				this.lines.remove(item);
				bool = true;
			}
		}catch(Exception ex) {
			System.out.println("Error trying to delete an item in the ShoppingCar.\n"+ex);
			bool = false;
		}

		return bool;
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

	public List<ShoppingLine> getLines() {
		return lines;
	}

	public void setLines(List<ShoppingLine> lines) {
		this.lines = lines;
	}
	
	public Iterator<ShoppingLine> getIterator(){
		return this.lines.iterator();

	}

}
