package mypage.controller;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mypage.service.IMypageService;
import mypage.service.MypageServiceImpl;
import mypage.vo.ScheduleVO;


@WebServlet("/scheduleUpdate.do")
public class ScheduleUpdate extends HttpServlet {

	private IMypageService mypageService;
    public ScheduleUpdate() {
         mypageService = MypageServiceImpl.getInstance();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("스케쥴 업데이트!");
		
		String scd_no = (String) request.getParameter("upScd_no");
		String strDate = (String) request.getParameter("strDate");
		String strTime = (String) request.getParameter("strTime");
		String endDate = (String) request.getParameter("endDate");
		String endTime = (String) request.getParameter("endTime");
		String scd_title = (String) request.getParameter("scd_title");
		
		System.out.println("scd_no : " + scd_no);
		System.out.println("strDate : " + strDate);
		System.out.println("strTime : " + strTime);
		System.out.println("endDate : " + endDate);
		System.out.println("endTime : " + endTime);
		System.out.println("scd_title : " + scd_title);
		
		// 입력정보가 비었을 경우, 실패 처리한다.
		String msg = "실패";
		if(strDate == null || strDate.equals("")
			|| strTime == null || strTime.equals("")
			|| endDate == null || endDate.equals("")
			|| endTime == null || endTime.equals("")
			|| scd_title == null || scd_title.equals("")) {
					
			request.getSession().setAttribute("msg", msg);
			response.sendRedirect("/mypagemain.do");
			return;
		}
		
		// 유저 번호를 가져온다.
		HttpSession session = request.getSession();
		Integer sessionNo = (Integer) session.getAttribute("userNo");
		
		// oracle 날짜형식으로 변환한다.
		LocalDateTime startDateTime = LocalDateTime.parse(strDate + "T" + strTime);
	    LocalDateTime endDateTime = LocalDateTime.parse(endDate + "T" + endTime);
			        
		DateTimeFormatter dbDateFormat = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm");
		
		String scd_start = startDateTime.format(dbDateFormat);
		String scd_end = endDateTime.format(dbDateFormat);
		
		// 스케쥴을 추가한다.
		IMypageService service = MypageServiceImpl.getInstance();
			
		ScheduleVO scheduleVO = new ScheduleVO();
		scheduleVO.setScd_no(Integer.parseInt(scd_no));
		scheduleVO.setScd_start(scd_start);
		scheduleVO.setScd_end(scd_end);
		scheduleVO.setScd_title(scd_title);
		scheduleVO.setUser_no((int)sessionNo);
			
		int status = service.modifySchedule(scheduleVO);
			
		if(status > 0) {
			System.out.println("일정수정 성공!");
			msg = "성공";
		} else {
			System.out.println("DB 일정수정 실패!");
		}
		request.getSession().setAttribute("msg", msg);
		response.sendRedirect("/mypagemain.do");
	}
}
