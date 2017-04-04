package mysql.crt.com;

import java.sql.*;

public class Test {

	public static void main(String[] args) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from staff";


		DBMysql db = new DBMysql();
		conn = db.getConn();
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		try {
			while (rs.next()){
				String id = rs.getString(1);
				String sno = rs.getString(2);
				String name = rs.getString(3);
				String password = rs.getString(4);		
				System.out.print(id+"\t");
				System.out.print(sno+"\t");
				System.out.print(name+"\t\t");
				System.out.print(password+"\t");	
				System.out.print(rs.getString(5)+"\t");
				System.out.print(rs.getString(6)+"\t");
				System.out.print(rs.getString(7)+"\t");
				System.out.println(rs.getString(8));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		try {
			rs.close();
			stmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		db.myConnClose(conn);
	}
}
