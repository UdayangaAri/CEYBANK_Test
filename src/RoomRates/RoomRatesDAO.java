package RoomRates;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import Branches.Branch;
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
			//	System.out.println("******************************branchID : " + blockID);
				ResultSet rs = ps.executeQuery();
				if (rs.next()) {

					r.setId(rs.getInt(1));
					status = rs.getInt(1);
				//	System.out.println("****************************** name : " + rs.getString(1));

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
				System.out.println("******************************Room type ID : " + RoomName);
				ResultSet rs = ps.executeQuery();
				if (rs.next()) {

					
r.setRoom_Type(rs.getString(1));
					status = rs.getString(1);
				System.out.println("******************************Room type name : " + rs.getString(1));

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
					System.out.println("22222222222222222222222222222222");
				//	System.out.println("****************************** branchname : " + rs.getString(1));

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
					System.out.println("11111111111111111111111111111111111 : ");
					r.setDisplayName(rs.getString(1));

					status = rs.getString(1);
				//	System.out.println("******************************branch name : " + rs.getString(1));

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
		//System.out.println("branch id : "+status);
				}
				con.close();
			} catch (Exception ex) {
				ex.printStackTrace();
			}
			return status;
		}

	 
	 
	 public static int saveRatesMnagement(RoomRates rr){  
		 //System.out.println("+++++++++++++++++++++++++++++++++++++++++++");
	        int status=0;  
	        try{  
	            Connection con = DBConnection.getConnection(); 
	            PreparedStatement ps=con.prepareStatement("insert into room_rates(branch_id,block_id,room_type,meal_plan,rate,discount) values (?,?,?,?,?,?)");  
	        
	            ps.setString(1,rr.getBranch());  
	            ps.setString(2,rr.getBlock());  
	            ps.setString(3,rr.getRoomtype());  
	            ps.setString(4,rr.getMealplan());  
	            ps.setString(5,rr.getBrate());
	            ps.setString(6,rr.getDiscout());  
	            
	           
	            
	            status=ps.executeUpdate();  
	            
	            
	              
	            con.close();  
	        }catch(Exception ex){ex.printStackTrace();}  
	          
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
		//System.out.println("branch id : "+status);
				}
				con.close();
			} catch (Exception ex) {
				ex.printStackTrace();
			}

			return status;
		}

	 
}
