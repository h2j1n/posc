package mypage.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mypage.service.IMypageService;
import mypage.service.MypageServiceImpl;


@WebServlet("/scheduleDelete.do")
public class ScheduleDelete extends HttpServlet {
       
	private IMypageService mypageService;
    public ScheduleDelete() {
    	mypageService = MypageServiceImpl.getInstance();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("일정 삭제!");
		
		String scd_no = (String) request.getParameter("scd_no");
		System.out.println(scd_no);
		
		int status = mypageService.removeSchedule(scd_no);

		String msg = "실패";
		if(status > 0) {
	    	System.out.println("일정등록 성공!");
	    	msg = "성공";
	    } else {
			System.out.println("DB 일정등록 실패!");
		}
	    request.getSession().setAttribute("msg", msg);
		response.sendRedirect("/mypagemain.do");
	}
}
