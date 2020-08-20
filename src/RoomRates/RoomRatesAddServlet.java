package RoomRates;

import java.io.IOException;
import java.io.PrintWriter;

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

		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		doGet(request, response);
		 HttpSession session = request.getSession();
		//String SessionTranslateBranch = (String) session.getAttribute("gettingBranchSecondTime");
	//	System.out.println("gettingBranchSecondTime : " + SessionTranslateBranch);

		 String passBranchID = request.getParameter("SessionBranchID");
		//String passBranchID = "a";
		System.out.println("Branch ID : " + passBranchID);

		String passBlockID = request.getParameter("SessionBlockID");
		//System.out.println(" Block ID : " + passBlockID);

		String roomtype = request.getParameter("roomtypeforRates");
		//System.out.println("roomtype : " + roomtype);

		String mealplan = request.getParameter("mealtypeforRates");
		//System.out.println("mealplan : " + mealplan);

		String rate = request.getParameter("Rate");
		//System.out.println("Rate : " + rate);

		String discount_percentage = request.getParameter("Percentagee");
		String discount_amount = request.getParameter("Amountt");
		String options = request.getParameter("options");
		//
		// 
		// 

		RoomRates rr = new RoomRates();
		
		rr.setBranch(passBranchID);
		rr.setBlock(passBlockID);
		rr.setRoomtype(roomtype);
		rr.setMealplan(mealplan);
		rr.setBrate(rate);
		rr.setDicount_type(options);
		//System.out.println("-*****************---options :  "+options);
	
		
		if(options.equals("Percentage")) {
			//System.out.println("---------------------options :  "+options);
	
		
			//Double rrate = Double.valueOf(rr.getBrate());
			//	int i = Integer.parseInt(discount_percentage);
			//	System.out.println("--------------------i : "+i);
				
			//	Double dnum = Double.valueOf(i);
			//	double division = rrate * (dnum / 100);
			//	System.out.println("--------------------int_Actual_Percentage : "+division);
			//	String str = String.valueOf(division);  
			
				//rr.setDiscout(str);
			rr.setDiscout(discount_percentage);
			System.out.println("---------------------discount_percentage :  "+discount_percentage);
			
		}
		
		if(options.equals("Amount")) {
			System.out.println("---------------------options :  "+options);
			
		
			rr.setDiscout(discount_amount);
			System.out.println("---------------------discount_amount :  "+discount_amount);
		
		}

		rr.setStatus("Active");
		
		int status = RoomRatesDAO.saveRatesMnagement(rr);

		if (status > 0) {

			request.getRequestDispatcher("home.jsp").include(request, response);
		} else {
			System.out.println("wrong");
			request.getRequestDispatcher("index.jsp").include(request, response);

		}

		out.close();
		// request.getRequestDispatcher("index.jsp").include(request, response);

	}
}
