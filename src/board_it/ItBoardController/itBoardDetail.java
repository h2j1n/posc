package board_it.ItBoardController;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.google.gson.Gson;

import board_it.ItBoardSerivce.IItBoardService;
import board_it.ItBoardSerivce.ItBoardServiceImpl;
import board_it.vo.ItVo;

@WebServlet("/itBoardDetail.do")
public class itBoardDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private static IItBoardService service = ItBoardServiceImpl.getInstance();
    public itBoardDetail() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String it_no = request.getParameter("it_no");
		HttpSession session = request.getSession();
		Integer admNo =(Integer)session.getAttribute("admId");
		
		if(admNo == null) {
			admNo = 0;
			request.setAttribute("admNo", admNo);
		}
		
		
		
		
		ItVo iv = service.detailItBoard(Integer.parseInt(it_no));
		
		//응답으로 넘기기 전 문자열로 변환하기 >> gson
//		Gson gson = new Gson();  	//gson 객체 생성
//		String json = gson.toJson(iv);	//gson은 모든 객체를 다 object형태로 받아주는것 iv를 object 형태로 받아서 json
		
		if(iv!=null) {
		System.out.println("불러오기 성공");
		request.setAttribute("iv", iv);
		
//		response.setCharacterEncoding("utf-8");
//		response.getWriter().print(json);
//			
		
		
		
		}else {
			System.out.println("불러오기 실패");
		}
		request.getRequestDispatcher("jsp/lou_it/itBoardDetail.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
