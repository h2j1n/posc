package user.userRLLController;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.userRLLService.IMemberService;
import user.userRLLService.MemberServiceImpl;

@WebServlet("/FindId.do")
public class FindIdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static IMemberService service = MemberServiceImpl.getInstance(); 
    public FindIdController() {
        super();
    }

	
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.getRequestDispatcher("/jsp/member/FindId.jsp").forward(request, response);
    	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		
		
		try {
			
			String name =request.getParameter("name");
			String birth =request.getParameter("birth");
			String tel =request.getParameter("tel");
			
			Map<String, Object> findMap = new HashMap<String, Object>();
			
			findMap.put("name", name);
			findMap.put("bir", birth);
			findMap.put("tel", tel);
			
			
			String memId = service.findId(findMap);

			
			if(memId!=null) {
				System.out.println(memId);
				response.setContentType("text/plain;charset=utf-8");
				PrintWriter writer = response.getWriter();
				writer.println(memId);
			}else {
				System.out.println("일치하는ID없음");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
