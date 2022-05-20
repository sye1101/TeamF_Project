package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import dto.User;

public class userDAO {

	private Connection conn = null;

	public userDAO() throws SQLException { // 객체 생성 시 데이터베이스에 연결
		try {
			String url = "jdbc:mysql://localhost:3306/RestaurantDB?autoReconnect=true";
			String user = "root";
			String password = "비밀번호";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public User getUser(String id) {
		Statement stmt = null;
		ResultSet rs = null;
		User user = new User();
		
		try {
			String query = "select * from user where id = '" + id + "'";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);
			if (rs.next()) {
				user.setId(rs.getString("id"));
				user.setPassword(rs.getString("password"));
				user.setName(rs.getString("name"));
				user.setPhone_number(rs.getString("phone_number"));
			}
			return user;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (stmt != null)
					stmt.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}

		return null;
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
	
	public boolean isExistNullField(String id, String pw) {
		if ((id.trim().equals("") || id == null) || (pw.trim().equals("") || pw == null)) {
			return true;
		} else return false;
	}

}
