package pharmacy;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.TreeSet;

public class Pharmacy {

	private String name;
	private String address;
	private String telephone;
	
	// Un TreeSet no permite elementos duplicados. 
	// Un TreeSet mantiene la lista ordenada. 
	// El elemento a comparar debe contar con métodos equals, hashCode y compareTo.
	private TreeSet <PharmacyLine> pharmacyInventory;
	private List <ShoppingCar> shoppingCarList;

	
	public Pharmacy(String name, String address){
		pharmacyInventory = new TreeSet<PharmacyLine>();
		shoppingCarList = new ArrayList<ShoppingCar>();
		this.name= name;
		this.address = address;
	}
	
	public String getName() {
		return name == null ? " " : name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address == null ? " " : address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getTelephone() {
		return telephone == null ? " " : telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public TreeSet<PharmacyLine> getpharmacyInventory() {
		return pharmacyInventory;
	}

	public void setProductsCatalog(TreeSet<PharmacyLine> pharmacyInventory) {
		this.pharmacyInventory = pharmacyInventory;
	}

	public boolean addItem(PharmacyLine item){
		boolean bool;
		try{
			bool = this.pharmacyInventory.add(item);
		}catch(Exception ex) {
			System.out.println("Error trying to add a Pharmacy Line in the Pharmacy.\n"+ex);
			bool = false;
		}

		return bool;
	}


	public boolean removeItem(PharmacyLine item){
		boolean bool = false;
		try{
			if(this.pharmacyInventory.size()>0){
				this.pharmacyInventory.remove(item);
				bool = true;
			}
		}catch(Exception ex) {
			System.out.println("Error trying to delete a Pharmacy Line in the Pharmacy.\n"+ex);
			bool = false;
		}

		return bool;
	}
		

	
	public boolean addShoppingCarItem(ShoppingCar item){
		boolean bool;
		try{
			bool = this.shoppingCarList.add(item);
		}catch(Exception ex) {
			System.out.println("Error trying to add a ShoppingCar in the Pharmacy.\n"+ex);
			bool = false;
		}

		return bool;
	}


	public boolean removeShoppingCarItem(ShoppingCar item){
		boolean bool = false;
		try{
			if(this.shoppingCarList.size()>0){
				this.shoppingCarList.remove(item);
				bool = true;
			}
		}catch(Exception ex) {
			System.out.println("Error trying to delete a ShoppingCar in the Pharmacy.\n"+ex);
			bool = false;
		}
		return bool;
	}
	
	public int numberOfShoppingCars() {
		return this.shoppingCarList.size();
	}

	public int Size() {
		return this.pharmacyInventory.size();
	}

	public PharmacyLine getPharmacyLine(int pharmacyLineCode)
	{
		PharmacyLine pharmacyLine = null;
		Iterator <PharmacyLine> it = this.pharmacyInventory.iterator();
		while (it.hasNext())
		{
			pharmacyLine =it.next();
			if (pharmacyLine.hashCode()== pharmacyLineCode)
				return pharmacyLine;
		}
	return 	null;
	}
	
	public Iterator<PharmacyLine> getIterator() {
		return this.pharmacyInventory.iterator();
		}
	
		

	public ShoppingCar getShoppingCar(int shoppingCarId) {
		return shoppingCarList.get(shoppingCarId);
	}

/*	public List<ShoppingCar> getBillList() {
		return billList;
	}

	public void setBillList(List<ShoppingCar> billList) {
		this.billList = billList;
	}
*/
}
