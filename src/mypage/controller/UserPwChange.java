package mypage.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mypage.service.IMypageService;
import mypage.service.MypageServiceImpl;
import vo.MemberVO;


@WebServlet("/userPwChange.do")
public class UserPwChange extends HttpServlet {

	IMypageService mypageService;
    public UserPwChange() {
    	mypageService = MypageServiceImpl.getInstance();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 세션정보를 가져온다.
		HttpSession session = request.getSession();
		Integer sessionNo = (Integer) session.getAttribute("userNo");
		int user_no = (int) sessionNo;
		
		// 유저 비밀번호를 가져온다.
		String user_pw = request.getParameter("newPw");
		
		
		// 비밀번호를 수정한다.
		MemberVO memberVO = new MemberVO();
		memberVO.setUser_no(user_no);
		memberVO.setUser_pw(user_pw);
		
		int status = mypageService.modifyUserPw(memberVO);
		
		String msg = "실패";
		if(status > 0) {
			msg = "성공";
		}
		
		request.getSession().setAttribute("msg", msg);
		response.sendRedirect("/mypagemain.do");
	}

}
