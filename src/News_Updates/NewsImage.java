package News_Updates;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/NewsImage")
@MultipartConfig(maxFileSize = 16177215)  
public class NewsImage extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public NewsImage() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		Part filePart = request.getPart("photo");
		
		 if (filePart != null) {
	           
	            System.out.println(filePart.getName());
	            System.out.println(filePart.getSize());
	            System.out.println(filePart.getContentType());
	            
	            NewsBean newsImage = new NewsBean();
	            
	            newsImage.setImage(filePart);
	            
	            int status = NewsDAO.saveImage(newsImage);
	            
	            if (status > 0) {
					
					request.setAttribute("NIsucceed", "NIsucceed");
					
					request.getRequestDispatcher("NewsUpdates.jsp").include(request, response);
				} else {

					request.setAttribute("NIFailed", "NIFailed");
					
					request.getRequestDispatcher("NewsUpdates.jsp").include(request, response);
				}
	        }
		
	}

}
