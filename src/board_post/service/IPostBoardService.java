package board_post.service;

import java.util.List;

import board_post.vo.PostBoardVO;
import board_post.vo.StcoVO;

public interface IPostBoardService {
//  게시판기능
	public List<PostBoardVO> postboardList();

	public PostBoardVO selectBoard(int no);

	public PostBoardVO hitupdate(int no);

	public boolean deletePostBoard(PostBoardVO postboard);

	public int insertPostBoard(PostBoardVO postboardVO);

	public int updateBoard(PostBoardVO postboardVO);
	
	
//	댓글기능
	
	List<StcoVO> getCommentsByPostNo(int postNo);
	
    boolean addComment(StcoVO comment);

	public StcoVO selectcomment(int no);
	
	boolean deleteComment(int commentNo);

	public int updateComment(StcoVO comment);

	
	
	
	
	// 페이징
	public int getTotalPosts();

	public List<PostBoardVO> getPostboardListByPage(int page, int pageSize);

	public List<PostBoardVO> searchBoard(String keyword);


	

}
