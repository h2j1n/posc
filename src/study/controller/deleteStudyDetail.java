package study.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study.service.IStdDetailService;
import study.service.StdDetailServiceImpl;

@WebServlet("/deleteStudyDetail.do")
public class deleteStudyDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private IStdDetailService service = StdDetailServiceImpl.getInstance();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String no = request.getParameter("no");
		System.out.println("no : "+no);
		String login = (String) request.getParameter("login");
		System.out.println("login : "+login);
		boolean flag = service.deleteStudyDetail(Integer.parseInt(no));
		
		if(flag) {
			response.sendRedirect("/studyMain.do");
		}else {
			response.sendRedirect("/studyMain.do");
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
