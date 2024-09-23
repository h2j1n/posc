package board_free.louFreeBoardController;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board_free.louFreeBoardService.ILouFreeBoardService;
import board_free.louFreeBoardService.LouFreeBoardServiceImpl;
import board_free.vo.FrcoVO;

@WebServlet("/LoutFreeBoard/commentupdate.do")
public class CommentUpdate extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    ILouFreeBoardService service = LouFreeBoardServiceImpl.getInstance();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 요청으로부터 댓글 번호와 수정된 내용, 그리고 자유게시판 번호를 받아옴
        int commentNo = Integer.parseInt(request.getParameter("cono"));
        String freeNo = request.getParameter("freeNo"); 
        String updatedContent = request.getParameter("update_comment_input");
        
        // 수정된 내용을 FrcoVO 객체에 담기
        FrcoVO comment = new FrcoVO();
        comment.setFrco_no(commentNo);
        comment.setFrco_cont(updatedContent);
        
        // 댓글 업데이트 
		int result = service.updateComment(comment);
		
		// 업데이트 성공 여부에 따라 리다이렉트 또는 실패 메시지 출력
		if (result > 0) {
		    response.sendRedirect("/LoutFreeBoardDetail.do?free_no=" + freeNo);
		} else {
		    response.getWriter().write("댓글 업데이트에 실패했습니다.");
		}
    }
}
