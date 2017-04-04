package crt.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import mysql.crt.com.DBMysql;
import crt.bean.MakeDrug;
import crt.factory.Factory;

public class DoctorDAO {
	
	public List<MakeDrug> selectMakeDrugByPnoAndDate(int pno, String useDrugDate) {
		DBMysql mysql = null;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<MakeDrug> mds = new ArrayList<MakeDrug>();
		String sql = "select m.*,d.name from makedrug m,drug d where m.dno=d.dno and pno=? and useDrugDate=?";
		mysql = Factory.getInstanceDB();
		conn = mysql.getConn();
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, pno);
			ps.setString(2, useDrugDate);
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
			while(rs.next()){
				int mdid = rs.getInt(1);
				int dno = rs.getInt(3);
				int sno = rs.getInt(4);
				int count = rs.getInt(5);
				String makeDrugDate = rs.getString(6);
				String send = rs.getString(8);
				String dname = rs.getString(9);
				MakeDrug md = new MakeDrug(mdid, pno, dno, sno, count, 
						makeDrugDate, useDrugDate, send);
				md.setDname(dname);
				mds.add(md);
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

		return mds;
	}
	
	public int addPatientByPno(int sno, int pno) {
		DBMysql mysql = null;
		Connection conn = null;
		PreparedStatement ps = null;
		int flag = 0;
		String sql = "insert into doctor values(null,?,?)";
		mysql = Factory.getInstanceDB();
		conn = mysql.getConn();
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, sno);
			ps.setInt(2, pno);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(sql);
		try {
			flag = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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

		return flag;
	}

	public int selectPatientCountByPno(int pno) {
		DBMysql mysql = null;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int flag = 0;
		String sql = "select count(1) from doctor where pno=?";
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
			if (rs.next()) {
				flag = rs.getInt(1);
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		if (rs != null) {
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
		return flag;
	}
	
	public int selectPatientBySnoAddPno(int sno, int pno) {
		DBMysql mysql = null;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int flag = 0;
		String sql = "select * from doctor where sno=? and pno=?";
		mysql = Factory.getInstanceDB();
		conn = mysql.getConn();
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, sno);
			ps.setInt(2, pno);
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
			if (rs.next()) {
				flag = 1;
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		if (rs != null) {
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
		return flag;
	}

	public int makeDrug(MakeDrug md) {
		DBMysql mysql = null;
		Connection conn = null;
		PreparedStatement ps = null;
		int flag = 0;
		String sql = "insert into makedrug values(null,?,?,?,?,now(),?,'否')";
		mysql = Factory.getInstanceDB();
		conn = mysql.getConn();
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, md.getPno());
			ps.setInt(2, md.getDno());
			ps.setInt(3, md.getSno());
			ps.setInt(4, md.getCount());
			ps.setString(5, md.getUseDrugDate());
			flag = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			if (ps != null)
				ps.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		try {
			if (conn != null)
				conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}
	public int addDrugs(List<MakeDrug> mds){
		int flag = 0;
		Iterator<MakeDrug> it = mds.iterator();
		while(it.hasNext()){
			flag = 1;
			MakeDrug md = it.next();
			flag = makeDrug(md);
			if(flag == 0) 
				return 0;
		}
		return flag;
	}
}
