package board_post.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board_post.service.IPostBoardService;
import board_post.service.PostBoardServiceImpl;
import board_post.vo.PostBoardVO;


@WebServlet("/PostBoard/delete.do")
public class PostBoardDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private IPostBoardService service = PostBoardServiceImpl.getInstance();
       
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	    String no = request.getParameter("no");
	    String delyn = request.getParameter("delyn");

	    PostBoardVO postboard = service.selectBoard(Integer.parseInt(no));

	    
	    postboard.setPost_delyn(delyn);

	    boolean isUpdated = service.deletePostBoard(postboard);

	    if (isUpdated) {
	        response.sendRedirect("/PostBoard/List.do");
	    } else {
	        response.sendRedirect("/PostBoard/detail.do?no=" + no);
	    }
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
