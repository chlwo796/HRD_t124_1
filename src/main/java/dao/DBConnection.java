package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBConnection {
	public static Connection getConnection() throws Exception {
		String url = "jdbc:oracle:thin:@//localhost:1521/xe";
		String user = "system";
		String pwd = "1234";

		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection(url, user, pwd);
		return con;
	}

	public static void getClose(Connection con, PreparedStatement pstmt){
		
			try {
				if (pstmt != null) pstmt.close();
				if (con != null) con.close();
			} catch (SQLException e) {
				// 코딩 시는 확인 위해 사용하지만 코딩 배포시에는 반드시 주석처리 또는 제거
				e.printStackTrace();
				System.out.println();
			}
		
			
	}

	public static void getClose(Connection con, PreparedStatement pstmt, ResultSet rs) throws Exception {
		if (rs != null)
			rs.close();
		if (pstmt != null)
			pstmt.close();
		if (con != null)
			con.close();
	}
}