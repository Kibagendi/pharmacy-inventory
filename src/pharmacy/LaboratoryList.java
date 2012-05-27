package pharmacy;

import java.util.Iterator;
import java.util.TreeSet;

public class LaboratoryList {

	// Un TreeSet no permite elementos duplicados. 
	// Un TreeSet mantiene la lista ordenada. 
	// El elemento a comparar debe contar con métodos equals, hashCode y compareTo.
	private TreeSet <Laboratory> laboratoryList;

	
	public LaboratoryList(){
		laboratoryList =  new TreeSet<Laboratory>();
	}


	public TreeSet<Laboratory> getLaboratoryList() {
		return laboratoryList;
	}

	public void setLaboratoryList(TreeSet<Laboratory> laboratoryList) {
		this.laboratoryList = laboratoryList;
	}

	public boolean addItem(Laboratory item){
		boolean bool;
		try{
			bool = this.laboratoryList.add(item);
		}catch(Exception ex) {
			System.out.println("Error trying to add an item in the Laboratory List.\n"+ex);
			bool = false;
		}

		return bool;
	}


	public boolean removeItem(Laboratory item){
		boolean bool = false;
		try{
			if(this.laboratoryList.size()>0){
				this.laboratoryList.remove(item);
				bool = true;
			}
		}catch(Exception ex) {
			System.out.println("Error trying to delete an item in the Laboratory List.\n"+ex);
			bool = false;
		}

		return bool;
	}
		

	public int Size() {
		return this.laboratoryList.size();
	}

	public Laboratory getLaboratory(int laboratoryCode)
	{
		Laboratory Laboratory = null;
		Iterator <Laboratory> it = this.laboratoryList.iterator();
		while (it.hasNext())
		{
			Laboratory =it.next();
			if (Laboratory.hashCode()== laboratoryCode)
				return Laboratory;
		}
	return 	null;
	}
	
	public Iterator<Laboratory> getIterator() {
		return this.laboratoryList.iterator();
		}

}
