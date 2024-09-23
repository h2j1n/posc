package board_it.ItBoardController;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.adminLoginService.AdminServiceImpl;
import admin.adminLoginService.IAdminService;
import board_it.ItBoardSerivce.IItBoardService;
import board_it.ItBoardSerivce.ItBoardServiceImpl;
import board_it.vo.ItBoardVO;
import board_it.vo.ItVo;

@WebServlet("/itRegisterBoard.do")
public class itRegisterBoard extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static IItBoardService service = ItBoardServiceImpl.getInstance();
	
    public itRegisterBoard() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("jsp/lou_it/itBoardRegister.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String user_no = request.getParameter("userNo"); //세션 유저No
		String eventTitle = request.getParameter("eventTitle");//행사명
		String content = request.getParameter("content1");//내용
		String sDate = request.getParameter("eventDate1");//시작일
		String eDate = request.getParameter("eventDate2");//종료일

		String eventType = request.getParameter("eventType");//행사유형
		String eventOrgan = request.getParameter("eventOrgan");//주최기간
		String eventGbu = request.getParameter("eventGbu");//행사구분
		String eventLink = request.getParameter("eventLink");//행사링크
		String evnetPlace = request.getParameter("evnetPlace");//행사장소
		String endDate = request.getParameter("endDate");//모집 마갑일
		String mainImg = request.getParameter("mainImg");//메인이미지
		
		
//		ItVo iv = new ItVo(eventTitle, eventType, sDate, eDate, eventOrgan, eventGbu, eventLink, evnetPlace, endDate, mainImg, content);
		ItVo iv = new ItVo(eventTitle, content, sDate, eDate, eventGbu, eventType, eventLink, endDate, eventOrgan, evnetPlace, mainImg);
		iv.setUser_no(Integer.parseInt(user_no));
		
		int status = service.registerBoard(iv);
		
		if(0<status) {
			
			
			
			
			System.out.println("It홍보 게시글 작성 성공");
			
			response.sendRedirect("/itBoardDetail.do?it_no="+iv.getIt_no());
			
			
		}else {
			
			System.out.println("It홍보 게시글 작성 실패");
			
			
		}
		
		
		
		
		
		
		
		
		
		
	}

}
