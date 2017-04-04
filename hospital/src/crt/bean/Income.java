package crt.bean;

public class Income{
	
	private int pno;
	private String pname;
	private String date;
	private String money;
	
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	
	
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
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
	public Income(int pno,String pname, String date, String money) {
		super();
		this.pno = pno;
		this.pname = pname;
		this.date = date;
		this.money = money;
	}
	public Income() {
		super();
	}
	@Override
	public String toString() {
		return "Income [pno=" + pno + ", pname=" + pname + ", date=" + date
				+ ", money=" + money + "]";
	}
	
	
}
