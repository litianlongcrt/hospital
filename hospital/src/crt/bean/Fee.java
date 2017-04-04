package crt.bean;

public class Fee {
	private int pno;
	private String name;
	private String jiaofei;
	private String feiyong;
	private String jieyu;
	
	
	public Fee(int pno, String name, String jiaofei, String feiyong,
			String jieyu) {
		super();
		this.pno = pno;
		this.name = name;
		this.jiaofei = jiaofei;
		this.feiyong = feiyong;
		this.jieyu = jieyu;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}	
	
	
	public String getJiaofei() {
		return jiaofei;
	}
	public void setJiaofei(String jiaofei) {
		this.jiaofei = jiaofei;
	}
	public String getFeiyong() {
		return feiyong;
	}
	public void setFeiyong(String feiyong) {
		this.feiyong = feiyong;
	}
	public String getJieyu() {
		return jieyu;
	}
	public void setJieyu(String jieyu) {
		this.jieyu = jieyu;
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	
	@Override
	public String toString() {
		return "Fee [pno=" + pno + ", name=" + name + ", jiaofei=" + jiaofei
				+ ", feiyong=" + feiyong + ", jieyu=" + jieyu + "]";
	}
	
	
	
}
