package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class reservationDAO {

	private Connection conn = null;

	public reservationDAO() throws SQLException { // 객체 생성 시 데이터베이스에 연결
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
	
	public void reservation(String name, String phone_number, String date, String reservation_time, int people, String personal_requirement) throws SQLException {
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			String query = "insert into reservation(name, phone_number, date, reservation_time, people, personal_requirement) values ('" + name + "' , '" + phone_number + "' , '" + date + "' , '" + reservation_time + "' , '" + people + "' , '" + personal_requirement + "')"; 
			stmt = conn.createStatement();
			stmt.executeUpdate(query);
		} catch (SQLException ex) {
			System.out.println(ex.getMessage());
		} finally {
			if (stmt != null)
				stmt.close();
		}
	}
	
	public void reservation_table(int id, String name, String phone_number) throws SQLException {
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			String query = "insert into reservation_table(id, name, phone_number) values ('" + id + "' , '" + name + "' , '" + phone_number + "')"; 
			stmt = conn.createStatement();
			stmt.executeUpdate(query);
		} catch (SQLException ex) {
			System.out.println(ex.getMessage());
		} finally {
			if (stmt != null)
				stmt.close();
		}
	}

	public ArrayList<Integer> isTableAlreadyBooked(ArrayList<Integer> table) { // reservationProcess에 사용됨
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean result = false;
		ArrayList<Integer> alreadyBookedTable = new ArrayList<>();

		try {
			for (int i = 0; i < table.size(); i++) {
				String query = "select * from reservation_table where id = ?";
				pstmt = conn.prepareStatement(query);
				pstmt.setInt(1, table.get(i));
				rs = pstmt.executeQuery();
				if (rs.next()) {
					alreadyBookedTable.add(rs.getInt(1));
				}
				return alreadyBookedTable;
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
		return alreadyBookedTable;
	}
}
