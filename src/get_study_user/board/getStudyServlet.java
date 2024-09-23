package get_study_user.board;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import get_study_user.service.GetStudyListServiceImpl;
import get_study_user.service.IGetStudyListService;
import get_study_user.vo.GetStudyUserVO;
import main.service.IMainHotService;

import main.service.MainHotServiceImpl;

import main.vo.MainHotVO;
import main.vo.MainNewVO;
import vo.MemberVO;


@WebServlet("/getStudy.do")
public class getStudyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    IMainHotService serviceHot = MainHotServiceImpl.getInstance();
    IGetStudyListService gslService = GetStudyListServiceImpl.getInstance();
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//세션 아이디 가져옴
				HttpSession session = request.getSession();
				Integer userId = (Integer) session.getAttribute("userNo");
		
		List<MainHotVO> hotList = serviceHot.getHotList();
		List<GetStudyUserVO> allStudyList = gslService.getStudyList();
		
		
		request.setAttribute("hotList", hotList);
		request.setAttribute("getStudyList", allStudyList);
		
		
		request.getRequestDispatcher("jsp/study/getStudyLounge.jsp").forward(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		
	}

}

