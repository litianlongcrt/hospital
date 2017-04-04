package crt.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import mysql.crt.com.DBMysql;
import crt.bean.Patient;
import crt.factory.Factory;

public class HuShiDAO {
	DBMysql mysql = null;
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	/*public List<Patient> byPnos(List<Integer> pnos) {
		List<Patient> patients = new ArrayList<Patient>();
		if (pnos.size() != 0) {
			StringBuffer in = new StringBuffer();
			for (int i = 0; i < pnos.size() - 1; i++) {
				in.append("?,");
			}
			in.append("?");
			String sql = "select * from patient where pno in (" + in.toString()
					+ ") and _out=0";
			System.out.println(sql);
			try {
				ps = conn.prepareStatement(sql);
				for (int i = 0; i < pnos.size(); i++) {
					ps.setInt(i + 1, pnos.get(i));
				}

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
				while (rs.next()) {
					int pno = rs.getInt(1);
					String name = rs.getString(2);
					String sex = rs.getString(3);
					int age = rs.getInt(4);
					String address = rs.getString(5);
					String tel = rs.getString(6);
					String bing = rs.getString(7);
					String time = rs.getString(8);
					int bed = rs.getInt(9);
					Patient patient = new Patient(pno, name, sex, age, address,
							tel, bing, time, bed);
					patients.add(patient);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			try {
				if ((rs != null))
					rs.close();
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
			mysql.myConnClose(conn);
		}

		return patients;
	}
*/
	/*// 不能单独使用 需要联合别的函数一起使用
	public List<Integer> getAllPno() {
		List<Integer> pnos = new ArrayList<Integer>();
		String sql = "select * from bed where pno!=?";
		mysql = Factory.getInstanceDB();
		conn = mysql.getConn();
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, 0);
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
			while (rs.next()) {
				int pno = rs.getInt(2);
				pnos.add(pno);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return pnos;
	}*/

	// 添加一个病人 需要修改三个表 petient bed doctor
	public int addPatient(Patient patient,int sno) {
		int flag = 0;
		String sql = "insert into patient values(null,?,?,?,?,?,?,?,?,null)";
		mysql = Factory.getInstanceDB();
		conn = mysql.getConn();
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, patient.getName());
			ps.setString(2, patient.getSex());
			ps.setInt(3, patient.getAge());
			ps.setString(4, patient.getAddress());
			ps.setString(5, patient.getTel());
			ps.setString(6, patient.getBing());
			ps.setString(7, patient.getTime());
			ps.setInt(8, patient.getBed());
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
		if(flag!=0){
			addToDoctor(sno,maxPno());
			//触发器能够自动更新
			//updateBed(patient.getBed(),maxPno());
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
	
	public void addToDoctor(int sno,int pno){
		String sql = "insert into doctor values(null,?,?)";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, sno);
			ps.setInt(2, pno);
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}									
	}
	public int updateBed(int bno,int pno){
		String sql = "update bed set pno=? where bno=?";
		int f = 0;
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, pno);
			ps.setInt(2, bno);
			f = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return f;
	}	
	public int maxPno(){
		int max = 0;
		String sql = "select MAX(pno) from patient";
		try {
			ps = conn.prepareStatement(sql);
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
				max = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return max;
	}
	
	public List<Integer> getAllEmptyBed() {
		List<Integer> bnos = new ArrayList<Integer>();
		mysql = Factory.getInstanceDB();
		conn = mysql.getConn();
		String sql = "select bno from bed where pno=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, 0);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			rs = ps.executeQuery();
			while(rs.next()){
				bnos.add(rs.getInt(1));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			if(rs!=null)
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			if(conn!=null)
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return bnos;
	}

}
