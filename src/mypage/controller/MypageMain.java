package mypage.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



import mypage.service.IMypageService;
import mypage.service.MypageServiceImpl;
import mypage.vo.ScheduleVO;
import vo.MemberVO;

@WebServlet("/mypagemain.do")
public class MypageMain extends HttpServlet {
	
	private IMypageService mypageService;
	
	public MypageMain() {
		mypageService = MypageServiceImpl.getInstance();
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 세션정보를 가져온다.
		HttpSession session = request.getSession();
		String sessionId = (String) session.getAttribute("sessionName");

//		int sessionNo = 32; // 임시유저번호
		Integer sessionNo = (Integer) session.getAttribute("userNo");
		int user_no = (int) sessionNo;
		
		
		// 마이페이지 메인에 필요한 정보를 가져온다.
		// (사용자 정보)
		// (기술스택 리스트)
		// (일정 리스트)
		MemberVO memberVO = mypageService.getMemberInfo(user_no);
		List<String> skills = mypageService.skillList(user_no);
		List<ScheduleVO> scheduleVO = mypageService.scheduleList(user_no);
		
		
		// 페이지에 가져온 데이터를 전송한다.
		request.setAttribute("memberVO", memberVO);
		request.setAttribute("skills", skills);
		request.setAttribute("scheduleVO", scheduleVO);
		
		
		request.getRequestDispatcher("/jsp/mypage/mypageMain.jsp")
			.forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
}
