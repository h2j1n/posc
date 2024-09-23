package study.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study.service.IStdDetailService;
import study.service.StdDetailServiceImpl;
import study.vo.StudyLeaderVO;
import study.vo.StudyVO;

@WebServlet("/studyDetail.do")
public class studyDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private IStdDetailService service = StdDetailServiceImpl.getInstance();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String no = request.getParameter("no");
		
		StudyVO stdVO = service.getDetailInfo(Integer.parseInt(no));
		StudyLeaderVO slVO = service.getStudyLeader(Integer.parseInt(no)); 
		service.plusHit(Integer.parseInt(no));
		
		System.out.println("slvo"+slVO.getUser_id());
		request.setAttribute("stdVO", stdVO);
		request.setAttribute("slVO", slVO);
		
		request.getRequestDispatcher("jsp/study/studyDetail.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
