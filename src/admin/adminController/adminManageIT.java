package admin.adminController;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.adminLoginService.AdminServiceImpl;
import admin.adminLoginService.IAdminService;
import board_it.vo.ItVo;

@WebServlet("/adminManageIT.do")
public class adminManageIT extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private IAdminService service = AdminServiceImpl.getInstance();
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<ItVo> It_Y_List = service.getITBoardPermit_Y_List();
		List<ItVo> IT_N_List = service.getITBoardPermit_N_List();
		
		request.setAttribute("It_Y_List", It_Y_List);
		request.setAttribute("IT_N_List", IT_N_List);
		
		request.getRequestDispatcher("jsp/admin/admin_IT.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
