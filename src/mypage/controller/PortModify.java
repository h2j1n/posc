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
import sun.security.provider.certpath.OCSPResponse.ResponseStatus;


@WebServlet("/portModify.do")
public class PortModify extends HttpServlet {

	IMypageService mypageService;
    public PortModify() {
    	mypageService = MypageServiceImpl.getInstance();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String port_no = request.getParameter("portNo");
		
		PortfolioVO portVO = mypageService.getPortDetail(Integer.parseInt(port_no));
		
		request.setAttribute("portVO", portVO);
		
		request.getRequestDispatcher("/jsp/mypage/portModify.jsp")
			.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String port_no = request.getParameter("portNo");
		String port_title = request.getParameter("title");
		String port_content = request.getParameter("content");
		
		PortfolioVO portVO = new PortfolioVO();
		
		portVO.setPort_no(Integer.parseInt(port_no));
		portVO.setPort_title(port_title);
		portVO.setPort_content(port_content);
		
		int status = mypageService.modifyPort(portVO);
		
		if(status > 0) {
			response.sendRedirect("portDetail.do?portNo=" + portVO.getPort_no());
		} else {
			request.getRequestDispatcher("/jsp/mypage/portModify.jsp");
		}
	}

}
