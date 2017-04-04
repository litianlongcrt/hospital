package crt.bean;

public class Expense {
	private int pno;
	private int dno;
	private String dname;
	private Double price;
	private int count;
	private String date;
	private String money;
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public int getDno() {
		return dno;
	}
	public void setDno(int dno) {
		this.dno = dno;
	}
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getMoney() {
		return money;
	}
	public void setMoney(String money) {
		this.money = money;
	}
	public Expense(int pno, int dno, String dname, Double price, int count,
			String date, String money) {
		super();
		this.pno = pno;
		this.dno = dno;
		this.dname = dname;
		this.price = price;
		this.count = count;
		this.date = date;
		this.money = money;
	}
	public Expense() {
		super();
	}
	@Override
	public String toString() {
		return "Expense [pno=" + pno + ", dno=" + dno + ", dname=" + dname
				+ ", price=" + price + ", count=" + count + ", date=" + date
				+ ", money=" + money + "]";
	}
	
	
}
