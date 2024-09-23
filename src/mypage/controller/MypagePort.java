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
import mypage.vo.PortfolioVO;
import vo.MemberVO;


@WebServlet("/mypagePort.do")
public class MypagePort extends HttpServlet {

	IMypageService mypageService;
    public MypagePort() {
    	mypageService = MypageServiceImpl.getInstance();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		Integer sessionNo = (Integer) session.getAttribute("userNo");
		int user_no = (int) sessionNo;
		
		// 포트폴리오 정보를 가져온다.
		List<PortfolioVO> portliList = mypageService.getPortfolio(user_no);
		
		// 회원정보를 가져온다.
		MemberVO memberVO = mypageService.getMemberInfo(user_no);
		
		// 스킬정보를 가져온다.
		List<String> skills = mypageService.skillList(user_no);
		
		
		
		request.setAttribute("portList", portliList);
		request.setAttribute("memberVO", memberVO);
		request.setAttribute("skills", skills);
		
		request.getRequestDispatcher("/jsp/mypage/portMain.jsp")
			.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
