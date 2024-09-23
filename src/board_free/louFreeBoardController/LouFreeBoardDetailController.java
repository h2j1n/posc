package board_free.louFreeBoardController;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import board_free.louFreeBoardService.ILouFreeBoardService;
import board_free.louFreeBoardService.LouFreeBoardServiceImpl;
import board_free.vo.FrcoVO;
import vo.LouFreeBoardVO;

@WebServlet("/LoutFreeBoardDetail.do")
public class LouFreeBoardDetailController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    ILouFreeBoardService service = LouFreeBoardServiceImpl.getInstance();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String freeNo = request.getParameter("free_no");
        String resultMsg = request.getParameter("resultMsg"); // 수정 결과 resultMsg=1
        String msg = request.getParameter("msg");
        
        
        
        HttpSession session = request.getSession();
        

        int hitPlus = service.updateHit(Integer.parseInt(freeNo)); // 조회수 올리기

        if (0 < hitPlus) {
            System.out.println("조회수 올리기 성공");
        }

        if (msg != null) {
            request.setAttribute("msg", "1");
        }

        LouFreeBoardVO louFreeBoardVO = service.detailBoard(Integer.parseInt(freeNo)); // loufreeBoard랑 매칭
        request.setAttribute("freeBoard", louFreeBoardVO); // 상세 게시글 정보 free_no, free_title, free_content, free_date, user_no ,free_hit 가져옴

        // 게시글의 댓글 가져오기
        List<FrcoVO> comments = service.getCommentsByPostNo(Integer.parseInt(freeNo));
        request.setAttribute("comments", comments); // 댓글 목록 가져오기

        request.getRequestDispatcher("/jsp/LouFreeBoard/louFreeDetail.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 댓글 등록 부분
        request.setCharacterEncoding("UTF-8");
        
        // 세션에서 "userNo" 속성 가져오기
        Integer userNo = (Integer) request.getSession().getAttribute("userNo");

        // 세션이 존재하고 "userNo" 속성이 존재하는지 여부 확인
        if (userNo == null) {
            // 세션 또는 "userNo" 속성이 없는 경우 처리
            response.getWriter().println("로그인 후에 이용해주세요.");
            return;
        }

        int freeNo = Integer.parseInt(request.getParameter("free_no"));

        String commentContent = request.getParameter("comment_input");
//        Integer userNo = (Integer) request.getSession().getAttribute("userNo");

        FrcoVO comment = new FrcoVO();
        comment.setFree_no(freeNo);
        comment.setFrco_cont(commentContent);
        comment.setUser_no(userNo);

        if (service.addComment(comment)) {
            // 댓글 등록 성공 시, 현재 게시글의 댓글 목록을 다시 가져와서 페이지 갱신
            List<FrcoVO> comments = service.getCommentsByPostNo(freeNo);
            request.setAttribute("comments", comments); // 댓글 목록을 request에 추가
            response.sendRedirect("/LoutFreeBoardDetail.do?free_no=" + freeNo);
//            request.getRequestDispatcher("/jsp/LouFreeBoard/louFreeDetail.jsp").forward(request, response);
        } else {
            // 실패 처리
            response.getWriter().println("댓글 등록에 실패했습니다.");
        }
    }
}
