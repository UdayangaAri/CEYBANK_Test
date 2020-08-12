package Functions;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




@WebServlet("/SaveNewFunctionsServlet")
public class SaveNewFunctionsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public SaveNewFunctionsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		System.out.println("aaaaaaaaaaaaaaaaaa");
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	
		PrintWriter out=response.getWriter(); 
		System.out.println("bbbbbbbbbbbbbbbbbbbbbbbb");

	 String mainName = request.getParameter("a");
		 System.out.println("Mainfunction : "+mainName);

		 String subName = request.getParameter("b");
	 System.out.println("Subfunction : "+subName);
		 
		 Functions f = new Functions();
		 f.setMainFunction(mainName);
		 f.setSubFunction(subName);
		 System.out.println("hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh");
	 	 int status = FunctionDAO.save(f);
//		  
		    if(status<0){  
	    		
	    	System.out.println("Sorry! unable to save record");
	    	 request.getRequestDispatcher("Role.jsp").include(request, response); 
	    	}
		    else {
		    	System.out.println("success");
		    	 request.getRequestDispatcher("home.jsp").include(request, response); 
		    }
//	 
//		   
//		   
//		  
//
out.close();  

	}

}
