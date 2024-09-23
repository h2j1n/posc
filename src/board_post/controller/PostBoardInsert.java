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


@WebServlet("/PostBoard/Insert.do")
public class PostBoardInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private IPostBoardService service = PostBoardServiceImpl.getInstance();
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/jsp/lou_post/Postform_admin.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		Integer admNo = (Integer) request.getSession().getAttribute("admNo");
		
		PostBoardVO postboardVO = new PostBoardVO();
		postboardVO.setPost_title(title);
		postboardVO.setPost_content(content);
		postboardVO.setAdm_no(admNo);
		
		int status = service.insertPostBoard(postboardVO);
		if(status > 0) {	// 성공
			response.sendRedirect("/PostBoard/Detail.do?no="+postboardVO.getPost_no());
		}else {				// 실패
			request.getRequestDispatcher("/jsp/lou_post/Postform_admin.jsp").forward(request, response);
			
		}
	}

}
