package crt.bean;

public class Patient {
	
	private int pno;
	private String name;
	private String sex;
	private int age;
	private String address;
	private String tel;
	private String bing;
	private String time;
	private int bed;
	private String desc;
		
	public Patient() {
		super();
	}

	public Patient(int pno, String name, String sex, int age, String address,
			String tel, String bing, String time, int bed) {
		super();
		this.pno = pno;
		this.name = name;
		this.sex = sex;
		this.age = age;
		this.address = address;
		this.tel = tel;
		this.bing = bing;
		this.time = time;
		this.bed = bed;
	}
	
	public int getBed() {
		return bed;
	}

	public void setBed(int bed) {
		this.bed = bed;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
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

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getBing() {
		return bing;
	}

	public void setBing(String bing) {
		this.bing = bing;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	@Override
	public String toString() {
		return "Patient [pno=" + pno + ", name=" + name + ", sex=" + sex
				+ ", age=" + age + ", address=" + address + ", tel=" + tel
				+ ", bing=" + bing + ", time=" + time + ", bed=" + bed
				+ ", desc=" + desc + "]";
	}
}