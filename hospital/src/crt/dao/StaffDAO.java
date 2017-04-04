package crt.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import mysql.crt.com.DBMysql;
import crt.bean.Patient;
import crt.bean.Staff;
import crt.factory.Factory;

public class StaffDAO {
	Staff staff = null;
	DBMysql mysql =null;
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	public List<Patient> selectPatientsBySno(int sno){
		List<Patient> patients = new ArrayList<Patient>();
			String sql = "select * from patient where pno in( select pno from doctor where sno=? and pno in(select pno from bed where pno!=0)) order by bed asc";
			System.out.println(sql);
			try {
				ps = conn.prepareStatement(sql);
				ps.setInt(1, sno);
							
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			try {
				rs = ps.executeQuery();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			try {
				while(rs.next()){
					int pno = rs.getInt(1);
					String name = rs.getString(2);
					String sex = rs.getString(3);
					int age = rs.getInt(4);
					String address = rs.getString(5);
					String tel = rs.getString(6);
					String bing = rs.getString(7);
					String time = rs.getString(8);
					int bed = rs.getInt(9);	
					Patient patient = new Patient(pno, name, sex, age, address, tel, bing, time, bed);
					patients.add(patient);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	
		
		return patients;
	}
	
	public Staff selectOne(Staff staff1){				
		mysql = Factory.getInstanceDB();
		conn = mysql.getConn();
		String sql ="select s.*,j.name,j.grade from staff s,job j where s.job_code=j.code and sno=? and password=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, staff1.getSno());
			ps.setString(2, staff1.getPwd());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			rs = ps.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			if(rs.next()){
				int id = rs.getInt(1);
				int sno = rs.getInt(2);
				String name = rs.getString(3);
				String pwd = rs.getString(4);
				String sex = rs.getString(5);
				String tel = rs.getString(6);
				String qq = rs.getString(7);
				String job_code = rs.getString(8);
				String job_name = rs.getString("j.name");
				String job_grade = rs.getString("j.grade");
				
				
				staff = new Staff(id, sno, name, pwd, sex, tel, qq, job_code);				
				staff.setJobName(job_name);
				staff.setGrade(job_grade);
				List<Patient> patients = selectPatientsBySno(staff.getSno());
				staff.setPatients(patients);			
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		try {
			if((rs!=null))
				rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			if(ps!=null)
				ps.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		try {
			if(conn!=null){
				mysql.myConnClose(conn);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
						
		return staff;
		
	}
	
	public int add(Staff staff){
		return 0;
	}
}
