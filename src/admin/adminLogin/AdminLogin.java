package admin.adminLogin;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin.adminLoginService.AdminServiceImpl;
import admin.adminLoginService.IAdminService;

@WebServlet("/AdminLogin.do")
public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	IAdminService service = AdminServiceImpl.getInstance();
       
    public AdminLogin() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session =request.getSession();
		session.invalidate();
		 
		request.getRequestDispatcher("/jsp/member/login.jsp").forward(request, response);
		
		
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("adminId");
		String pw = request.getParameter("adminPw");
		System.out.println(id);
		System.out.println(pw);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("adminId", id);
		map.put("adminPw", pw);
		
		HttpSession session = request.getSession();
		HttpSession errorMsg = request.getSession();
		String admId = service.loginAdminId(map);//adm_id
		if(admId!=null) {
			
			session.setAttribute("admId", admId);
			
		}
		int admNo = service.loginAdmin(map);//adm_no
		
		
		System.out.println(admNo);
		if(0<admNo) {
			session.setAttribute("admNo", admNo);
			request.getRequestDispatcher("adminManageUser.do").forward(request, response);
			
		}else {
		
			errorMsg.setAttribute("errorMessage", "아이디,패스워드가 일치하지않습니다");
	         response.sendRedirect("/jsp/member/login.jsp");
			
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}

}
