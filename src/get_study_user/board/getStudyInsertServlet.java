package get_study_user.board;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itextpdf.text.log.SysoCounter;

import get_study_user.service.ISkillService;
import get_study_user.service.SkillServiceImpl;
import get_study_user.vo.SkillVO;
import get_study_user.vo.GetStudyListVO;
import get_study_user.vo.GetStudyUserVO;

@WebServlet("/team.do")
public class getStudyInsertServlet extends HttpServlet {
	
	
	private static final long serialVersionUID = 1L;

	private ISkillService service = SkillServiceImpl.getInstance();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
		  // 세션정보를 가져온다. 
		  HttpSession session = request.getSession(); 
		  String sessionId =(String) session.getAttribute("sessionName");
		  
	
		Integer sessionNo = (Integer)session.getAttribute("userNo"); 
		  int user_no = (int) sessionNo;
		 
//		//세션 아이디 가져옴
//				HttpSession session = request.getSession();
//				Integer userId = (Integer) session.getAttribute("userNo");
				
		List<SkillVO> skillList = service.selectSkillList();
		request.setAttribute("skillList", skillList);
		
		List<GetStudyListVO> getStudyList = service.selectStudyList(user_no);	//30 : 회원 아이디 보내주면 됨.
		request.setAttribute("getStudyList", getStudyList);
		
		request.getRequestDispatcher("jsp/study/getStudyMember.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		  

		  // 세션정보를 가져온다. 
		  HttpSession session = request.getSession(); 
		  String sessionId =(String) session.getAttribute("sessionName");
		  
	
		Integer sessionNo = (Integer)session.getAttribute("userNo"); 
		  int user_no = (int) sessionNo;
		  
		  String gsu_gubunTmp 	= request.getParameter("addType");		//스터디 & 프로젝트
		  int gsu_gubun;
		  if(gsu_gubunTmp.equals("스터디")) {
			  gsu_gubun = 0;
		  }else { //프로젝트일떄
			  gsu_gubun= 1;
		  }
		  
		  String gsu_period 	= request.getParameter("date");			//진행기간
		  String gsu_skills 	= request.getParameter("skillSelect");	//기술 스택
		  String gsu_title 		= request.getParameter("title");		//제목
		  String gsu_content 	= request.getParameter("content");	//내용		  
		  String gsu_end 		= request.getParameter("endDate");		//마감 일자		  
		  String gsu_memcnt 	= request.getParameter("recruitment");	//모집 인원
		  
		  
		  String std_name 	= request.getParameter("studySelect");	//스터디 출력해야함..........
		  
			
			/*
			 * System.out.println(gsu_gubunTmp); System.out.println(gsu_period);
			 * System.out.println(gsu_skills); System.out.println(gsu_title);
			 * System.out.println(gsu_content); System.out.println(gsu_end);
			 * System.out.println(gsu_memcnt);
			 */
			 
		  
		  GetStudyUserVO gsuVO = new GetStudyUserVO();
		  
		  gsuVO.setGsu_period(gsu_period);
		  gsuVO.setGsu_skills(gsu_skills);
		  gsuVO.setGsu_end(gsu_end);
		  gsuVO.setGsu_title(gsu_title);
		  gsuVO.setGsu_content(gsu_content);
		  gsuVO.setGsu_memcnt(Integer.parseInt(gsu_memcnt));
		  gsuVO.setGsu_gubun(gsu_gubun);
		  gsuVO.setGsu_gubun(gsu_gubun);
		  gsuVO.setGsu_stdname(std_name);
		  
		  //임시 값 저장
		  gsuVO.setUser_no(user_no);
		  
		  int status = service.insertStudyMemBoard(gsuVO);
			if(status>0) { //성공
//				request.getRequestDispatcher("jsp/study/getStudyLounge.jsp").forward(request, response);	//URL을 적어줌. , boardVO.getNo() : db에 등록하고 등록한 후 최신 시퀀스 값으 ㄹ가져옴
				response.sendRedirect("/getStudy.do");
			}else {	//실패
				
				request.getRequestDispatcher("jsp/study/getStudyLounge.jsp").forward(request, response);
			}
		  
			
	}

}
