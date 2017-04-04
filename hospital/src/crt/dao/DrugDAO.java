package crt.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import mysql.crt.com.DBMysql;
import crt.bean.MakeDrug;
import crt.factory.Factory;

public class DrugDAO {
	// select * from makedrug where useDrugDate='2017-02-18' and send='否' order
	// by pno
	// 查询给定时间的未送药品
	public List<MakeDrug> selectMakeDrugByPnoAndDate(int pno, String useDrugDate) {
		DBMysql mysql = null;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<MakeDrug> mds = new ArrayList<MakeDrug>();
		String sql = "select m.*,p.name,d.name from makedrug m,patient p,drug d where d.dno=m.dno and m.pno=? and m.pno=p.pno and useDrugDate=? and send='否'";
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
			while (rs.next()) {
				int mdid = rs.getInt(1);
				int dno = rs.getInt(3);
				int sno = rs.getInt(4);
				int count = rs.getInt(5);
				String makeDrugDate = rs.getString(6);
				String send = rs.getString(8);
				String pname = rs.getString(9);
				String dname = rs.getString(10);
				MakeDrug md = new MakeDrug(mdid, pno, dno, sno, count,
						makeDrugDate, useDrugDate, send);
				md.setPname(pname);
				md.setDname(dname);
				mds.add(md);
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

		return mds;
	}

	public List<MakeDrug> selectMakeDrugByDate(String useDrugDate) {
		DBMysql mysql = null;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<MakeDrug> mds = new ArrayList<MakeDrug>();
		String sql = "select m.*,p.name,d.name from makedrug m,patient p,drug d where d.dno=m.dno and m.pno=p.pno and useDrugDate=? and send='否' order by pno";
		mysql = Factory.getInstanceDB();
		conn = mysql.getConn();
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, useDrugDate);
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
			while (rs.next()) {
				int mdid = rs.getInt(1);
				int pno = rs.getInt(2);
				int dno = rs.getInt(3);
				int sno = rs.getInt(4);
				int count = rs.getInt(5);
				String makeDrugDate = rs.getString(6);
				String send = rs.getString(8);
				String pname = rs.getString(9);
				String dname = rs.getString(10);
				MakeDrug md = new MakeDrug(mdid, pno, dno, sno, count,
						makeDrugDate, useDrugDate, send);
				md.setPname(pname);
				md.setDname(dname);
				mds.add(md);
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

		return mds;
	}
	
	public List<MakeDrug> selectMakeDrugNoSend() {
		DBMysql mysql = null;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<MakeDrug> mds = new ArrayList<MakeDrug>();
		String sql = "select m.*,p.name,d.name from makedrug m,patient p,drug d where d.dno=m.dno and m.pno=p.pno and send=? order by pno";
		mysql = Factory.getInstanceDB();
		conn = mysql.getConn();
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, "否");
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
			while (rs.next()) {
				int mdid = rs.getInt(1);
				int pno = rs.getInt(2);
				int dno = rs.getInt(3);
				int sno = rs.getInt(4);
				int count = rs.getInt(5);
				String makeDrugDate = rs.getString(6);
				String useDrugDate = rs.getString(7);
				String send = rs.getString(8);
				String pname = rs.getString(9);
				String dname = rs.getString(10);
				MakeDrug md = new MakeDrug(mdid, pno, dno, sno, count,
						makeDrugDate, useDrugDate, send);
				md.setPname(pname);
				md.setDname(dname);
				mds.add(md);
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

		return mds;
	}

	public int sendDrugByMDId(int mdid) {
		DBMysql mysql = null;
		Connection conn = null;
		PreparedStatement ps = null;
		int flag = 0;
		String sql = "update makedrug set send='是' where id=?";
		mysql = Factory.getInstanceDB();
		conn = mysql.getConn();
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, mdid);
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

	public int sendDrugsByMDIds(List<Integer> mdids) {
		DBMysql mysql = null;
		Connection conn = null;
		PreparedStatement ps = null;
		int flag = 0;

		if (mdids.size() != 0) {
			StringBuffer in = new StringBuffer();
			for (int i = 0; i < mdids.size() - 1; i++) {
				in.append("?,");
			}
			in.append("?");
			String sql = "update makedrug set send='是' where id in("
					+ in.toString() + ")";

			mysql = Factory.getInstanceDB();
			conn = mysql.getConn();
			try {
				ps = conn.prepareStatement(sql);
				for (int i = 0; i < mdids.size(); i++) {
					ps.setInt(i + 1, mdids.get(i));
				}
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
}
