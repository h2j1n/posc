package board_free.louFreeBoardController;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board_free.louFreeBoardService.ILouFreeBoardService;
import board_free.louFreeBoardService.LouFreeBoardServiceImpl;

@WebServlet("/DeleteBoard.do")
public class DeleteBoard extends HttpServlet {
	private static final long serialVersionUID = 1L;
       ILouFreeBoardService servce = LouFreeBoardServiceImpl.getInstance();
    public DeleteBoard() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String freeNO = request.getParameter("free_no");
			
			int cnt = servce.deleteBoard(Integer.parseInt(freeNO));
			
			String deleteMsg= "";
			
			if(0<cnt) {
					
				response.sendRedirect("/LouFreeList.do");
				
			}else {
				
				response.sendRedirect("/LouFreeList.do?free_no="+freeNO);
				
			}
			
			
			
			
			
		
		
		
		
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
						
	
	}

}
