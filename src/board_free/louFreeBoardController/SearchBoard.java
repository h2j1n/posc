package board_free.louFreeBoardController;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.xml.internal.messaging.saaj.packaging.mime.util.QEncoderStream;

import board_free.louFreeBoardService.ILouFreeBoardService;
import board_free.louFreeBoardService.LouFreeBoardServiceImpl;
import sun.rmi.server.Dispatcher;
import vo.LouFreeBoardVO;

@WebServlet("/SearchBoard.do")
public class SearchBoard extends HttpServlet {
	private static final long serialVersionUID = 1L;
    ILouFreeBoardService service = LouFreeBoardServiceImpl.getInstance(); 
    
    public SearchBoard() {
        super();
    }

	
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
   
    	String keyword = request.getParameter("keyword");
    	
    	System.out.println(keyword);
    		
    	List<LouFreeBoardVO> searchResult = service.searchList(keyword);
    	
    	int page = 1;
    	int pageSize = 10;
    	
    	if(request.getParameter("page")!=null) {
    		page =Integer.parseInt(request.getParameter("page"));
    	}
    	
    	int totalFrees = searchResult.size();
    	
    	int totalPage = (int)Math.ceil((double) totalFrees / pageSize);
    	
    	int start=(page -1 )*pageSize;
    	int end = Math.min(start + pageSize, totalFrees);
    	List<LouFreeBoardVO> freeBoardList = searchResult.subList(start, end);
    	
    	
    	request.setAttribute("totalPages", totalPage);
    	request.setAttribute("currentPage", page);
    	request.setAttribute("freeList", freeBoardList);
    	
    	request.getRequestDispatcher("/jsp/LouFreeBoard/louFreeBoard.jsp").forward(request, response);
    	
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
		
		
		
		
		

}
}