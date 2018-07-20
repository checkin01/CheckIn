package utility;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBConnection {
	/*
	 * 드라이브 로딩
	 * PreparedStatement 생성
	 * excute, update
	 * closing
	 * */
	private final String id = "DBConnection....";
	private final String url = "jdbc:oracle:thin:@172.16.2.20:1521:GOOTTDB";
	private final String user="checkin01";
	private final String password ="123456";
	protected Connection conn = null;
	protected PreparedStatement psmt = null;
	protected ResultSet rs = null;
	
	static {
		try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		}catch(ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public Connection getConn(String sql) {
		try {
			conn = DriverManager.getConnection(url, user, password);
			psmt = conn.prepareStatement(sql);
		}catch(SQLException e) {
			System.out.println(id+"getConn()");
			e.printStackTrace();
		}
		
		return conn;
	}
	
	public void dbClose() {
		try {
			if(rs!=null) if(!rs.isClosed()) rs.close();
			if(psmt!=null) if(!psmt.isClosed()) psmt.close();
			if(conn!=null) if(!conn.isClosed()) conn.close();
			
		}catch(SQLException e) {
			System.out.println(id+"dbClose()");
			e.printStackTrace();
		}
	}
}
