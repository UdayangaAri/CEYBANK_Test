package login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import Update.EmpDao;
import connections.DBConnection;

public class LoginDao {
	public String authenticateUser(LoginBean loginBean) {

		String username = loginBean.getusername();
		String password = loginBean.getPassword();

		try {

			LoginBean e = LoginDao.getEmployeeById(username);

			String usernameDB = e.getusername();
			String passwordDB = e.getDefpwd();
			String statusDB = e.getStatus();

			if (username.equals(usernameDB) && password.equals(passwordDB)
					&& statusDB.equals("Active")) {

				return "Access_Granted";

			}

			

		} catch (Exception e) {
			e.printStackTrace();
		}

		System.out.println("failed");
		return "Invalid user credentials";
	}

	public static LoginBean getEmployeeById(String username) {
		LoginBean e = new LoginBean();

		try {
			Connection con = DBConnection.getConnection();

			PreparedStatement ps = con.prepareStatement("select * from employee where username=?");
			ps.setString(1, username);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {

				e.setUsername(rs.getString("username"));
				e.setDefpwd(rs.getString("defaultPWD"));
				e.setRole(rs.getString("role"));
				e.setStatus(rs.getString("Status"));
				e.setMobile(rs.getString("mobileNo"));
				e.setNic(rs.getString("NIC"));
				e.setEmpno(rs.getString("employeeNo"));
				e.setFname(rs.getString("firstName"));
				e.setBranch(rs.getString("Branch"));

			}
			con.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return e;
	}

}
