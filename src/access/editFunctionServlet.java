package access;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Log.Log;
import Log.LogDAO;
import Roles.Role;
import Roles.RoleDao;
import block_Register.blockDAO;

/**
 * Servlet implementation class editFunctionServlet
 */
@WebServlet("/editFunctionServlet")
public class editFunctionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public editFunctionServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// doGet(request, response);
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();

		String functionID[] = request.getParameterValues("functionID");
		try {
			for (int i = 0; i < functionID.length; i++) {

				String a = functionID[i];
				System.out.println("functionID to edit " + a);

				int FunctionID = Integer.parseInt(a);
				System.out.println("id :" + FunctionID);

				Integer roleID = (Integer) session.getAttribute("roleIDByName");

				// System.out.println("role ID---- :" + roleID);
				// System.out.println("function id------------- :" + FunctionID);

				String FunctionIDString = Integer.toString(FunctionID);

				String roleIDString = Integer.toString(roleID);
				
				RoleFunction r = RoleFunctionDAO.getFunction(roleIDString);

				System.out.println("r.getRoleID()************* :" + r.getRoleID());
				System.out.println("r.getFunctionID()*************** :" + r.getFunctionID());

				String previousData = "Funtion Id : " + r.getFunctionID() + " , Role ID : " + r.getRoleID();
				String e_status = "Access Removed";
				String edited_unit = "Access";
				String name = (String) request.getSession(false).getAttribute("empno");

				Log log = new Log();

				log.setPrevious_data(previousData);
				log.setEdited_by(name);
				log.setEdit_status(e_status);
				log.setEdited_unit(edited_unit);

				if (roleID == 3 && FunctionID == 13) {
					System.out.println("you can't delete user access from Super admin role ");
					session.setAttribute("not_updated", "failed Message");
					//out.println("Sorry! unable to update record. Please check again and try.");
				} else {

					int logs = LogDAO.InsertLog(log);

					if (logs > 0) {

						
						RoleFunctionDAO.deleteRoleFunction(FunctionID, roleID);
						session.setAttribute("updated", "Success Message");

					} else {
						out.println("Sorry! unable to update record");
					}

				}

			}
			response.sendRedirect("PageAccessEdit.jsp");
		}

		catch (NullPointerException e) {
			System.out.println("NullPointerException in edit Function servlet\n" + e);
		}

	}
}