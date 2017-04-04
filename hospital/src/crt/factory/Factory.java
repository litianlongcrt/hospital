package crt.factory;

import mysql.crt.com.DBMysql;

public class Factory {
	public static DBMysql getInstanceDB(){
		return new DBMysql();
	}
}
