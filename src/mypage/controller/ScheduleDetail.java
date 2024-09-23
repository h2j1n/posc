package mypage.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import mypage.service.IMypageService;
import mypage.service.MypageServiceImpl;
import mypage.vo.ScheduleVO;




@WebServlet("/scheduleDetail.do")
public class ScheduleDetail extends HttpServlet {
	
	IMypageService mypageService;
	
	public ScheduleDetail() {
		mypageService = MypageServiceImpl.getInstance();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("[스케쥴 디테일]");
		
		String user_no = request.getParameter("user_no");
		String date = request.getParameter("date");
		
		System.out.println(date);
		System.out.println(user_no);
		
		Map<String, String> param = new HashMap<String, String>();
		param.put("user_no", user_no);
		param.put("date", date.replace("-", "/"));
		
		List<ScheduleVO> detailScheduleList =  mypageService.scheduleDetail(param);
		
		// 제이슨 문자열로 변환한다.
		ObjectMapper mapper = new ObjectMapper();
		String jsonScheduleList = mapper.writeValueAsString(detailScheduleList);
		
		// response로 응답한다.
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().print(jsonScheduleList);
	}

}
