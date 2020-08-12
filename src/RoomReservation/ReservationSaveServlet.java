package RoomReservation;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.concurrent.TimeUnit;

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

		String guestName = request.getParameter("guestName");
		String guestNic = request.getParameter("guestNic");
		String guestEmail = request.getParameter("guestEmail");
		String guestPhone = request.getParameter("guestPhone");
		
		String guestBlock = request.getParameter("guestBlock");
		String guestRoom = request.getParameter("guestRoom");
		String guestMeal = request.getParameter("guestMeal");
		String checkIn = request.getParameter("checkin");
		String checkOut = request.getParameter("checkout");
		String guestPrice = request.getParameter("guestPrice");

		
//		System.out.println("guestName ::: "+ guestName);
//		System.out.println("guestNic ::: "+ guestNic);
//		System.out.println("guestEmail ::: "+ guestEmail);
//		System.out.println("guestPhone ::: "+ guestPhone);
//		System.out.println("guestBlock ::: "+ guestBlock);
//		System.out.println("guestRoom ::: "+ guestRoom);
//		System.out.println("guestMeal ::: "+ guestMeal);
//		System.out.println("checkIn ::: "+ checkIn);
//		System.out.println("checkOut ::: "+ checkOut);
//		System.out.println("guestPrice ::: "+ guestPrice);
		
		
		
//		//int i=Integer.parseInt(roomType);  
//
//		block_Register.block e = blockDAO.getBlocksById(blockName);
//
//		int blockID = e.getId();
//
//		Room room = new Room();
//
//		String room_Status = "Available";
//
//		room.setRoomNo(roomNo);
//		room.setRoomName(roomName);
//		room.setRoomType(i);
//		room.setBlockID(blockID);
//		room.setRoomStatus(room_Status);
//
//		int status = RoomDao.save(room);
//		if (status > 0) {
//			session.setAttribute("RoomViewAlt", "SaveMessageRMs");
//			request.getRequestDispatcher("room_view.jsp").include(request, response);
//		} else {
//			out.println("Sorry! unable to save record");
//		}
//
//		out.close();
	}

}
