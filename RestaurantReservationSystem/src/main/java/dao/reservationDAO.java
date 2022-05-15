package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Arrays;

import dto.Reservation;

public class reservationDAO {

	private Connection conn = null;

	public reservationDAO() throws SQLException { // 객체 생성 시 데이터베이스에 연결
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

	public ArrayList<ArrayList<String>> getAllMyReservations(String name, String phone_number) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<ArrayList<String>> reservation_data = new ArrayList<ArrayList<String>>();
		try {
			String query1 = "select id, date from reservation where name = ? and phone_number = ?";
			pstmt = conn.prepareStatement(query1);
			pstmt.setString(1, name);
			pstmt.setString(2, phone_number);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				// 예약 번호, 예약 날짜
				reservation_data.add(new ArrayList<String>(Arrays.asList(Integer.toString(rs.getInt(1)), rs.getString(2))));
			}
		} catch (SQLException ex) {
			System.out.println(ex.getMessage());
		} finally {
			if (pstmt != null)
				pstmt.close();
		}
		return reservation_data;
	}

	public ArrayList<String> getOneReservation(int reservation_id) throws SQLException {
		Statement stmt1 = null;
		Statement stmt2 = null;
		ResultSet rs = null;
		ArrayList<String> reservationData = new ArrayList<>();
		String tables = "";
		String[] dateAndTime = new String[4]; // 날짜랑 시간 통합해서 다시 분리하기 위함
		Reservation res = new Reservation();
		
		try {
			String query1 = "select * from reservation where id = '" + reservation_id + "'";
			stmt1 = conn.createStatement();
			rs = stmt1.executeQuery(query1);
			
			if (rs.next()) {
				res.setId(rs.getInt("id"));
				res.setName(rs.getString("name"));
				res.setPhone_number(rs.getString("phone_number"));
				res.setDate(rs.getString("date"));
				res.setPeople(rs.getInt("people"));
				res.setPersonal_requirement(rs.getString("personal_requirement"));
			}
			
			String query2 = "select table_id from reservation_table where reservation_id = '" + reservation_id + "'";
			stmt2 = conn.createStatement();
			rs = stmt2.executeQuery(query2);
			
			while (rs.next()) {
				tables += Integer.toString(rs.getInt(1)) + "번 ";
			}
			
			dateAndTime = res.getDate().split("\\s"); // 공백 기준으로 날짜랑 시간 분리
			
			reservationData.add(Integer.toString(res.getId()));
			reservationData.add(res.getName());
			reservationData.add(res.getPhone_number());
			reservationData.add(Integer.toString(res.getPeople()));
			reservationData.add(dateAndTime[0]);
			reservationData.add(dateAndTime[1] + " " + dateAndTime[2] + " " + dateAndTime[3]);
			reservationData.add(tables);
			reservationData.add(res.getPersonal_requirement());
			
			System.out.println(reservationData.toArray().toString());
			
			return reservationData;
			
		} catch (SQLException ex) {
			System.out.println(ex.getMessage());
		} finally {
			if (stmt1 != null)
				stmt1.close();
			if (stmt2 != null)
				stmt2.close();
		}
		return null;
	}

	public void deleteReservation(int reservation_id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			// reservation_table의 필드는 외래키 제약 조건으로 예약이 삭제되면 같이 삭제된다.
			String query = "delete from reservation where id = ?";
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, reservation_id);
			pstmt.executeUpdate();
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
	}

	// 예약
	public void reservation(String name, String phone_number, String date, int people, String personal_requirement)
			throws SQLException {
		Statement stmt = null;
		try {
			String query = "insert into reservation(name, phone_number, date, people, personal_requirement) values ('"
					+ name + "' , '" + phone_number + "' , '" + date + "' , '" + people + "' , '" + personal_requirement
					+ "')";
			stmt = conn.createStatement();
			stmt.executeUpdate(query);
		} catch (SQLException ex) {
			System.out.println(ex.getMessage());
		} finally {
			if (stmt != null)
				stmt.close();
		}
	}

	public int getReservationId(String name, String phone_number, String date) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String query = "select id from reservation where name = ? and phone_number = ? and date = ?";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, name);
			pstmt.setString(2, phone_number);
			pstmt.setString(3, date);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1);
			} else
				return -1;
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
		return -1;
	}

	// 테이블 예약 (다중 예약이 필요하므로 별도의 메서드 작성)
	public void reservation_table(int table_id, int reservation_id, String date) throws SQLException {
		Statement stmt = null;
		try {
			String query = "insert into reservation_table(table_id, reservation_id, date) values ('" + table_id + "' , '" + reservation_id + "' , '" + date + "')";
			stmt = conn.createStatement();
			stmt.executeUpdate(query);
		} catch (SQLException ex) {
			System.out.println(ex.getMessage());
		} finally {
			if (stmt != null)
				stmt.close();
		}
	}

	// 같은 시간에 예약된 테이블 목록이 있는지 검사
	public ArrayList<Integer> getAlreadyBookedTable(ArrayList<Integer> table, String date) { // reservationProcess에 사용됨
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Integer> alreadyBookedTable = new ArrayList<>();

		try {
			for (int i = 0; i < table.size(); i++) { // 테이블, 날짜, 시간 전부 가져와서 비교해야 함
				String query = "select * from reservation_table where table_id = ? and date = ?";
				pstmt = conn.prepareStatement(query);
				pstmt.setInt(1, table.get(i));
				pstmt.setString(2, date);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					alreadyBookedTable.add(rs.getInt(1));
				}
				System.out.println("이미 예약된 테이블 : " + Arrays.toString(alreadyBookedTable.toArray()));
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
