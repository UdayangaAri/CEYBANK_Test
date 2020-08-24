package block_Register;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/blockServlet")
public class blockServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public blockServlet() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

//HttpSession session = request.getSession();

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		HttpSession session = request.getSession();

		String Block_branch = request.getParameter("Block_branch");
		String block_name = request.getParameter("block_name");
		String Block_status = request.getParameter("Block_status");

		System.out.println("branch : " + Block_branch);

		Branches.Branch b = blockDAO.getBranchesById(Block_branch);

		if (Block_branch.equals(b.getDisplayName())) {

			int BranchID = b.getId();

			block bb = new block();

			bb.setLocation(BranchID);
			bb.setBlock_name(block_name);
			bb.setBlock_status(Block_status);

			int status = blockDAO.save(bb);

			if (status > 0) {

				session.setAttribute("blockSaveMessage", "blockSaveMessage");
				request.getRequestDispatcher("block_view.jsp").include(request, response);
			} else {

				session.setAttribute("blockSaveFailed", "blockSaveFailed");
				request.getRequestDispatcher("block_view.jsp").include(request, response);
			}

			out.close();

		}

	}

}
