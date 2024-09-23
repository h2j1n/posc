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


@WebServlet("/PostBoard/update.do")
public class PostBoardUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String no = request.getParameter("no");

	    IPostBoardService service = PostBoardServiceImpl.getInstance();
	    
	    PostBoardVO postboardVO = service.selectBoard(Integer.parseInt(no));
	    
	    // 데이터를 전달하는 방법
	    request.setAttribute("postboardVO", postboardVO);
	    
	    request.getRequestDispatcher("/jsp/lou_post/PostUpdateform_admin.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 request.setCharacterEncoding("UTF-8");

		 IPostBoardService service = PostBoardServiceImpl.getInstance();

		 String no = request.getParameter("no");
		 String title = request.getParameter("title");
		 String content = request.getParameter("content");
		 
		    

		 PostBoardVO postboardVO = new PostBoardVO();
		    
		 postboardVO.setPost_title(title);
		 postboardVO.setPost_content(content);
		 postboardVO.setPost_no(Integer.parseInt(no));

		 int status = service.updateBoard(postboardVO);


		 if (status > 0) {    // 성공
		     response.sendRedirect("/PostBoard/Detail.do?no=" + postboardVO.getPost_no());
		 } else {                // 실패                                                     
		      request.getRequestDispatcher("/jsp/lou_post/PostBoard/updateform.jsp").forward(request, response);
		 }
		
		
	}

}
