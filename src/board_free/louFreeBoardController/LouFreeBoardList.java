package board_free.louFreeBoardController;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board_free.louFreeBoardService.ILouFreeBoardService;
import board_free.louFreeBoardService.LouFreeBoardServiceImpl;
import vo.LouFreeBoardVO;

@WebServlet("/LouFreeList.do")
public class LouFreeBoardList extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ILouFreeBoardService service = LouFreeBoardServiceImpl.getInstance();
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		int page = 1;  //현재 페이지
		
		
		int pageSize = 10;	//한번에 출력할 게시글 사이즈
		
		if(request.getParameter("page")!=null) {       //디폴트 1 -> 요청이있으면 그페이지 번호 반환
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		int totalFrees = service.getTotalFrees();
		
		int totalPages = (int) Math.ceil((double)totalFrees/pageSize)+1;
		
		List<LouFreeBoardVO> freeList = service.pageBoardList(page,pageSize);
		
		
		request.setAttribute("freeList",freeList );
		request.setAttribute("totalPages",totalPages );
		request.setAttribute("currentPage",page );
		
		
		
		request.getRequestDispatcher("/jsp/LouFreeBoard/louFreeBoard.jsp").forward(request, response);
		
		
		
		
		
		
		
//		List<LouFreeBoardVO> boardList = service.FreeBoardList();
//		
//		
//		request.setAttribute("LouFreeBoardList", boardList);
//		
//		request.getRequestDispatcher("/jsp/LouFreeBoard/louFreeBoard.jsp").forward(request, response);

		
		
		
		
		
		
		
		
		
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	doGet(request, response);

		
		
	}


}