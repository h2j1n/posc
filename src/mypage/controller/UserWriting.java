package mypage.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board_it.vo.ItBoardVO;
import get_study_user.vo.GetStudyUserVO;
import mypage.service.IMypageService;
import mypage.service.MypageServiceImpl;
import vo.LouFreeBoardVO;
import vo.MemberVO;


@WebServlet("/userWriting.do")
public class UserWriting extends HttpServlet {

	private IMypageService mypageService;
    public UserWriting() {
    	mypageService = MypageServiceImpl.getInstance();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		Integer sessionNo = (Integer) session.getAttribute("userNo");
		int user_no = (int) sessionNo;
		
		// 마이페이지 기본정보를 가져온다.
		MemberVO memberVO = mypageService.getMemberInfo(user_no);
		List<String> skills = mypageService.skillList(user_no);
		
		// 각 게시판의 게시글 목록을 가져온다. 
		List<ItBoardVO> itBoardList = mypageService.getItBoardList(user_no);
		List<LouFreeBoardVO> louFreeBoardList = mypageService.getFreeBoardList(user_no);
		List<GetStudyUserVO> getStudyUserList = mypageService.getStudyUserList(user_no);
		
		
		request.setAttribute("memberVO", memberVO);
		request.setAttribute("skills", skills);
		request.setAttribute("itBoardList", itBoardList);
		request.setAttribute("louFreeBoardList", louFreeBoardList);
		request.setAttribute("getStudyUserList", getStudyUserList);
		
		request.getRequestDispatcher("/jsp/mypage/userWriting.jsp")
			.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
