package board_it.ItBoardController;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board_it.ItBoardSerivce.IItBoardService;
import board_it.ItBoardSerivce.ItBoardServiceImpl;
import board_it.vo.ItVo;

@WebServlet("/itBoardUpdate.do")
public class itBoardUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static IItBoardService service = ItBoardServiceImpl.getInstance();
       
    public itBoardUpdate() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String it_no = request.getParameter("it_no");
		
		ItVo iv = service.detailItBoard(Integer.parseInt(it_no));
		
		if(iv!=null) {
			request.setAttribute("iv", iv);
			
		}else {
			System.out.println("정보가져오기 실패");
			
		}
		
		
		
		request.getRequestDispatcher("jsp/lou_it/itBoardUpdate.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String it_no = request.getParameter("it_no");
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
		
		ItVo iv = new ItVo(Integer.parseInt(it_no),eventTitle, content, sDate, eDate, eventGbu, eventType, eventLink, endDate, eventOrgan, evnetPlace, mainImg);
		
		int status = service.updateBoard(iv);
		
		
		
		
		if(0<status) {
			System.out.println("업데이트 성공");
			response.sendRedirect("/itBoardDetail.do?it_no="+iv.getIt_no());
			
			
		}else {
			
			System.out.println("업데이트 실패");
			request.getRequestDispatcher("/itBoardUpdate.do?it_no="+iv.getIt_no()).forward(request, response);
		}
		
		
		
	}

}
