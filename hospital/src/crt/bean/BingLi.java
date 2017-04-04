package crt.bean;

public class BingLi {
	private int pno;
	private String name;
	private String sex;
	private int age;	
	private String bing;
	private String money;
	private String desc;

	
	public BingLi() {
		super();
	}

	public BingLi(int pno, String name,String sex, int age, String bing, String money, String desc) {
		super();
		this.pno = pno;
		this.name = name;
		this.sex = sex;
		this.age = age;
		this.bing = bing;
		this.money = money;
		this.desc = desc;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBing() {
		return bing;
	}

	public void setBing(String bing) {
		this.bing = bing;
	}

	public String getMoney() {
		return money;
	}

	public void setMoney(String money) {
		this.money = money;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	@Override
	public String toString() {
		return "BingLi [pno=" + pno + ", name=" + name + ", sex=" + sex
				+ ", age=" + age + ", bing=" + bing + ", money=" + money
				+ ", desc=" + desc + "]";
	}
}
