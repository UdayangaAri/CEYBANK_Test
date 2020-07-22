package RoomReservation;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import RoomManagement.Room;
import RoomManagement.RoomDao;
import block_Register.blockDAO;

@WebServlet("/ReservationSaveServlet")
public class ReservationSaveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ReservationSaveServlet() {
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

		String roomNo = request.getParameter("RoomNo");
		String roomName = request.getParameter("Roomname");
		String roomType = request.getParameter("RoomType");
		String blockName = request.getParameter("blockID");
		
		int i=Integer.parseInt(roomType);  

		block_Register.block e = blockDAO.getBlocksById(blockName);

		int blockID = e.getId();

		Room room = new Room();

		String room_Status = "Available";

		room.setRoomNo(roomNo);
		room.setRoomName(roomName);
		room.setRoomType(i);
		room.setBlockID(blockID);
		room.setRoomStatus(room_Status);

		int status = RoomDao.save(room);
		if (status > 0) {
			session.setAttribute("RoomViewAlt", "SaveMessageRMs");
			request.getRequestDispatcher("room_view.jsp").include(request, response);
		} else {
			out.println("Sorry! unable to save record");
		}

		out.close();
	}

}
