package crt.bean;

import java.util.List;

public class Staff {
	private int id;
	private int sno;
	private String name;
	private String pwd;
	private String sex;
	private String tel;
	private String qq;
	private String jobCode;
	private String jobName;
	private String grade;
	
	private List<Integer> pnos;	
	private List<Patient> patients;	
	
	public List<Patient> getPatients() {
		return patients;
	}

	public void setPatients(List<Patient> patients) {
		this.patients = patients;
	}

	public Staff() {
		super();
	}
	
	public Staff(int id, int sno, String name, String pwd, String sex,
			String tel, String qq, String jobCode) {
		super();
		this.id = id;
		this.sno = sno;
		this.name = name;
		this.pwd = pwd;
		this.sex = sex;
		this.tel = tel;
		this.qq = qq;
		this.jobCode = jobCode;
	}

	
	public List<Integer> getPnos() {
		return pnos;
	}

	public void setPnos(List<Integer> pnos) {
		this.pnos = pnos;
	}

	public String getJobCode() {
		return jobCode;
	}

	public void setJobCode(String jobCode) {
		this.jobCode = jobCode;
	}

	public String getJobName() {
		return jobName;
	}

	public void setJobName(String jobName) {
		this.jobName = jobName;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public Staff(int sno, String pwd) {
		this.sno = sno;
		this.pwd = pwd;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getSno() {
		return sno;
	}
	public void setSno(int sno) {
		this.sno = sno;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getQq() {
		return qq;
	}
	public void setQq(String qq) {
		this.qq = qq;
	}

	@Override
	public String toString() {
		return "Staff [id=" + id + ", sno=" + sno + ", name=" + name + ", pwd="
				+ pwd + ", sex=" + sex + ", tel=" + tel + ", qq=" + qq
				+ ", jobCode=" + jobCode + ", jobName=" + jobName + ", grade="
				+ grade + ", pnos=" + pnos + ", patients=" + patients + "]";
	}

}
