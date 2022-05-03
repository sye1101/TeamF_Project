package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class userDAO {

	private Connection conn = null;

	public userDAO() throws SQLException { // 객체 생성 시 데이터베이스에 연결
		try {
			String url = "jdbc:mysql://localhost:3306/RestaurantDB?autoReconnect=true";
			String user = "root";
			String password = "skfvkfl2004!";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public int login(String Id, String Password) { // 로그인
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String query = "select password from user where id = ?";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, Id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if(rs.getString(1).equals(Password))
					return 1; // 로그인 성공
				else
					return 0; // 비밀번호 틀림
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}

		return -1; // db 오류
	}

	public int existId(String id) { // 존재하는 아이디인지 검사

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String query = "select id from user where id = ?";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next())
				return 1; // 아이디 존재
			else
				return 0; // 아이디 부재

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}

		return -1; // db 오류
	}
}
