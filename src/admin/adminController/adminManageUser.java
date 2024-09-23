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
import vo.MemberVO;

@WebServlet("/adminManageUser.do")
public class adminManageUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private IAdminService service = AdminServiceImpl.getInstance();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<MemberVO> memList = service.getUserList();
		
		request.setAttribute("memList", memList);
		
		request.getRequestDispatcher("jsp/admin/admin_user.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
