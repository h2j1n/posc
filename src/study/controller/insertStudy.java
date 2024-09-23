package study.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import study.service.IStdDetailService;
import study.service.StdDetailServiceImpl;
import study.vo.PlanStudyVO;
import study.vo.StudyVO;

@WebServlet("/insertStudy.do")
public class insertStudy extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private IStdDetailService service = StdDetailServiceImpl.getInstance();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("jsp/study/studyInsertForm.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession sessionID = request.getSession();
		
		int std_no = service.getMaxNo();
		String std_name = request.getParameter("stdName");
		String std_strdt = request.getParameter("strDate");
		String std_enddt = request.getParameter("endDate");
		Integer user_no = (Integer)sessionID.getAttribute("userNo");
		String sgbn_no = request.getParameter("skills");
		String std_cont = request.getParameter("stdCont");
		
		PlanStudyVO paramVO
		= new PlanStudyVO(std_name, std_strdt.substring(0,10), 
				std_enddt.substring(0,10), user_no, 
				Integer.parseInt(sgbn_no), std_cont);
		
		PlanStudyVO paramVO2 = new PlanStudyVO(std_no+1, user_no);
		
		boolean flag1 = service.insertStudy(paramVO);
		boolean flag2 = service.insertStudyMember(paramVO2);
		
		if(flag1&&flag2) {
			response.sendRedirect("/studyMain.do");
		}else {
			response.sendRedirect("/studyMain.do");
		}
		
		
	}

}
