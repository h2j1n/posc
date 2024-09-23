package mypage.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mypage.service.IMypageService;
import mypage.service.MypageServiceImpl;
import mypage.vo.PortfolioVO;


@WebServlet("/portDetail.do")
public class PortDetail extends HttpServlet {

	private IMypageService mypageService;
    public PortDetail() {
    	mypageService = MypageServiceImpl.getInstance();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String port_no = request.getParameter("portNo");
		
		PortfolioVO portVO = 
					mypageService.getPortDetail(Integer.parseInt(port_no));
		
		request.setAttribute("portVO", portVO);
		
		request.getRequestDispatcher("/jsp/mypage/portDetail.jsp")
			.forward(request, response);;
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
