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


@WebServlet("/PostBoard/Search.do")
public class PostBoardSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private IPostBoardService service = PostBoardServiceImpl.getInstance();
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String keyword = request.getParameter("searchKeyword");
	    
	    // 검색어를 서비스로 전달하고 검색 결과를 받아옴
	    List<PostBoardVO> searchResults = service.searchBoard(keyword);
	    
	    // 페이지 번호와 한 페이지당 게시글 수 설정
	    int page = 1; // 기본 페이지 번호
	    int pageSize = 10; // 한 페이지당 게시글 수
	    if (request.getParameter("page") != null) {
	        page = Integer.parseInt(request.getParameter("page"));
	    }
	    
	    // 전체 게시글 수 가져오기 (검색 결과에 따라)
	    int totalPosts = searchResults.size();

	    // 총 페이지 수 계산
	    int totalPages = (int) Math.ceil((double) totalPosts / pageSize);
	    
	    // 페이지에 해당하는 게시글 목록 가져오기 (검색 결과에 따라)
	    int start = (page - 1) * pageSize;
	    int end = Math.min(start + pageSize, totalPosts);
	    List<PostBoardVO> postboardList = searchResults.subList(start, end);
	    
	    // JSP로 데이터 전달
	    request.setAttribute("totalPages", totalPages);
	    request.setAttribute("currentPage", page);
	    request.setAttribute("postboardList", postboardList);

	    // 검색 결과를 보여줄 JSP로 포워딩
	    request.getRequestDispatcher("/jsp/lou_post/Postboard_admin.jsp").forward(request, response);
	}


	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
