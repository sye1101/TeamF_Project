package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

public class tableDAO {
	
	private Connection conn = null;

	public tableDAO() throws SQLException { // 객체 생성 시 데이터베이스에 연결
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
	
	public boolean isCoverBiggerThanTable(int cover, ArrayList<Integer> table) { // 로그인
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean result = false;
		int table_cover = 0;

		try {
			for (int i = 0; i < table.size(); i++) {
				String query = "select people from _table where id = ?";
				pstmt = conn.prepareStatement(query);
				pstmt.setInt(1, table.get(i));
				rs = pstmt.executeQuery();
				if (rs.next()) {
					table_cover += rs.getInt(1);
				}
			}
			System.out.println(cover + " " + table_cover);
			if (cover > table_cover)
				return true;
			else
				return false;
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
		return true;
	}
}
