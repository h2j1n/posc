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


@WebServlet("/portRemove.do")
public class PortRemove extends HttpServlet {

	IMypageService mypageService;
    public PortRemove() {
    	mypageService = MypageServiceImpl.getInstance();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String port_no = request.getParameter("portNo");
		
		PortfolioVO portVO = new PortfolioVO();
		portVO.setPort_no(Integer.parseInt(port_no));
		portVO.setPort_delyn("Y");
		
		int status = mypageService.removePort(portVO);
		
		if(status > 0) {
			response.sendRedirect("/mypagePort.do");
		} else {
			response.sendRedirect("/portDetail.do");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
