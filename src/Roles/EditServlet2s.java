package Roles;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Log.Log;
import Log.LogDAO;
import login.LoginDao;


@WebServlet("/EditServlet2s")
public class EditServlet2s extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public EditServlet2s() {
        super();
      
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		response.setContentType("text/html");  
        PrintWriter out=response.getWriter();  
        
        
          
        String sid=request.getParameter("id");  
        int id=Integer.parseInt(sid);  
        String role=request.getParameter("name");  
        String roledes=request.getParameter("desc");
        String data=request.getParameter("passingValue");
        
        Role x = RoleDao.getRoleById(sid);
        
        String previousData = "Role Id : "+x.getId() +" , Role : "+x.getRole() +", Role Description : "+ x.getRoleDesc();
        String e_status = "Edited";
        String edited_unit = "Roles";
        String name = (String) request.getSession(false).getAttribute("empno");
        
        System.out.println("this is q value = "+data);
        
        
        //System.out.println("name : "+name);
          
        Role e=new Role();  
        e.setId(id);  
        e.setRole(role);  
        e.setRoleDesc(roledes); 
        
        Log log = new Log();
        
        log.setPrevious_data(previousData);
        log.setEdited_by(name);
        log.setEdit_status(e_status);
        log.setEdited_unit(edited_unit);
        
        
        int status=RoleDao.update(e);  
        if(status>0){  
        	int logs = LogDAO.InsertLog(log);
        	
        	 if(logs>0){  
     
        		 out.print("<div class='alert alert-success' role='alert'>" + "Record saved successfully!" +"</div>");
                 response.sendRedirect("R_View.jsp"); 
                 
             }
        	 else
             {
                 out.println("Sorry! unable to update record");  
             }  
        	
        }
        else
        {  
            out.println("Sorry! unable to update record");  
        }  
          
        out.close();  
	}

}
