package pharmacy;

import java.util.Iterator;
import java.util.TreeSet;

public class ProductCatalog {

	// Un TreeSet no permite elementos duplicados. 
	// Un TreeSet mantiene la lista ordenada. 
	// El elemento a comparar debe contar con métodos equals, hashCode y compareTo.
	private TreeSet <Product> productsCatalog;

	
	public ProductCatalog(){
		productsCatalog =  new TreeSet<Product>();
	}


	public TreeSet<Product> getProductsCatalog() {
		return productsCatalog;
	}

	public void setProductsCatalog(TreeSet<Product> productsCatalog) {
		this.productsCatalog = productsCatalog;
	}

	public boolean addItem(Product item){
		boolean bool = false;
		try{
			if(!item.getBrandName().isEmpty())
				bool = this.productsCatalog.add(item);
		}catch(Exception ex) {
			System.out.println("Error trying to add an item in the Product Catalog.\n"+ex);
			bool = false;
		}

		return bool;
	}


	public boolean removeItem(Product item){
		boolean bool = false;
		try{
			if(this.productsCatalog.size()>0){
				this.productsCatalog.remove(item);
				bool = true;
			}
		}catch(Exception ex) {
			System.out.println("Error trying to delete an item in the product category.\n"+ex);
			bool = false;
		}

		return bool;
	}
		

	public int Size() {
		return this.productsCatalog.size();
	}

	public Product getProduct(int productCode)
	{
		Product product = null;
		Iterator <Product> it = this.productsCatalog.iterator();
		while (it.hasNext())
		{
			product =it.next();
			if (product.hashCode()== productCode)
				return product;
		}
	return 	null;
	}
	
	public Iterator<Product> getIterator() {
		return this.productsCatalog.iterator();
		}

}
