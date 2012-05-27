package pharmacy;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.TreeSet;

public class Pharmacy {
	
	private static Pharmacy instance = null;

	private String name;
	private String address;
	private String telephone;
	
	// Un TreeSet no permite elementos duplicados. 
	// Un TreeSet mantiene la lista ordenada. 
	// El elemento a comparar debe contar con métodos equals, hashCode y compareTo.
	private TreeSet <PharmacyLine> pharmacyInventory;
	private TreeSet <Request> requestList;
	private TreeSet <Receipt> receiptList;
	private List <ShoppingCar> shoppingCarList;

	
	private Pharmacy() {
		pharmacyInventory = new TreeSet<PharmacyLine>();
		requestList = new TreeSet<Request>();
		receiptList = new TreeSet<Receipt>();
		shoppingCarList = new ArrayList<ShoppingCar>();

		this.name= "Farmacia Don Ramon";
		this.address = "Calle Mayor 25, Madrid, Madrid";
		this.telephone = "555-555-555";
		
	}
	
	public static synchronized Pharmacy getInstance() {
		if(instance == null) {
			instance = new Pharmacy();
		}
		return instance;
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
		


	public boolean addRequestItem(Request item){
		boolean bool;
		try{
			bool = this.requestList.add(item);
		}catch(Exception ex) {
			System.out.println("Error trying to add a Request in the Pharmacy.\n"+ex);
			bool = false;
		}

		return bool;
	}


	public boolean removeRequestItem(Request item){
		boolean bool = false;
		try{
			if(this.requestList.size()>0){
				this.requestList.remove(item);
				bool = true;
			}
		}catch(Exception ex) {
			System.out.println("Error trying to delete a Request in the Pharmacy.\n"+ex);
			bool = false;
		}

		return bool;
	}

	
	public boolean addReceiptItem(Receipt item){
		boolean bool;
		try{
			bool = this.receiptList.add(item);
		}catch(Exception ex) {
			System.out.println("Error trying to add a Receipt in the Pharmacy.\n"+ex);
			bool = false;
		}

		return bool;
	}


	public boolean removeReceiptItem(Receipt item){
		boolean bool = false;
		try{
			if(this.receiptList.size()>0){
				this.receiptList.remove(item);
				bool = true;
			}
		}catch(Exception ex) {
			System.out.println("Error trying to delete a Receipt in the Pharmacy.\n"+ex);
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
