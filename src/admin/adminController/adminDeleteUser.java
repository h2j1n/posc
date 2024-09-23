package admin.adminController;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ad.vo.AdVO;
import admin.adminLoginService.AdminServiceImpl;
import admin.adminLoginService.IAdminService;
import vo.MemberVO;

@WebServlet("/adminDeleteUser.do")
public class adminDeleteUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private IAdminService service = AdminServiceImpl.getInstance();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String[] delArr = request.getParameterValues("no");
		
        for (String user : delArr) {
            // 광고 번호에 해당하는 광고를 select
            MemberVO memberVO = service.selectUser(Integer.parseInt(user));
            memberVO.setUser_delyn("Y");
            service.deleteUser(memberVO);
        }
		
		response.sendRedirect("/adminManageUser.do");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
