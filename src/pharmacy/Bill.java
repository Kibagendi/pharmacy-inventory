package pharmacy;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class Bill {

	private String client;
	private int state; //1=open; 2=close; 3=cancel
	private int billId;
	private List <BillLine> lines;
	
	public Bill(String client, int billId){
		lines = new ArrayList <BillLine> ();
		this.client = client;
		this.billId = billId;
		this.openBill();
	}

	public boolean addItem(BillLine item){
		boolean bool;
		try{
			bool = this.lines.add(item);
		}catch(Exception ex) {
			System.out.println("Error trying to add an item in the Bill.\n"+ex);
			bool = false;
		}

		return bool;
	}
	
	public void openBill(){
		this.state= 1;//open
	}

	public void closeBill(){
		this.state= 2;//close
	}

	public void cancelBill(){
		this.state= 3;//cancel
	}

	public int getState(){//1=open; 2=close; 3=cancel
		return this.state;
	}
	
	public boolean removeItem(BillLine item){
		boolean bool = false;
		try{
			if(this.lines.size()>0){
				this.lines.remove(item);
				bool = true;
			}
		}catch(Exception ex) {
			System.out.println("Error trying to delete an item in the Bill.\n"+ex);
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

	public int getBillId() {
		return billId;
	}

	public void setBillId(int billId) {
		this.billId = billId;
	}

	public List<BillLine> getLines() {
		return lines;
	}

	public void setLines(List<BillLine> lines) {
		this.lines = lines;
	}
	
	public Iterator<BillLine> getIterator(){
		return this.lines.iterator();

	}

}
