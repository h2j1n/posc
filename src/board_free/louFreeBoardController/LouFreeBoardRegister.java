package board_free.louFreeBoardController;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board_free.louFreeBoardService.ILouFreeBoardService;
import board_free.louFreeBoardService.LouFreeBoardServiceImpl;
import vo.LouFreeBoardVO;
import vo.MemberVO;

@WebServlet("/LoutFreeBoardRegister.do")
public class LouFreeBoardRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static ILouFreeBoardService servcie = LouFreeBoardServiceImpl.getInstance();
       
    public LouFreeBoardRegister() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

			//세션에서 꺼내쓰고
		
			MemberVO memberVO = new MemberVO();
			
			
			HttpSession session = request.getSession();
			
			
		
			request.getRequestDispatcher("/jsp/LouFreeBoard/louFreeBoardRegister.jsp").forward(request, response);
			
	
	
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		HttpSession session = request.getSession();
		Integer userNo = (Integer) session.getAttribute("userNo");
		Integer admNo = (Integer) session.getAttribute("admNo");
		
		
		int writer = 0;
		if(userNo != null) {
			writer = userNo;
			System.out.println(writer);
		}else {
			writer = admNo;
		}
		
		
	
		LouFreeBoardVO louFreeBoardVO = new LouFreeBoardVO(title, content, writer);
		int cnt = servcie.RegisterBoard(louFreeBoardVO);
		
		
		if(0<cnt) {
			response.sendRedirect("/LoutFreeBoardDetail.do?free_no="+louFreeBoardVO.getFree_no());
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}

}
