package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class adminDAO {

	private Connection conn = null;

	public adminDAO() throws SQLException { // 객체 생성 시 데이터베이스에 연결
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

	// 모든 예약 현황
	public ArrayList<ArrayList<String>> getAllReservations() throws SQLException {
		Statement stmt = null;
		ResultSet rs = null;
		reservationDAO dao = new reservationDAO();
		ArrayList<ArrayList<String>> result = new ArrayList<ArrayList<String>>();
		try {
			String query = "select * from reservation";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);
			while (rs.next()) {
				ArrayList<String> reservation = new ArrayList<String>();
				reservation.add(Integer.toString(rs.getInt("id")));
				reservation.add(rs.getString("name"));
				reservation.add(rs.getString("phone_number"));
				reservation.add(rs.getString("date"));
				reservation.add(Integer.toString(rs.getInt("people")));
				reservation.add(rs.getString("personal_requirement"));
				
				ArrayList<String> oneRes = dao.getOneReservation(rs.getInt("id")); // 아이디로 테이블 정보 받아오기
				reservation.add(oneRes.get(6)); // 테이블 컬럼
				result.add(reservation);
			}
			return result;
		} catch (SQLException ex) {
			System.out.println(ex.getMessage());
		} finally {
			if (stmt != null)
				stmt.close();
			if (rs != null)
				rs.close();
		}
		return result;
	}

	// 관리자가 예약 검색
	public ArrayList<ArrayList<String>> getAllReservationsFromColumnName(String columnName, String value)
			throws SQLException {
		Statement stmt = null;
		ResultSet rs = null;
		reservationDAO dao = new reservationDAO();
		ArrayList<ArrayList<String>> result = new ArrayList<ArrayList<String>>();
		try {
			String query = "select * from reservation where " + columnName + "=" + "'" + value + "'";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);
			while (rs.next()) {
				ArrayList<String> reservation = new ArrayList<String>();
				reservation.add(Integer.toString(rs.getInt("id")));
				reservation.add(rs.getString("name"));
				reservation.add(rs.getString("phone_number"));
				reservation.add(rs.getString("date"));
				reservation.add(Integer.toString(rs.getInt("people")));
				reservation.add(rs.getString("personal_requirement"));
				
				ArrayList<String> oneRes = dao.getOneReservation(rs.getInt("id")); // 아이디로 테이블 정보 받아오기
				reservation.add(oneRes.get(6)); // 테이블 컬럼
				result.add(reservation);
			}
			return result;
		} catch (SQLException ex) {
			System.out.println(ex.getMessage());
		} finally {
			if (stmt != null)
				stmt.close();
			if (rs != null)
				rs.close();
		}
		return result;
	}
}
