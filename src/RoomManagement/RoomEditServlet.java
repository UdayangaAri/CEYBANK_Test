package RoomManagement;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Branches.Branch;
import Branches.BranchDao;
import Log.Log;
import Log.LogDAO;
import RoomReservation.RoomDAO;
import RoomTypeMaster.Room_type;
import RoomTypeMaster.roomTypeDAO;
import block_Register.blockDAO;

@WebServlet("/RoomEditServlet")
public class RoomEditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public RoomEditServlet() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");  
        PrintWriter out=response.getWriter(); 
        
        HttpSession session1 = request.getSession();
          
        String sid=request.getParameter("id");  
        int id=Integer.parseInt(sid);  
        
        String roomNo=request.getParameter("roomNo");  
        String roomName=request.getParameter("roomName");  
        String roomType=request.getParameter("roomType");   
        String blockName=request.getParameter("blockID");  
       
        
        block_Register.block j = blockDAO.getBlocksById(blockName);

        int i=Integer.parseInt(roomType);  
        
        Room_type r = roomTypeDAO.getRoomTypeById(i);
        
        
        Room x = RoomDao.getRoomById(sid);

		String previousData = "Room Id : " + x.getId() + " , Room No : " + x.getRoomNo()
				+ ", Room Name : " + x.getRoomName() + " , Room Type : " + x.getRoomType()
				+ " , Block ID of Room : " + x.getBlockID();
		String e_status = "Edited";
		String edited_unit = "Rooms";
		String name1 = (String) request.getSession(false).getAttribute("empno");
        
        
        int blockID = j.getId();
          
        Room e=new Room();  
        
        e.setId(id);  
        e.setRoomNo(roomNo);  
        e.setRoomName(roomName); 
        e.setRoomType(r.getId());
        e.setBlockID(blockID);
        
        Log log = new Log();

		log.setPrevious_data(previousData);
		log.setEdited_by(name1);
		log.setEdit_status(e_status);
		log.setEdited_unit(edited_unit);
        
          
        int status=RoomDao.update(e);  
        
        if (status > 0) {

			int logs = LogDAO.InsertLog(log);

			if (logs > 0) {

				session1.setAttribute("RoomViewAlt", "editedMessageRM");
	            response.sendRedirect("room_view.jsp");  

			} else {
				out.println("Sorry! unable to update record");
			}

		} else {
			out.println("Sorry! unable to update record");
		}
          
        out.close(); 
	}

}
