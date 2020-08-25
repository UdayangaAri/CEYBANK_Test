package RoomRates;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/RoomRatesAddServlet")
public class RoomRatesAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public RoomRatesAddServlet() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		doGet(request, response);
		HttpSession session = request.getSession();

		String passBranchID = request.getParameter("SessionBranchID");

	
		String passBlockID = request.getParameter("SessionBlockID");

		String roomtype = request.getParameter("roomtypeforRates");

		String mealplan = request.getParameter("mealtypeforRates");

		String rate = request.getParameter("Rate");

		String discount_percentage = request.getParameter("Percentagee");
		String discount_amount = request.getParameter("Amountt");
		String options = request.getParameter("options");
		String Activestatus = "Active";
		RoomRates rr = new RoomRates();

		rr.setBranch(passBranchID);
		rr.setBlock(passBlockID);
		rr.setRoomtype(roomtype);
		rr.setMealplan(mealplan);
		rr.setBrate(rate);
		rr.setDicount_type(options);

		if (options.equals("Percentage")) {

			rr.setDiscout(discount_percentage);

		}

		if (options.equals("Amount")) {

			rr.setDiscout(discount_amount);

		}
		
		rr.setStatus(Activestatus);

		
		int check = RoomRatesDAO.checkValues(passBranchID, passBlockID, roomtype, mealplan, Activestatus);
	
		if (check > 0)
		{
			System.out.println("aaaaaaaaaaaaaaaaaaaaa");
			session.setAttribute("have", "have"); 
			 request.getRequestDispatcher("RoomRatesManagement.jsp").include(request, response);
		}
		else if (check==0) {
			System.out.println("bbbbbbbbbbbbbbbbbbb");
			int status = RoomRatesDAO.saveRatesMnagement(rr);

			if (status > 0)
			{
				System.out.println("ccccccccccccccccccc");
				session.setAttribute("sucess", "sucess"); 
				 request.getRequestDispatcher("RoomRatesManagement.jsp").include(request, response);
			} 
			
			else 
			{
				System.out.println("dddddddddddddddddd ");
				session.setAttribute("notsucess", "notsucess"); 
				 request.getRequestDispatcher("RoomRatesManagement.jsp").include(request, response);

			}
			
		}
			
		
		out.close();

	}
}
