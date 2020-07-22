package RoomStatus;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Branches.Branch;
import Roles.Role;
import RoomManagement.Room;
import access.Functions;
import block_Register.block;
import block_Register.blockBean;
import connections.DBConnection;
import register.RegisterBean;

public class RoomStatusDAO {

	public static String getBranchIDbyLoging(String branchID) {

		String status = "";

		Branch r = new Branch();

		try {
			Connection con = DBConnection.getConnection();

			PreparedStatement ps = con.prepareStatement("SELECT B_display_name FROM branches where id=?;");

			ps.setString(1, branchID);
			//System.out.println("******************************branchID : " + branchID);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {

				r.setDisplayName(rs.getString(1));

				status = rs.getString(1);
				//System.out.println("******************************branch name : " + rs.getString(1));

			}
			con.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return status;
	}

	// ---------------------------
   
    	 public static List<StatusRooms> getRoomDetails(String blockID) {
    		
    		 //System.out.println("blockID: "+blockID);
		List<StatusRooms> list = new ArrayList<StatusRooms>();  
		
		

		try {
			
			
			 Connection con = DBConnection.getConnection();  
	            PreparedStatement ps=con.prepareStatement("SELECT * FROM rooms where blockID=?;"); 
	            ps.setString(1, blockID);
	            ResultSet rs=ps.executeQuery();  
	          
	            while(rs.next()){  
	            	StatusRooms e=new StatusRooms(); 
			
	            //	 System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");
	            	 e.setId(rs.getString(1));
	            	 e.setRoomNo(rs.getString(2));
	            	 e.setRoomName(rs.getString(3));
	            	 e.setRoomType(rs.getString(4));
	            	 e.setBlockID(rs.getString(5));
	            	 e.setStatus(rs.getString(6));
	            	 //System.out.println("--------------------------------------------------------------");
	            	// System.out.println("room name : "+ e.getRoomName());
	            	 
	            	 if(rs.getString(6).equals("Available")) {
	            		 e.setStatus("Available");
	            	 }
	            	 else if(rs.getString(6).equals("Cleaning")) {
	            		 e.setStatus("Cleaning");
	            	 }
	            	 else if(rs.getString(6).equals("Occupied")) {
	            		 e.setStatus("Occupied");
	            	 }
	            	 else if(rs.getString(6).equals("Reserved")) {
	            		 e.setStatus("Reserved");
	            	 }
	            
	            	 else if (rs.getString(6).equals("Maintenance")) {
	            		 e.setStatus("Maintenance");
	            	 }
	            	 
	            	 
	            	 
	                 list.add(e);  
	             }  
	             con.close();  
	         }catch(Exception e){e.printStackTrace();}  
	           
	         
	         return list;  
	     }
    	 
    	 
    	 
    	 
    	 
    	 public static String getBlockNAmeByID(String blockID) {

    			String status = "";

    			block r = new block();

    			try {
    				Connection con = DBConnection.getConnection();

    				PreparedStatement ps = con.prepareStatement("SELECT block_name FROM block where blockID=?;");

    				ps.setString(1, blockID);
    			//	System.out.println("******************************branchID : " + blockID);
    				ResultSet rs = ps.executeQuery();
    				if (rs.next()) {

    					
r.setBlock_name(rs.getString(1));
    					status = rs.getString(1);
    				//	System.out.println("****************************** name : " + rs.getString(1));

    				}
    				con.close();
    			} catch (Exception ex) {
    				ex.printStackTrace();
    			}

    			return status;
    		}
    	 
    	 
    	 
    	 
    	 
    	 
    	 
}