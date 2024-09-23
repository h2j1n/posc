package board_free.louFreeBoardController;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board_free.louFreeBoardService.ILouFreeBoardService;
import board_free.louFreeBoardService.LouFreeBoardServiceImpl;
import vo.LouFreeBoardVO;

@WebServlet("/UpdateBoard.do")
public class UpdateBoard extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ILouFreeBoardService service = LouFreeBoardServiceImpl.getInstance();
	
    public UpdateBoard() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String BoardNoStr = request.getParameter("free_no");
		
		int BoardNo = Integer.parseInt(BoardNoStr);
		
		LouFreeBoardVO boardVO = service.detailBoard(BoardNo);
		
		request.setAttribute("freeNo",BoardNoStr);  //게시글 번호
		
		request.setAttribute("boardVo", boardVO);	// 게시글  VO
		
		request.getRequestDispatcher("/jsp/LouFreeBoard/louFreeBoardUpdate.jsp").forward(request, response);
		
	}
		
		

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String writer = request.getParameter("writer");
		String freeNo = request.getParameter("freeNo");
		
		LouFreeBoardVO boardVO = new LouFreeBoardVO(Integer.parseInt(freeNo),title, content,Integer.parseInt(writer));
		
		int cnt = service.UpdateBoard(boardVO);
		
		String msg = "";
		if(0<cnt) {
			
			//응답을 자동처리?느낌 get방식으로 쏘니까 detail.do/free_no, resulst msg를 보내니까 이걸 datail.do에서 getparmeter로 쓸수있음
			response.sendRedirect(request.getContextPath() + "/LoutFreeBoardDetail.do?free_no="+freeNo+"&resultMsg=1");
		}else {
			request.setAttribute("msg", "0");
			request.getRequestDispatcher("/jsp/LouFreeBoard/louFreeBoardUpdate.jsp").forward(request, response);
		}
		
	}
	

}
