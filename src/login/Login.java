package login;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dashboard.dashboardDAO;
import register.RegisterBean;
import register.passwordEncrypt;

@WebServlet(name = "Login", urlPatterns = { "/Login" })
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Login() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String Username = request.getParameter("Username");
		String password = request.getParameter("pass");
		
		passwordEncrypt epwdEncrypt = new passwordEncrypt();
		String encryptedPwd = epwdEncrypt.userPassword(password);

		LoginBean loginBean = new LoginBean();

		loginBean.setusername(Username);
		
		loginBean.setPassword(encryptedPwd);
		
		LoginDao loginDao = new LoginDao();

		try { 
			String userValidate = loginDao.authenticateUser(loginBean);

			HttpSession session = request.getSession();

			if (userValidate.equals("Access_Granted")) {
				
				LoginBean b = LoginDao.getEmployeeById(Username);

				String branch = b.getBranch();
				String empNo = b.getEmpno();
				String roleid = b.getRole();

				//System.out.println("empno :" + empNo);
				//System.out.println("roleid :" + roleid);
				
				session.setAttribute("Username", Username);
				session.setAttribute("empno", empNo);
				session.setAttribute("branch", branch);
				
			
				session.setAttribute("roleid", roleid);
		
				String s = String.valueOf(branch);
				String countEmpOnBranch = dashboardDAO.getEmpCount(s);
				
				request.setAttribute("countEmpOnBranch", countEmpOnBranch);
			//	System.out.println("count Emp in login servlet  :" +countEmpOnBranch);
				
				
				session.setAttribute("countEmpOnBranch", countEmpOnBranch);
				
				request.getRequestDispatcher("home.jsp").forward(request, response);
			}

			else {

				request.setAttribute("errorMessage", "Login Failed");

				request.setAttribute("errMessage", userValidate);

				request.getRequestDispatcher("login.jsp").forward(request, response);
			}

		} catch (IOException e1) {
			e1.printStackTrace();
		} catch (Exception e2) {
			e2.printStackTrace();
		}
	}
}
