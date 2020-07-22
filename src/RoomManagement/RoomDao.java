package RoomManagement;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import connections.DBConnection;

public class RoomDao {

	public static int update(Room e) {
		int status = 0;

		try {

			Connection con = DBConnection.getConnection();
			System.out.println("Printing connection object " + con);

			String query = "update rooms set roomNo=?,roomName=?,roomType=?,blockID=? where id=?";

			PreparedStatement ps = con.prepareStatement(query);

			System.out.println("ps edit ::: " + ps);

			ps.setString(1, e.getRoomNo());
			ps.setString(2, e.getRoomName());
			ps.setInt(3, e.getRoomType());
			ps.setInt(4, e.getBlockID());
			ps.setInt(5, e.getId());

			status = ps.executeUpdate();

			System.out.println(status);

			con.close();

		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return status;
	}

	public static Room getRoomById(String sid) {
		Room e = new Room();

		try {
			Connection con = DBConnection.getConnection();

			PreparedStatement ps = con.prepareStatement("select * from rooms where id=? ORDER BY roomNo ASC;");
			ps.setString(1, sid);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {

				e.setRoomNo(rs.getString(2));
				e.setRoomName(rs.getString(3));
				e.setRoomType(rs.getInt(4));
				e.setBlockID(rs.getInt(5));

				e.setId(rs.getInt(1));

				if (rs.getString(6).equals("Available")) {

					e.setRoomStatus("Available");

				} else if (rs.getString(6).equals("Maintenance")) {

					e.setRoomStatus("Maintenance");

				} else if (rs.getString(6).equals("Cleaning")) {

					e.setRoomStatus("Cleaning");

				} else if (rs.getString(6).equals("Reserved")) {

					e.setRoomStatus("Reserved");

				} else if (rs.getString(6).equals("Occupied")) {

					e.setRoomStatus("Occupied");

				}
				con.close();
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return e;
	}

	public static List<Room> getAllRooms() {
		List<Room> list = new ArrayList<Room>();

		try {
			Connection con = DBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("select * from rooms ORDER BY roomNo ASC;");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Room e = new Room();

				e.setRoomNo(rs.getString(2));
				e.setRoomName(rs.getString(3));
				e.setRoomType(rs.getInt(4));
				e.setBlockID(rs.getInt(5));
				e.setId(rs.getInt(1));

				list.add(e);
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public static int save(Room e) {
		int status = 0;
		try {
			Connection con = DBConnection.getConnection();
			PreparedStatement ps = con
					.prepareStatement("insert into rooms(roomNo,roomName,roomType,blockID,Status) values (?,?,?,?,?)");
			ps.setString(1, e.getRoomNo());
			ps.setString(2, e.getRoomName());
			ps.setInt(3, e.getRoomType());
			ps.setInt(4, e.getBlockID());
			ps.setString(5, e.getRoomStatus());

			status = ps.executeUpdate();

			con.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return status;
	}

	public static int delete(int id) {
		int status = 0;
		try {
			Connection con = DBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("delete from rooms where id=?");
			ps.setInt(1, id);
			status = ps.executeUpdate();

			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return status;
	}

	public static Room getRoomByBlock(String sid) {
		Room e = new Room();

		try {
			Connection con = DBConnection.getConnection();

			PreparedStatement ps = con.prepareStatement("select * from rooms where blockID=? ORDER BY roomNo ASC;");
			ps.setString(1, sid);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {

				e.setRoomNo(rs.getString(2));
				e.setRoomName(rs.getString(3));
				e.setRoomType(rs.getInt(4));
				e.setBlockID(rs.getInt(5));
				e.setId(rs.getInt(1));

			}
			con.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return e;
	}

	public static int updateStatus(Room e) {
		int status = 0;


		try {

			Connection con = DBConnection.getConnection();
			System.out.println("Printing connection object " + con);

			String query = "update rooms set Status=? where id=?";

			PreparedStatement ps = con.prepareStatement(query);

			ps.setString(1, e.getRoomStatus());
			ps.setInt(2, e.getId());


			System.out.println("PreparedStatement ::: " + ps);
			
			status = ps.executeUpdate();

			System.out.println("Update Status ::: " + status);

			con.close();

		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return status;
	}

}
