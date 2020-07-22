package RoomRates;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import Branches.Branch;
import block_Register.block;
import connections.DBConnection;

public class RoomRatesDAO {

	
	 
	 public static String getRoomTypeID(String RoomID) {

			String status = "";

			block r = new block();

			try {
				Connection con = DBConnection.getConnection();

				PreparedStatement ps = con.prepareStatement("SELECT RoomTypeName FROM ceybank_rest.roomtypes where roomTypeId=?;");

				ps.setString(1, RoomID);
				//System.out.println("******************************Room type ID : " + RoomID);
				ResultSet rs = ps.executeQuery();
				if (rs.next()) {

					
r.setBlock_name(rs.getString(1));
					status = rs.getString(1);
				//	System.out.println("******************************Room type name : " + rs.getString(1));

				}
				con.close();
			} catch (Exception ex) {
				ex.printStackTrace();
			}

			return status;
		}
	
}
