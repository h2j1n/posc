package user.userRLLController;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.userRLLService.IMemberService;
import user.userRLLService.MemberServiceImpl;

@WebServlet("/FindPw.do")
public class FindPwController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static IMemberService service = MemberServiceImpl.getInstance(); 

    public FindPwController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			request.getRequestDispatcher("/jsp/member/findPw.jsp").forward(request, response);
			
		
		
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

			String userid = request.getParameter("userid");
			String name =request.getParameter("name");
			String birth =request.getParameter("birth");
			String email =request.getParameter("email");
			
			Map<String, Object> findMap = new HashMap<String, Object>();
			
			findMap.put("userid", userid);
			findMap.put("name", name);
			findMap.put("bir", birth);
			findMap.put("email", email);
			
			
			String memPw = service.findPw(findMap);
			
			
			if(memPw!=null) {
				System.out.println(memPw);
				response.setContentType("text/plain;charset=utf-8");
				PrintWriter writer = response.getWriter();
				writer.println(memPw);
			}else {
				
				System.out.println("일치하는ID없음");
				
			}

			

}
	
}