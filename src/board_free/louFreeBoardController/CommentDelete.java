package board_free.louFreeBoardController;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board_free.louFreeBoardService.ILouFreeBoardService;
import board_free.louFreeBoardService.LouFreeBoardServiceImpl;

@WebServlet("/LoutFreeBoard/commentdelete.do")
public class CommentDelete extends HttpServlet {
    private static final long serialVersionUID = 1L;
    ILouFreeBoardService service = LouFreeBoardServiceImpl.getInstance();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cono = request.getParameter("cono");
        String freeNo = request.getParameter("freeNo"); 
        
        System.out.println("댓글 번호: " + cono);
        System.out.println("게시글 번호: " + freeNo);

        if (cono == null || cono.isEmpty() || freeNo == null || freeNo.isEmpty()) {
            System.out.println("댓글 번호 또는 게시글 번호를 가져올 수 없습니다.");
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "댓글 번호 또는 게시글 번호를 가져올 수 없습니다.");
            return;
        }

        int commentNo;
        int postNumber;
        try {
            commentNo = Integer.parseInt(cono);
            postNumber = Integer.parseInt(freeNo);
        } catch (NumberFormatException e) {
            System.out.println("댓글 번호 또는 게시글 번호가 올바르지 않습니다.");
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "댓글 번호 또는 게시글 번호가 올바르지 않습니다.");
            return;
        }

        // 댓글 삭제 처리
        boolean isDeleted = service.deleteComment(commentNo);

        if (isDeleted) {
        	response.sendRedirect("/LoutFreeBoardDetail.do?free_no=" + postNumber);
        } else {
            response.getWriter().println("댓글 삭제에 실패했습니다.");
        }
    }



    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
