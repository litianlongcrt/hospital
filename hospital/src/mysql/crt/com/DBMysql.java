package mysql.crt.com;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
public class DBMysql {
	private String driverName = "com.mysql.jdbc.Driver";//加载驱动
	private String databaseName = "hospital";//数据库
    private String url = "jdbc:mysql://localhost:3306/"+databaseName+"?characterEncoding=utf-8";//URL
    private String user = "root";//用户名
    private String password = "tiger";//密码
    
    public DBMysql() {	
    	try {
			Class.forName(driverName);
		} catch (Exception e) {
			System.out.println("加载数据库失败！");
			e.printStackTrace();
		}
    }
    
    public Connection getConn(){ 	
    	Connection conn =null;
    	try {
			conn = DriverManager.getConnection(url,user,password);
		} catch (SQLException e) {
			System.out.println("链接数据库失败！");
			e.printStackTrace();
		}
    	return conn;
    }
    
    public void myConnClose(Connection conn){
    
    	try {
    		if(conn!=null){
    			conn.close();
    			System.out.println("数据库关闭成功！");
    			conn = null;
    		}
		} catch (SQLException e) {
			e.printStackTrace();
		}
    }
 
}
