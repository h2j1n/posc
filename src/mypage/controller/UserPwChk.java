package mypage.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.databind.ObjectMapper;

import mypage.service.IMypageService;
import mypage.service.MypageServiceImpl;
import vo.MemberVO;


@WebServlet("/userPwChk.do")
public class UserPwChk extends HttpServlet {

	private IMypageService mypageService; 
    public UserPwChk() {
    	mypageService = MypageServiceImpl.getInstance();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 유저 정보를 가져온다.
		HttpSession session = request.getSession();
		Integer sessionNo = (Integer) session.getAttribute("userNo");
		int user_no = (int) sessionNo;
		
		// 비밀번호를 가져온다.
		String user_pw = request.getParameter("user_pw");
		
		MemberVO memberVO = new MemberVO();
		memberVO.setUser_no(user_no);
		memberVO.setUser_pw(user_pw);
		
		// 비밀번호를 재확인한다.
		int chkStatus = mypageService.pwChk(memberVO);
		
		String msg = "실패";
		if(chkStatus > 0) {
			msg = "성공";
		}
		
		
		// 결과값을 Json으로 변환하여 전송한다.
		ObjectMapper mapper = new ObjectMapper();
		String jsonMsg = mapper.writeValueAsString(msg);
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().print(jsonMsg);
	}

}
