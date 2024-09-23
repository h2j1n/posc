package mypage.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import mypage.service.IMypageService;
import mypage.service.MypageServiceImpl;
import mypage.vo.UserStudyInfo;
import mypage.vo.UserStudyNoProInfo;
import mypage.vo.UserStudyProInfo;
import vo.MemberVO;


@WebServlet("/mypageStudy.do")
public class MypageStudy extends HttpServlet {

	private IMypageService mypageService;
    public MypageStudy() {
    	mypageService = MypageServiceImpl.getInstance();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		Integer sessionNo = (Integer) session.getAttribute("userNo");
		
//		String sessionNo = 32; // 임시유저번호
		int user_no = (int) sessionNo;
		
		// 기본 유저정보를 가져온다.
		MemberVO memberVO = mypageService.getMemberInfo(user_no);
		List<String> skills = mypageService.skillList(user_no);
		
		// 유저의 스터디 정보를 가져온다.
		List<UserStudyInfo> studyinfoList = mypageService.userStudyInfoList(user_no);
		
		// 유저가 신청한 스터디 정보를 가져온다. (처리 완료된 내역)
		List<UserStudyProInfo> studyProList = mypageService.userStudyProList(user_no);
		
		// 유저가 신청한 스터디 정보를 가져온다. (미처리 내역)
		List<UserStudyNoProInfo> studyNoProList = mypageService.userStudyNoProList(user_no);
		
		
		// 페이지에 가져온 데이터를 전송한다.
		request.setAttribute("memberVO", memberVO);
		request.setAttribute("skills", skills);
		request.setAttribute("studyInfoList", studyinfoList);
		request.setAttribute("studyProList", studyProList);
		request.setAttribute("studyNoProList", studyNoProList);
		
		request.getRequestDispatcher("/jsp/mypage/mypageStudy.jsp")
			.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
