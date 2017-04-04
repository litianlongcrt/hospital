package crt.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import mysql.crt.com.DBMysql;
import crt.bean.BingLi;
import crt.factory.Factory;

public class BingAnShiDAO {
	public BingLi selectFeeAllAndDesc(int pno){
		DBMysql mysql = null;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		BingLi bl = null;
		String sql = "select p.pno,p.name,p.sex,p.age,bing,format(feeAll,2),_desc from patient p,v_bill vb where p.pno=? and vb.pno=p.pno";
		mysql = Factory.getInstanceDB();
		conn = mysql.getConn();
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, pno);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(sql);
		try {
			rs = ps.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			if(rs.next()){
				pno = rs.getInt(1);
				String name = rs.getString(2);
				String sex = rs.getString(3);
				int age = rs.getInt(4);
				String bing = rs.getString(5);
				String money = rs.getString(6);
				String desc = rs.getString(7);				
				bl = new BingLi(pno, name, sex, age, bing, money, desc);				
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		if(rs!=null){
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		if (ps != null) {
			try {
				ps.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if (conn != null) {
			mysql.myConnClose(conn);
		}

		return bl;
		
	}
}
