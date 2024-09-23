package mypage.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mypage.service.IMypageService;
import mypage.service.MypageServiceImpl;

@WebServlet("/cancelStudy.do")
public class CancelStudy extends HttpServlet {
	
	private IMypageService mypageService;
    public CancelStudy() {
    	mypageService = MypageServiceImpl.getInstance();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String apNo = request.getParameter("apNo");
		int ap_no = Integer.parseInt(apNo);
		
		int status = mypageService.cancelStudy(ap_no);
		
		String msg = "";
		if(status > 0) {
			msg="성공";
		} else {
			msg="실패";
		}
		request.getSession().setAttribute("msg", msg);
		response.sendRedirect("/mypageStudy.do");
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
