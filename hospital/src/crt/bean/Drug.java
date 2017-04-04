package crt.bean;

public class Drug {
	private int dno;
	private String name;
	private double price;
	
	
	public Drug() {
		super();
	}
	public Drug(int dno, String name, double price) {
		super();
		this.dno = dno;
		this.name = name;
		this.price = price;
	}
	@Override
	public String toString() {
		return "Drug [dno=" + dno + ", name=" + name + ", price=" + price + "]";
	}
	public int getDno() {
		return dno;
	}
	public void setDno(int dno) {
		this.dno = dno;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	} 
	
}
