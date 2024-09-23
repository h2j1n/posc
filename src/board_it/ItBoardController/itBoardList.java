package board_it.ItBoardController;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board_it.ItBoardSerivce.IItBoardService;
import board_it.ItBoardSerivce.ItBoardServiceImpl;
import board_it.vo.ItVo;

@WebServlet("/itBoardList.do")
public class itBoardList extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static IItBoardService service = ItBoardServiceImpl.getInstance();
       
    public itBoardList() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		List<ItVo> ivList = service.getListBoard(); 
	
		if(ivList!=null) {
			
			request.setAttribute("ivList",ivList );
			
			
		}
		
		
		
		request.getRequestDispatcher("jsp/lou_it/itBoardList.jsp").forward(request, response);
		
		
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
