
package pharmacy;

import java.util.ArrayList;
import java.util.List;


public class ProductCategory {

	private String name;
	private String description;
	private String branch;
	private double price;
	private int currentStock;
	private int minStock;
	private int maxStock;
	private boolean isOrdered;
	private List<Item> itemList;

	/*
	 * Constructors
	 */
	public ProductCategory() {
	}

	public ProductCategory(String name , double price) {
		this.name = name;
		currentStock = 0;
		itemList = new ArrayList<Item> ();
		this.price = price;
	}
	
	public boolean addItem(Item item){
		boolean bool;
		try{
			this.itemList.add(currentStock, item);
			currentStock++;
			bool = true;
		}catch(Exception ex) {
			System.out.println("Error trying to add an item in the product category "+this.name);
			bool = false;
		}
		
		return bool;
	}

	
	public boolean removeItem(){
		boolean bool = false;
		try{
			if(this.itemList.size()>0){
	
			this.itemList.remove(0);
			currentStock--;
			bool = true;
			}
		}catch(Exception ex) {
			System.out.println("Error trying to delete an item in the product category "+this.name);
			bool = false;
		}
		
		return bool;
	}

	public String getName() {
		return name == null ? " " : name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description == null ? " " : description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getBranch() {
		return branch == null ? " " : branch;
	}

	public void setBranch(String branch) {
		this.branch = branch;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}
/*
	public void setCurrentStock(int currentStock) {
		this.currentStock = currentStock;
	}
*/
	public int getCurrentStock() {
		return currentStock;
	}

	public int getMinStock() {
		return minStock;
	}

	public void setMinStock(int minStock) {
		this.minStock = minStock;
	}

	public int getMaxStock() {
		return maxStock;
	}

	public void setMaxStock(int maxStock) {
		this.maxStock = maxStock;
	}

	public List<Item> getItemList() {
		return itemList;
	}

	public void setItemList(List<Item> itemList) {
		this.itemList = itemList;
	}

	public boolean isOrdered() {
		return isOrdered;
	}

	public void setOrdered(boolean isOrdered) {
		this.isOrdered = isOrdered;
	}

	
	
}
