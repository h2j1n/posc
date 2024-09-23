package study.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import get_study_user.service.ISkillService;
import get_study_user.service.SkillServiceImpl;
import get_study_user.vo.SkillVO;
import study.service.IStdDetailService;
import study.service.StdDetailServiceImpl;
import study.vo.StudyVO;

@WebServlet("/updateStudyDetail.do")
public class updateStudyDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private IStdDetailService serviceDe = StdDetailServiceImpl.getInstance();
	private ISkillService service = SkillServiceImpl.getInstance();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String no = request.getParameter("no");
		System.out.println(no);
		StudyVO stdVO = serviceDe.getDetailInfo(Integer.parseInt(no));
		List<SkillVO> skillList = service.selectSkillList();
		
		request.setAttribute("stdVO", stdVO);
		request.setAttribute("skillList", skillList);
		
		request.getRequestDispatcher("jsp/study/studyUpdateForm.jsp").forward(request, response);
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String no = request.getParameter("no");
		
		StudyVO paramVO = serviceDe.getDetailInfo(Integer.parseInt(no));
		
		String std_name = request.getParameter("stdName");
		String std_strdt = request.getParameter("strDate");
		String std_enddt = request.getParameter("endDate");
		String sgbn_no = request.getParameter("skills");
		String std_cont = request.getParameter("stdCont");
		
		if(std_name==null || std_name.equals("")) {
			std_name = paramVO.getStd_name();
		}
		if(std_strdt==null || std_strdt.equals("")) {
			std_strdt = (paramVO.getStd_strdt().substring(0, 10));
		}
		if(std_enddt==null || std_enddt.equals("")) {
			std_enddt = (paramVO.getStd_enddt().substring(0, 10));
		}
		if(sgbn_no==null || sgbn_no.equals("")) {
			sgbn_no = Integer.toString(paramVO.getSgbn_no());
		}
		if(std_cont==null || std_cont.equals("")) {
			std_cont = paramVO.getStd_cont();
		}
		
		System.out.println(std_strdt);
		System.out.println(std_enddt);
		
		StudyVO studyVO = new StudyVO(Integer.parseInt(no), std_name, std_strdt, std_enddt, Integer.parseInt(sgbn_no), std_cont);

		boolean flag = serviceDe.updateStudyDetail(studyVO);
//		serviceDe.updateGetStudyName(std_name);
		if(flag) {
			response.sendRedirect("/studyDetail.do?no="+Integer.parseInt(no));
		}else {
			response.sendRedirect("/studyDetail.do?no="+Integer.parseInt(no));
		}
		
	}

}
