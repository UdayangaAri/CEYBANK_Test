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

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 response.setContentType("text/html");  
	        PrintWriter out=response.getWriter();  
	        
		doGet(request, response);
		HttpSession session = request.getSession();
		
		String branch = request.getParameter("idBranch");  

		String block = request.getParameter("idBlock");  
		
		String roomtype = request.getParameter("idRoomType");  

		String mealplan = request.getParameter("mealtypeforRates");  
	

		String rate = request.getParameter("Rate");  

		String discount = request.getParameter("Discount");  
		
		RoomRates rr = new RoomRates();
		
		
		String Branch_For_Form = (String) session.getAttribute("Branch_Name_For_Form");
		 rr.setBranch(branch);
		System.out.println("branch : "+Branch_For_Form );
		
		String Block_For_Form = (String) session.getAttribute("Block_Name_For_Form");
		rr.setBlock(block);
		System.out.println("block : "+Block_For_Form);
		
		
		String RoomType_Name_For_Form = (String) session.getAttribute("RoomType_Name_For_Form");
		rr.setRoomtype(roomtype);
		System.out.println("roomtype : "+RoomType_Name_For_Form);
		
		rr.setMealplan(mealplan);
		System.out.println("mealplan : "+mealplan);
		
		rr.setBrate(rate);
		System.out.println("rate : "+rate);
		
		rr.setDiscout(discount);
		System.out.println("discount : "+discount);
		
	//	 System.out.println("+++++++++++++++++++++++++++++++++++++++++++");
        int status=RoomRatesDAO.saveRatesMnagement(rr); 
        
        if(status>0){  
        	
            request.getRequestDispatcher("home.jsp").include(request, response);  
        }else{  
        	 request.getRequestDispatcher("index.jsp").include(request, response);  
        }  
          
        out.close(); 

}
}
