package News_Updates;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import block_Register.blockDAO;

@WebServlet("/NewsInsert")
public class NewsInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public NewsInsert() {
        super();
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String N_Description = request.getParameter("newsDescription");
		
			NewsBean newNews = new NewsBean();
			
			newNews.setDescription(N_Description);;
			
			
			int status = NewsDAO.save(newNews);
			
			if (status > 0) {
				
				request.setAttribute("NUsucceed", "NUsucceed");
				
				request.getRequestDispatcher("NewsUpdates.jsp").include(request, response);
			} else {

				request.setAttribute("NUFailed", "NUFailed");
				
				request.getRequestDispatcher("NewsUpdates.jsp").include(request, response);
			}

			out.close();

	}

}
