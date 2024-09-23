package board_post.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board_post.service.IPostBoardService;
import board_post.service.PostBoardServiceImpl;
import board_post.vo.StcoVO;

@WebServlet("/PostBoard/commentupdate.do")
public class CommentUpdate extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private IPostBoardService service = PostBoardServiceImpl.getInstance();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 요청으로부터 댓글 번호와 수정된 내용 받아오기
        int commentNo = Integer.parseInt(request.getParameter("cono"));
        String postNo = request.getParameter("postNo");
        String updatedContent = request.getParameter("update_comment_input");
        
        // 수정된 내용을 StcoVO 객체에 담기
        StcoVO comment = new StcoVO();
        comment.setStco_no(commentNo);
        comment.setStco_cont(updatedContent);
        
        // 댓글 업데이트 
		int result = service.updateComment(comment);
		
		// 업데이트 성공 여부
		if (result > 0) {
		    response.sendRedirect("/PostBoard/Detail.do?no=" + postNo);
		} else {
		    response.getWriter().write("댓글 업데이트에 실패했습니다.");
		}
    }
}
