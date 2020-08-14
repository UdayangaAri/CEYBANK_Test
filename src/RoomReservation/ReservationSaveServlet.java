package RoomReservation;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;


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

		//HttpSession session = request.getSession();
		
	
		//////////////////////////////////////////////////////////////////////
		
		String checkinNxt = request.getParameter("checkinNxt");
		String checkoutNxt = request.getParameter("checkoutNxt");
		
		String BlockNxt = request.getParameter("BlockNxt");
		String room_in_r = request.getParameter("room_in_r");
		
		String MEalTypeNxt = request.getParameter("MealTypeNxt");
		String Room_Price_tot = request.getParameter("Room_Price_tot");
		
		String nameres = request.getParameter("nameres");
		String nicres = request.getParameter("nicres");
		String mobileres = request.getParameter("mobileres");
		String emailres = request.getParameter("emailres");
		
		String options = request.getParameter("options");
		String pfnovalue = request.getParameter("pfnovalue");
		
		//////////////////////////////////////////////////////////////////////
		Rooms rooms = new Rooms();
		
		rooms.set

	}

}
