package mypage.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board_it.ItBoardController.itRegisterBoard;
import get_study_user.vo.SkillVO;
import mypage.service.IMypageService;
import mypage.service.MypageServiceImpl;
import mypage.vo.ToUpdateSkillVO;
import user.userRLLService.IMemberService;
import user.userRLLService.MemberServiceImpl;
import vo.MemberVO;


@WebServlet("/userModify.do")
public class UserModify extends HttpServlet {
	
	private IMypageService mypageService;
	public UserModify() {
		mypageService = MypageServiceImpl.getInstance();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 세션정보를 가져온다.
		HttpSession session = request.getSession();
		Integer sessionNo = (Integer) session.getAttribute("userNo");
		int user_no = (int) sessionNo;
		
		// 기존 회워정보를 가져온다.
		MemberVO memberVO = mypageService.getMemberInfo(user_no);
		
		// 전체 스킬정보를 가져온다.
		IMemberService memberService = MemberServiceImpl.getInstance();
		List<SkillVO> skills = memberService.joinSkills();
		
		// 유저의 기술스택을 가져온다.
		List<String> userSkills = mypageService.skillList(user_no);
		
		
		request.setAttribute("memberVO", memberVO);
		request.setAttribute("skills", skills);
		request.setAttribute("userSkills", userSkills);
		request.getRequestDispatcher("jsp/mypage/userModify.jsp")
			.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 세션정보를 가져온다.
		HttpSession session = request.getSession();
		Integer sessionNo = (Integer) session.getAttribute("userNo");
		int user_no = (int) sessionNo;
		
		// 수정할 데이터를 가져온다.
		String name = request.getParameter("name");
		String birthstr = request.getParameter("birth");
		DateTimeFormatter formatter=DateTimeFormatter.ofPattern("yyyy-MM-dd");
		LocalDate birth = LocalDate.parse(birthstr,formatter);
		String tel = request.getParameter("tel");
		String zip = request.getParameter("zip");
		String add1 = request.getParameter("add1");
		String add2 = request.getParameter("add2");
		String email = request.getParameter("email");
		
		MemberVO memberVO = new MemberVO();
		memberVO.setUser_no(user_no);
		memberVO.setUser_name(name);
		memberVO.setUser_bir(birth);
		memberVO.setUser_tel(tel);
		memberVO.setUser_zip(zip);
		memberVO.setUser_add1(add1);
		memberVO.setUser_add2(add2);
		memberVO.setUser_email(email);
		
		int status = mypageService.modifyUser(memberVO);
		
		// [기술스택 수정] 
		
		// 업데이트한 기술스택 정보를 가져온다. 
		String selectedValues = request.getParameter("selectedValues");
		String[] newSkills = selectedValues.split(",");
		
		// 사용자의 기존 기술스택 정보를 가져온다.
		List<ToUpdateSkillVO> upSkillList = mypageService.getUpSkillLis(user_no);
		
		
		// 삭제할 데이터를 구한다.
		List<String> delSkillList = new ArrayList<String>();
		boolean isDel;
		
		for(ToUpdateSkillVO upskill : upSkillList) {
			isDel = true;
			for(String newSkill : newSkills) {
				// 기존 유저의 기술스택과 같은 기술이 있다면, 삭제하지 않는다.
				if(upskill.getSgdt_name().equals(newSkill)) {
					isDel = false;
					break;
				}
			}
			if(isDel) {
				delSkillList.add(upskill.getSgdt_name());
			}
		}
		
		// 기술스택을 삭제한다.
		int status2 = 0;
		try {
			if(delSkillList.size() == 0) {
				status2 = 1;
			} else {
				for(String delSkill : delSkillList) {
					for(ToUpdateSkillVO upSkillVO : upSkillList) {
						if(upSkillVO.getSgdt_name().equals(delSkill)) {
							status2 = mypageService.removeSkill(upSkillVO);
						}
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		// 추가할 데이터를 구한다.
		List<String> addSkillList = new ArrayList<String>();
		boolean isAdd;
		for(String newSkill : newSkills) {
			isAdd = true;
			for(ToUpdateSkillVO upskill : upSkillList) {
				// 새로운 기술중, 기존에 있는 기술이라면 추가하지 않는다.
				if(newSkill.equals(upskill.getSgdt_name())) {
					isAdd = false;
				}
			}
			
			if(isAdd && !newSkill.equals("")) {
				addSkillList.add(newSkill);
			}
		}
		
		int status3 = 0;
		try {
			if(addSkillList.size() == 0) {
				status3 = 1;
			} else {
				ToUpdateSkillVO addVO = new ToUpdateSkillVO();
				addVO.setUser_no(user_no);
				for(String addSkill : addSkillList) {
					addVO.setSgdt_name(addSkill);
					status3 = mypageService.registerSkill(addVO);
				}
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		
		
		String msg = "";
		if(status > 0 && status2 > 0 && status3 > 0) {
			msg = "성공";
		}else {
			msg = "실패";
		}
		
		request.getSession().setAttribute("msg", msg);
		response.sendRedirect("/mypagemain.do");
	}
}
