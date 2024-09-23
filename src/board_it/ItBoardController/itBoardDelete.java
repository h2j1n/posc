package board_it.ItBoardController;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board_it.ItBoardSerivce.IItBoardService;
import board_it.ItBoardSerivce.ItBoardServiceImpl;

@WebServlet("/itBoardDelete.do")
public class itBoardDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static IItBoardService service = ItBoardServiceImpl.getInstance();
       
    public itBoardDelete() {
        super();
    }


    
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	String it_no = request.getParameter("it_no");
    	
    	
    	int status = service.deleteBoard(Integer.parseInt(it_no));
    	
    	
    	if(0<status) {
    		
    		System.out.println("삭제 성공");
    		
    		response.sendRedirect("/itBoardList.do");
    		
    		
    	}
    	
    	
    	
    	
    	
    	
    	
    	
	}

	
	
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
