package crt.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import mysql.crt.com.DBMysql;
import crt.bean.Patient;
import crt.bean.Staff;
import crt.factory.Factory;

public class PatientDAO {
	Staff staff = null;
	DBMysql mysql =null;
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	public Patient selectByPno(int pno){
		Patient patient =null;
		mysql = Factory.getInstanceDB();
		conn = mysql.getConn();
		String sql = "select * from patient where pno=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, pno);			
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
				String name = rs.getString(2);
				String sex = rs.getString(3);
				int age = rs.getInt(4);
				String address = rs.getString(5);
				String tel = rs.getString(6);
				String bing = rs.getString(7);
				String time = rs.getString(8);
				int bed = rs.getInt(9);
				String desc = rs.getString(10);
				patient = new Patient(pno, name, sex, age, address, tel, bing, time, bed);	
				patient.setDesc(desc);
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
		mysql.myConnClose(conn);
		return patient;
	}
	
	public int updateDesc(Patient patient){
		int flag = 0;
		mysql = Factory.getInstanceDB();
		conn = mysql.getConn();
		String sql = "update patient set _desc=? where pno=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, patient.getDesc());
			ps.setInt(2, patient.getPno());	
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			flag = ps.executeUpdate();
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
		mysql.myConnClose(conn);
		return flag;
	}
	
	
}
