package user.userRLLController;

import java.io.IOException;
import java.time.DateTimeException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import get_study_user.vo.SkillVO;
import user.userRLLService.IMemberService;
import user.userRLLService.MemberServiceImpl;
import user.vo.SkillsVO;
import vo.MemberVO;


@WebServlet("/join.do")
public class JoinController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static IMemberService service = MemberServiceImpl.getInstance();
 
    public JoinController() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		List<SkillVO> skills = service.joinSkills();
		
		
		if(skills!=null) {
			request.setAttribute("skills",skills);
			
		}
		
		
		
		
		request.getRequestDispatcher("/jsp/member/join.jsp").forward(request, response);
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("<<<<<<<<<<<<<<<");
		
		
		
		try {
			String id = request.getParameter("id");
			String pass = request.getParameter("pass");
			String name = request.getParameter("name");
			String birthstr = request.getParameter("birth");
			DateTimeFormatter formatter=DateTimeFormatter.ofPattern("yyyy-MM-dd");
			LocalDate birth = LocalDate.parse(birthstr,formatter);
			String tel = request.getParameter("tel");
			String zip = request.getParameter("zip");
			String add1 = request.getParameter("add1");
			String add2 = request.getParameter("add2");
			String email = request.getParameter("email");
//			String selectedValues = request.getParameter("skills");
			String[] selectedValues = request.getParameterValues("skills");
			MemberVO mv = new MemberVO(id, pass, name, birth, tel, zip, add1, add2, null , email);
			int status = service.registerMember(mv);  //회원가입
			for(String sv : selectedValues) {
				mv.setUser_fav(sv);
				int skill = service.insertSkill(mv);			
			}
			
			//이걸 스트링 형태로 받아서 , 단위로 split 해서 [] 로만들어서 배열을 -> list or map ->에 담아서 이게 내가 선택한 값만 
			//반복문으로 찍어줘서 -> 내가 선택한 그 값들의 size만큼만 insert를 해준다 가능?
			
			
			
				//서블릿에서 받은 옵션 값들을 바탕으로(3개)-> 3개 만큼 반복 1번째 요소 인서트 -> 
			
			
			
			HttpSession msg = request.getSession();
			
			
			
			if(0<status) {
				msg.setAttribute("msg1", "회원가입에 성공하셨습니다!!");
				response.sendRedirect("/login.do");
				
				
			}else {
				msg.setAttribute("msg1", "회원가입에 실패하셨습니다!!");
				
				request.getRequestDispatcher("/jsp/member/join.jsp").forward(request, response);
				
			}
			
			
			
			
			
			
			
		}catch(DateTimeException e) {
			e.printStackTrace();
		}
		
		
		
		
		
		
		
		
		
		
		
		
	}

}
