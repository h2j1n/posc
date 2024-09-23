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
import mypage.vo.UserStudyInfo;

@WebServlet("/portAdd.do")
public class PortAdd extends HttpServlet {
	
	private IMypageService mypageService;
	
    public PortAdd() {
    	mypageService = MypageServiceImpl.getInstance();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		Integer sessionNo = (Integer) session.getAttribute("userNo");
		int user_no = (int) sessionNo;
		
		// 유저가 구성원이었던 스터디 정보를 가져온다.
		List<UserStudyInfo> userStudyList = mypageService.userStudyInfoList(user_no); 
		
		request.setAttribute("userStudyList", userStudyList);
		
		request.getRequestDispatcher("/jsp/mypage/portAdd.jsp")
			.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		Integer sessionNo = (Integer) session.getAttribute("userNo");
		int user_no = (int) sessionNo;
		
		String port_title = request.getParameter("title");
		String port_content = request.getParameter("content");
		
		PortfolioVO portfolioVO = new PortfolioVO();
		portfolioVO.setPort_title(port_title);
		portfolioVO.setPort_content(port_content);
		portfolioVO.setUser_no(user_no);
		
		int status = mypageService.registerPort(portfolioVO);
		
		if(status > 0) {
			response.sendRedirect("/mypagePort.do");
		} else {
			request.getRequestDispatcher("/jsp/mypage/portAdd.jsp");
		}
	}

}
