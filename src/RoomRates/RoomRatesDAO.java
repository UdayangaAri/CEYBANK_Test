package RoomRates;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Branches.Branch;
import Functions.Functions;
import Roles.Role;
import RoomTypeMaster.Room_type;
import block_Register.block;
import connections.DBConnection;

public class RoomRatesDAO {

	public static int getRoomTypeID(String roomTypeID) {

		int status = 0;

		Room_type r = new Room_type();

		try {
			Connection con = DBConnection.getConnection();

			PreparedStatement ps = con.prepareStatement("SELECT roomTypeId FROM roomtypes where RoomTypeName=?;");

			ps.setString(1, roomTypeID);
			// System.out.println("******************************branchID : " + blockID);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {

				r.setId(rs.getInt(1));
				status = rs.getInt(1);
				// System.out.println("****************************** name : " +
				// rs.getString(1));

			}
			con.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return status;
	}

	public static String getRoomTypeName(String RoomName) {

		String status = "";

		Room_type r = new Room_type();

		try {
			Connection con = DBConnection.getConnection();

			PreparedStatement ps = con.prepareStatement("SELECT RoomTypeName FROM roomtypes where roomTypeId=?;");

			ps.setString(1, RoomName);
			// System.out.println("******************************Room type ID : " +
			// RoomName);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {

				r.setRoom_Type(rs.getString(1));
				status = rs.getString(1);
				// System.out.println("******************************Room type name : " +
				// rs.getString(1));

			}
			con.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return status;
	}

	public static String getBlockName(String blockID) {

		String status = "";

		block r = new block();

		try {
			Connection con = DBConnection.getConnection();

			PreparedStatement ps = con.prepareStatement("SELECT block_name FROM block where blockID=?;");

			ps.setString(1, blockID);

			ResultSet rs = ps.executeQuery();
			if (rs.next()) {

				r.setBlock_name(rs.getString(1));
				status = rs.getString(1);
				// System.out.println("22222222222222222222222222222222");
				// System.out.println("****************************** branchname : " +
				// rs.getString(1));

			}
			con.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return status;
	}

	public static String getBranchName(String branchID) {

		String status = "";

		Branch r = new Branch();

		try {
			Connection con = DBConnection.getConnection();

			PreparedStatement ps = con.prepareStatement("SELECT B_display_name FROM branches where id=?;");

			ps.setString(1, branchID);

			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				// System.out.println("11111111111111111111111111111111111 : ");
				r.setDisplayName(rs.getString(1));

				status = rs.getString(1);
				// System.out.println("******************************branch name : " +
				// rs.getString(1));

			}
			con.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return status;
	}

	public static int getBranchID(String branchName) {
		int status = 0;
		Branch r = new Branch();
		try {
			Connection con = DBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("SELECT id FROM branches where B_display_name=?;");
			ps.setString(1, branchName);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {

				r.setId(rs.getInt(1));
				status = rs.getInt(1);
				// System.out.println("branch id : "+status);
			}
			con.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return status;
	}

	public static int saveRatesMnagement(RoomRates rr) {
		// System.out.println("+++++++++++++++++++++++++++++++++++++++++++");
		int status = 0;
		try {
			Connection con = DBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement(
					"insert into room_rates(branch_id,block_id,room_type,meal_plan,rate,discount,dicount_type,status) values (?,?,?,?,?,?,?,?)");

			ps.setString(1, rr.getBranch());
			//System.out.println("++++++++++++++  ;"+rr.getBranch());
			ps.setString(2, rr.getBlock());
			//System.out.println("++++++++++++++  ;"+rr.getBlock());
			ps.setString(3, rr.getRoomtype());
			//System.out.println("++++++++++++++  ;"+rr.getRoomtype());
			ps.setString(4, rr.getMealplan());
		//	System.out.println("++++++++++++++  ;"+rr.getRoomtype());
			ps.setString(5, rr.getBrate());
		//	System.out.println("++++++++++++++  ;"+rr.getBrate());
			ps.setString(6, rr.getDiscout());
		//	System.out.println("++++++++++++++  ;"+rr.getDiscout());
			ps.setString(7, rr.getDicount_type());
		//	System.out.println("++++++++++++++  ;"+rr.getDicount_type());
			ps.setString(8, rr.getStatus());
		//	System.out.println("++++++++++++++  ;"+rr.getStatus());
			
			status = ps.executeUpdate();

			con.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return status;
	}

	public static int getBlockID(String blockName) {

		int status = 0;

		block r = new block();

		try {
			Connection con = DBConnection.getConnection();

			PreparedStatement ps = con.prepareStatement("SELECT blockID FROM block where block_name=?;");

			ps.setString(1, blockName);

			ResultSet rs = ps.executeQuery();
			if (rs.next()) {

				r.setId(rs.getInt(1));
				status = rs.getInt(1);
				// System.out.println("branch id : "+status);
			}
			con.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return status;
	}

	public static List<RoomRates> getAllRoomRates(){  
	    	
	    	
	        List<RoomRates> list = new ArrayList<RoomRates>();  
	          
	        try{  
	            Connection con = DBConnection.getConnection(); 
	            PreparedStatement ps=con.prepareStatement("select * from room_rates ORDER BY id ASC;");  
	            ResultSet rs=ps.executeQuery();  
	            while(rs.next()){  
	            	
	            	RoomRates e = new RoomRates(); 
	            	
	            	e.setId(rs.getString(1));
	                e.setBranch(rs.getString(2));
					e.setBlock(rs.getString(3));
					e.setRoomtype(rs.getString(4));
					 e.setMealplan(rs.getString(5));
						e.setBrate(rs.getString(6));
						e.setDiscout(rs.getString(7));
						 e.setDicount_type(rs.getString(8));
							e.setStatus(rs.getString(9));
						
					
				//	System.out.println(e.getBranch());
					

	                list.add(e);
	            }  
	            con.close();  
	        }
	        catch(Exception e)
	        {
	        	e.printStackTrace();
	        }  
	          
	        
	        return list;  
	    }
		
	
	
	  public static int deleteRoomRAtes(int id){  
	        int status=0;  
	        
	        try{  
	            Connection con = DBConnection.getConnection(); 
	            PreparedStatement ps=con.prepareStatement("delete from room_rates where id=?");  
	            //System.out.println("Printing connection object " + con);
	            ps.setInt(1,id);  
	            status=ps.executeUpdate();  
	              
	            con.close();  
	        }catch(Exception e){e.printStackTrace();}  
	          
	        return status;  
	    }  
	
		public static int updateRoomRates(String id) {
			int status = 0;

			try {
				Connection con = DBConnection.getConnection();
				//System.out.println("Printing connection object " + con);
				
				
				//System.out.println("id of the room rates in update dao "+ id);
				
			
				//UPDATE `ceybank_rest`.`room_rates` SET `status` = 'Deactivated' WHERE (`id` = '62');
					
				PreparedStatement ps = con.prepareStatement("UPDATE room_rates SET status = 'Deactive' WHERE id = "+id+";");

				status = ps.executeUpdate();

				//System.out.println(status);

				con.close();
			
			} catch (Exception ex) {
				ex.printStackTrace();
			}

			return status;
		}

		public static RoomRates getRoomRates(String sid) {
			RoomRates b = new RoomRates();

			try {
				Connection con = DBConnection.getConnection();

				PreparedStatement ps = con.prepareStatement("select * from room_rates where id=?;");
				
				
				ps.setString(1, sid);
				System.out.println("--------------------- id : "+sid);
				ResultSet rs = ps.executeQuery();
				if (rs.next()) {

					
					
					b.setId(rs.getString(1));
					//System.out.println("--------------------- id : "+b.getId());
					b.setBranch(rs.getString(2));
					//System.out.println("--------------------- id : "+b.getBranch());
					b.setBlock(rs.getString(3));
					//System.out.println("--------------------- id : "+b.getBlock());
					b.setRoomtype(rs.getString(4));
					//System.out.println("--------------------- id : "+b.getRoomtype());
					b.setMealplan(rs.getString(5));
					b.setBrate(rs.getString(6));
					b.setDiscout(rs.getString(7));
			
				b.setDicount_type(rs.getString(8));
				b.setStatus(rs.getString(9));
					
					
				}
				con.close();
			} catch (Exception ex) {
				ex.printStackTrace();
			}

			return b;
		}

}