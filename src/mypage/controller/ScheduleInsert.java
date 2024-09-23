package mypage.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sun.jmx.snmp.Timestamp;

import mypage.service.IMypageService;
import mypage.service.MypageServiceImpl;
import mypage.vo.ScheduleVO;

@WebServlet("/scheduleInsert.do")
public class ScheduleInsert extends HttpServlet {
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		 String strDate = (String) request.getParameter("strDate");
		 String strTime = (String) request.getParameter("strTime");
		 String endDate = (String) request.getParameter("endDate");
		 String endTime = (String) request.getParameter("endTime");
		 String scd_title = (String) request.getParameter("scd_title");
		 
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
		 
		// oracle 날짜형식으로 변환한다.
		LocalDateTime startDateTime = LocalDateTime.parse(strDate + "T" + strTime);
	    LocalDateTime endDateTime = LocalDateTime.parse(endDate + "T" + endTime);
	        
	    DateTimeFormatter dbDateFormat = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm");
		
	    String scd_start = startDateTime.format(dbDateFormat);
        String scd_end = endDateTime.format(dbDateFormat);
		
        // 스케쥴을 추가한다.
	    IMypageService service = MypageServiceImpl.getInstance();
	    
	    ScheduleVO scheduleVO = new ScheduleVO();
	    scheduleVO.setScd_start(scd_start);
	    scheduleVO.setScd_end(scd_end);
	    scheduleVO.setScd_title(scd_title);
	    
//	    String sessionNo = 32; // 임시 유저번호
	    HttpSession session = request.getSession();
		Integer sessionNo = (Integer) session.getAttribute("userNo");
		
		int user_no = (int) sessionNo;
		scheduleVO.setUser_no(user_no);
	    
	    int status = service.registerSchedule(scheduleVO);
	    
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
