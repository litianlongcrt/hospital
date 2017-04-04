package crt.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import mysql.crt.com.DBMysql;
import crt.bean.DetailFee;
import crt.bean.Expense;
import crt.bean.Fee;
import crt.bean.Income;
import crt.factory.Factory;

public class FeeDAO {
	public Fee selectMoneyMenu(int pno) {
		DBMysql mysql = null;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Fee fee = null;
		String sql = "select pno,name,FORMAT(sum,2),FORMAT(feeAll,2),FORMAT(jieyu,2) from v_bill where pno=?";
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
				String name = rs.getString(2);
				String jiaofei = rs.getString(3);
				String feiyong = rs.getString(4);
				String jieyu = rs.getString(5);
				fee = new Fee(pno, name, jiaofei, feiyong, jieyu);
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
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
		return fee;
	}

	public List<Fee> selectMoneyMenu() {
		DBMysql mysql = null;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Fee fee = null;
		List<Fee> fees = new ArrayList<Fee>();
		String sql = "select pno,name,FORMAT(sum,2),FORMAT(feeAll,2),FORMAT(jieyu,2) from v_bill";
		mysql = Factory.getInstanceDB();
		conn = mysql.getConn();
		try {
			ps = conn.prepareStatement(sql);
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
				int pno = rs.getInt(1);
				String name = rs.getString(2);
				String jiaofei = rs.getString(3);
				String feiyong = rs.getString(4);
				String jieyu = rs.getString(5);
				fee = new Fee(pno, name, jiaofei, feiyong, jieyu);
				fees.add(fee);
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
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
		return fees;
	}

	public List<Fee> selectFeesNoMoney() {
		List<Fee> feesNoMoney = new ArrayList<Fee>();
		List<Fee> fees = this.selectMoneyMenu();

		Iterator<Fee> it = fees.iterator();
		while (it.hasNext()) {
			Fee tmpFee = it.next();
			if (Double.parseDouble(tmpFee.getJieyu().replaceAll(",", "")) < 0) {
				feesNoMoney.add(tmpFee);
			}
		}
		return feesNoMoney;
	}

	public int addMoneyByPno(int pno, double money) {
		int flag = 0;
		DBMysql mysql = null;
		Connection conn = null;
		PreparedStatement ps = null;
		String sql = "insert into money values(null,?,'住院',now(),?)";
		mysql = Factory.getInstanceDB();
		conn = mysql.getConn();
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, pno);
			ps.setDouble(2, money);
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
		if (ps != null) {
			try {
				ps.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return flag;

	}

	public DetailFee SelectMakeDrugMenu(int pno) {
		List<Expense> expenses = new ArrayList<Expense>();
		List<Income> incomes = new ArrayList<Income>();
		DetailFee df = null;
		DBMysql mysql = null;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select f.pno,f.dno,d.name,f.price,f.cout,f.date,FORMAT(f.hj,2) from fee f, drug d where f.dno=d.dno and f.pno=? and  f.pno in(select pno from bed where pno!=0)";
		mysql = Factory.getInstanceDB();
		conn = mysql.getConn();
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
			while (rs.next()) {
				pno = rs.getInt(1);
				int dno = rs.getInt(2);
				String dname = rs.getString(3);
				double price = rs.getDouble(4);
				int count = rs.getInt(5);
				String date = rs.getString(6);
				String money = rs.getString(7);
				expenses.add(new Expense(pno, dno, dname, price, count, date,
						money));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(rs!=null){
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(ps!=null){
			try {
				ps.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(conn!=null){
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		incomes = selectIncome(pno);
		df = new DetailFee(incomes, expenses);
		return df;
	}
	public List<Income> selectIncome(int pno){
		List<Income> incomes = new ArrayList<Income>();
		DBMysql mysql = null;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		mysql = Factory.getInstanceDB();
		conn = mysql.getConn();		
		String sql = "select m.pno,p.name,m.time,FORMAT(m.fee,2) from money m,patient p where m.pno=? and m.pno=p.pno and m.pno in(select pno from bed where pno!=0)";
		try {
			ps = conn.prepareStatement(sql);
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try {
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
			while(rs.next()){
				pno = rs.getInt(1);
				String pname = rs.getString(2);
				String date = rs.getString(3);
				String money = rs.getString(4);
				incomes.add(new Income(pno,pname, date, money));
			}		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(rs!=null){
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(ps!=null){
			try {
				ps.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(conn!=null){
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
			
		return incomes;
	}
}
