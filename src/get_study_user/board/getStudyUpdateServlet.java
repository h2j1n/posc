package get_study_user.board;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import get_study_user.service.GetStudyListServiceImpl;
import get_study_user.service.IGetStudyListService;
import get_study_user.service.ISkillService;
import get_study_user.service.SkillServiceImpl;
import get_study_user.vo.GetStudyListVO;
import get_study_user.vo.GetStudyUserVO;
import get_study_user.vo.SkillVO;

@WebServlet("/getStudyUpdate.do")
public class getStudyUpdateServlet extends HttpServlet{

	
	private IGetStudyListService service  = GetStudyListServiceImpl.getInstance();
	private ISkillService  skillService= SkillServiceImpl.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String no = req. getParameter("gsu_no");
		GetStudyUserVO gsuVO = service.selectDetailBoard(Integer.parseInt(no));
		
		int userId = gsuVO.getUser_no();
		
		List<SkillVO> skillsList = skillService.selectSkillList();
		List<GetStudyListVO> getStudyList = skillService.selectStudyList(userId);	//30 : 회원 아이디 보내주면 됨.
		
		System.out.println("스킬출력");
		for(int i= 0; i<skillsList.size(); i++) {
			System.out.println(skillsList.get(i).getSgdt_Name());
		}
		
		req.setAttribute("skillsList", skillsList);
		req.setAttribute("getStudyList", getStudyList);
		req.setAttribute("gsuVO", gsuVO);
		req.getRequestDispatcher("/jsp/study/getStudyUpdate.jsp").forward(req,resp);
	
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		  String gsu_gubunTmp 	= req.getParameter("addType");		//스터디 & 프로젝트
		  int gsu_gubun;
		  if(gsu_gubunTmp.equals("스터디")) {
			  gsu_gubun = 0;
		  }else { //프로젝트일떄
			  gsu_gubun= 1;
		  }
		  
		  String gsu_no 		= req.getParameter("gsu_no");
		  String gsu_period 	= req.getParameter("date");			//진행기간
		  String gsu_skills 	= req.getParameter("skillSelect");	//기술 스택
		  String gsu_title 		= req.getParameter("title");		//제목
		  String gsu_content 	= req.getParameter("content");		//내용		  
		  String gsu_end 		= req.getParameter("endDate");		//마감 일자		  
		  String gsu_memcnt 	= req.getParameter("recruitment");	//모집 인원
		  
		  GetStudyUserVO gsuVO = new GetStudyUserVO();
		  int user_no 	= gsuVO.getUser_no();
		  
		  GetStudyUserVO std = service.selectDetailBoard(Integer.parseInt(gsu_no));
		  
		  gsuVO.setGsu_no(Integer.parseInt(gsu_no));
		  gsuVO.setGsu_period(gsu_period);
		  gsuVO.setGsu_skills(gsu_skills);
		  gsuVO.setGsu_end(gsu_end);
		  gsuVO.setGsu_title(gsu_title);
		  gsuVO.setGsu_content(gsu_content);
		  gsuVO.setGsu_memcnt(Integer.parseInt(gsu_memcnt));
		  gsuVO.setGsu_gubun(gsu_gubun);
		  gsuVO.setGsu_gubun(gsu_gubun);
		  gsuVO.setGsu_stdname(std.getGsu_stdname());
		  
		  //임시 값 저장
		  gsuVO.setUser_no(std.getUser_no());
		  
		  int status = service.getStudyUpdate(gsuVO);
			
		  if(status>0) { 	//성공
				resp.sendRedirect("/getStudyDetail.do?gsu_no="+gsu_no);
			
			}else {			//실패
				
				req.getRequestDispatcher("/getStudyUpdate.do?="+gsuVO.getGsu_no()).forward(req, resp);
			}
		
	}

	
	
	
}
