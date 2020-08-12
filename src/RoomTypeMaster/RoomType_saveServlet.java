package RoomTypeMaster;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/RoomType_saveServlet")
public class RoomType_saveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public RoomType_saveServlet() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		HttpSession session = request.getSession();

		String name = request.getParameter("room_type_name");

		Room_type e = new Room_type();

		e.setRoom_Type(name);

		System.out.println("room type 1 ::: " + name);

		int status = roomTypeDAO.save(e);

		if (status > 0) {

			session.setAttribute("save_succeed_Message", "save_succeed_Message");
			request.getRequestDispatcher("RoomTypeMasterView.jsp").include(request, response);
		} else {

			session.setAttribute("save_failed_Message", "save_failed_Message");
			request.getRequestDispatcher("RoomTypeMasterView.jsp").include(request, response);
		}

		out.close();
	}

}
