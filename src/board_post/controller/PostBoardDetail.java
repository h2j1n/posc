package board_post.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board_post.service.IPostBoardService;
import board_post.service.PostBoardServiceImpl;
import board_post.vo.PostBoardVO;
import board_post.vo.StcoVO;


@WebServlet("/PostBoard/Detail.do")
public class PostBoardDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private IPostBoardService service = PostBoardServiceImpl.getInstance();
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String no = request.getParameter("no");
	    
	    // 조회수 증가
	    service.hitupdate(Integer.parseInt(no));
	    
	    PostBoardVO postboardVO = service.selectBoard(Integer.parseInt(no));
	    
	    // 게시글의 댓글 가져오기
	    List<StcoVO> comments = service.getCommentsByPostNo(Integer.parseInt(no));
	    
	    // 데이터를 전달
	    request.setAttribute("postboardVO", postboardVO);
	    request.setAttribute("comments", comments); // 댓글 목록 가져오기
	    
	    request.getRequestDispatcher("/jsp/lou_post/Postdetail_admin.jsp").forward(request, response);
	}


	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    // 댓글 등록 부분
		request.setCharacterEncoding("UTF-8");
	    
	    int postNo = Integer.parseInt(request.getParameter("no")); 
	    String commentContent = request.getParameter("comment_input"); 


	    Integer userNo = (Integer) request.getSession().getAttribute("userNo");
	    
	    StcoVO comment = new StcoVO();
	    comment.setPost_no(postNo);
	    comment.setStco_cont(commentContent);
	    comment.setUser_no(userNo);
	    
	    if (service.addComment(comment)) {
	        // 댓글 등록 성공 시, 댓글 목록을 다시 가져와서 페이지 갱신
	        List<StcoVO> comments = service.getCommentsByPostNo(postNo);
	        // 데이터를 전달
	        request.setAttribute("postboardVO", service.selectBoard(postNo));
	        request.setAttribute("comments", comments); // 댓글 목록을 request에 추가
	        request.getRequestDispatcher("/jsp/lou_post//Postdetail_admin.jsp").forward(request, response);
	    } else {
	        // 실패 처리
	        response.getWriter().println("댓글 등록에 실패했습니다.");
	    }
	}

	
	
	

}
