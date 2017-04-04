package crt.bean;

public class MakeDrug {
	
	private int mdid;
	private int pno;
	private int dno;
	private int sno;	
	private int count;
	private String makeDrugDate;
	private String useDrugDate;
	private String send;
	private String pname;
	private String dname;
		
	public String getDname() {
		return dname;
	}


	public void setDname(String dname) {
		this.dname = dname;
	}


	public String getPname() {
		return pname;
	}


	public void setPname(String pname) {
		this.pname = pname;
	}


	public MakeDrug() {
		super();
	}

	public MakeDrug(int pno, int dno, int sno, int count, String makeDrugDate,
			String useDrugDate, String send) {
		super();
		this.pno = pno;
		this.dno = dno;
		this.sno = sno;
		this.count = count;
		this.makeDrugDate = makeDrugDate;
		this.useDrugDate = useDrugDate;
		this.send = send;
	}
	public MakeDrug(int mdid, int pno, int dno, int sno, int count, String makeDrugDate,
			String useDrugDate, String send) {
		super();
		this.mdid = mdid;
		this.pno = pno;
		this.dno = dno;
		this.sno = sno;
		this.count = count;
		this.makeDrugDate = makeDrugDate;
		this.useDrugDate = useDrugDate;
		this.send = send;
	}


	public int getMdid() {
		return mdid;
	}


	public void setMdid(int mdid) {
		this.mdid = mdid;
	}


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


	public int getSno() {
		return sno;
	}


	public void setSno(int sno) {
		this.sno = sno;
	}


	public int getCount() {
		return count;
	}


	public void setCount(int count) {
		this.count = count;
	}


	public String getMakeDrugDate() {
		return makeDrugDate;
	}


	public void setMakeDrugDate(String makeDrugDate) {
		this.makeDrugDate = makeDrugDate;
	}


	public String getUseDrugDate() {
		return useDrugDate;
	}


	public void setUseDrugDate(String useDrugDate) {
		this.useDrugDate = useDrugDate;
	}


	public String getSend() {
		return send;
	}


	public void setSend(String send) {
		this.send = send;
	}


	@Override
	public String toString() {
		return "MakeDrug [mdid=" + mdid + ", pno=" + pno + ", dno=" + dno
				+ ", sno=" + sno + ", count=" + count + ", makeDrugDate="
				+ makeDrugDate + ", useDrugDate=" + useDrugDate + ", send="
				+ send + ", pname=" + pname + ", dname=" + dname + "]";
	}


	
	
}
