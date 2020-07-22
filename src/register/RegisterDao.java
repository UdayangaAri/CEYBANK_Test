package register;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import Branches.Branch;
import Roles.Role;
import Update.EmpDao;
import connections.DBConnection;

public class RegisterDao {

	public String registerUser(RegisterBean registerBean) {
		
		String employeeNo = registerBean.getEmployeeNo();
		String firstName = registerBean.getFirstName();
		String lastName = registerBean.getLastName();
		String userName = registerBean.getUserName();
		int role = registerBean.getRole();
		String defaultPWD = registerBean.getDefaultPWD();
		String phone = registerBean.getPhone();
		String mobile = registerBean.getMobile();
		String email = registerBean.getEmail();
		String address = registerBean.getAddress();
		String NIC = registerBean.getNIC();
		int Branch = registerBean.getBranch();
		String Status = registerBean.getStatus();
		
		passwordEncrypt epwdEncrypt = new passwordEncrypt();
		String encryptedPwd = epwdEncrypt.userPassword(defaultPWD);

		Connection con = null;
		PreparedStatement preparedStatement = null;
		

		try {

			con = DBConnection.getConnection();
			String query = "insert into employee(employeeNo,firstName,lastName,userName,role,defaultPWD,phoneNo,mobileNo,email,address,NIC,Branch,status) values (?,?,?,?,?,?,?,?,?,?,?,?,?)";
			
			
			preparedStatement = con.prepareStatement(query);
			
			
			preparedStatement.setString(1, employeeNo);
			preparedStatement.setString(2, firstName);
			preparedStatement.setString(3, lastName);
			preparedStatement.setString(4, userName);
			preparedStatement.setInt(5, role);
			preparedStatement.setString(6, encryptedPwd);
			preparedStatement.setString(7, phone);
			preparedStatement.setString(8, mobile);
			preparedStatement.setString(9, email);
			preparedStatement.setString(10, address);
			preparedStatement.setString(11, NIC);
			preparedStatement.setInt(12, Branch);
			preparedStatement.setString(13, Status);
			
			

			int i = preparedStatement.executeUpdate();
			System.out.println("password "+encryptedPwd);

			if (i != 0)
				return "SUCCESS";
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return "Oops.. Something went wrong there..!";
	}
	
	public static Role getRoleById(String sid) {
		Role e = new Role();

		try {
			Connection con = DBConnection.getConnection();

			PreparedStatement ps = con.prepareStatement("select role,id from role where role=?");
			ps.setString(1, sid);
			ResultSet rs = ps.executeQuery();
			
			if (rs.next()) {

				e.setId(rs.getInt(2));
				e.setRole(rs.getString(1));
				
			}
			con.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return e;
	}
	
	public static Role getRoleIdByName(String sid) {
		Role e = new Role();

		try {
			Connection con = DBConnection.getConnection();

			PreparedStatement ps = con.prepareStatement("select role,id from role where id=?");
			ps.setString(1, sid);
			ResultSet rs = ps.executeQuery();
			
			if (rs.next()) {

				e.setId(rs.getInt(2));
				e.setRole(rs.getString(1));
				
			}
			con.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return e;
	}
	
	public static Branch getBranchById(String sid) {
		Branch e = new Branch();

		try {
			Connection con = DBConnection.getConnection();

			PreparedStatement ps = con.prepareStatement("select B_display_name,id from branches where B_display_name=?");
			ps.setString(1, sid);
			ResultSet rs = ps.executeQuery();
			
			if (rs.next()) {

				e.setId(rs.getInt(2));
				e.setDisplayName(rs.getString(1));
				
			}
			con.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return e;
	}
	
	public static Branch getBranchIdByName(String sid) {
		Branch e = new Branch();

		try {
			Connection con = DBConnection.getConnection();

			PreparedStatement ps = con.prepareStatement("select B_display_name,id from role where id=?");
			ps.setString(1, sid);
			ResultSet rs = ps.executeQuery();
			
			if (rs.next()) {

				e.setId(rs.getInt(2));
				e.setDisplayName(rs.getString(1));
				
			}
			con.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return e;
	}
}
