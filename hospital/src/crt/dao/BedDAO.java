package crt.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import mysql.crt.com.DBMysql;
import crt.bean.Staff;
import crt.factory.Factory;

public class BedDAO {
	Staff staff = null;
	DBMysql mysql =null;
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	//1、设置bed表中字段pno=0为出院
	public int updatePatientOutByPno(int pno){		
		int flag = 0;		
		mysql = Factory.getInstanceDB();
		conn = mysql.getConn();		
		String sql = "update bed set pno=0 where pno=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1,pno);			
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
