package pharmacy;

import java.util.Date;

public class Item {

	private int id;
	private int width;
	private int height;
	private String location;
	private Date expDate;
	//private double price;
	
	/*
	 * Constructors
	 */
	public Item() {
	}
	
	public Item(int id, Date expDate) {
		this.id = id;
		this.expDate = expDate;
	}

	public Item(int id, int width, int height, String location, Date expDate) {
		this.id = id;
		this.width = width;
		this.height = height;
		this.location = location;
		this.expDate = expDate;
	}

	public int getId() {
		return id;
	}

	//public void setId(int id) {
	//	this.id = id;
	//}

	public int getWidth() {
		return width;
	}

	public void setWidth(int width) {
		this.width = width;
	}

	public int getHeight() {
		return height;
	}

	public void setHeight(int height) {
		this.height = height;
	}

	public String getLocation() {
		return location == null ? " " : location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public Date getExpDate() {
		return expDate;
	}

	public void setExpDate(Date expDate) {
		this.expDate = expDate;
	}

}
