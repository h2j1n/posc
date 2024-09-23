package board_post.service;

import java.util.List;

import board_post.dao.IPostBoardDao;
import board_post.dao.PostBoardDaoImpl;
import board_post.vo.PostBoardVO;
import board_post.vo.StcoVO;

public class PostBoardServiceImpl implements IPostBoardService{

	private static PostBoardServiceImpl instance = null;
	private PostBoardServiceImpl() {}
	
	public static IPostBoardService getInstance() {
		if(instance == null) {
			instance = new PostBoardServiceImpl();
		}
		return instance;
		}
		
	private IPostBoardDao dao = PostBoardDaoImpl.getInstance();
	
	
	// 게시판기능
	@Override
	public List<PostBoardVO> postboardList() {
		return dao.postboardList();
	}

	@Override
	public PostBoardVO selectBoard(int no) {
		return dao.selectBoard(no);
	}

	@Override
	public PostBoardVO hitupdate(int no) {
		return dao.hitupdate(no);
	}

	@Override
	public boolean deletePostBoard(PostBoardVO postboard) {
		return dao.deletePostBoard(postboard);
	}

	@Override
	public int insertPostBoard(PostBoardVO postboardVO) {
		return dao.insertPostBoard(postboardVO);
	}

	@Override
	public int updateBoard(PostBoardVO postboardVO) {
		return dao.updateBoard(postboardVO);
	}
	
	
	
	
//	댓글 기능
	
	@Override
	public List<StcoVO> getCommentsByPostNo(int postNo) {
		return dao.getCommentsByPostNo(postNo);
	}

	@Override
	public boolean addComment(StcoVO comment) {
		return dao.insertComment(comment);
	}

	
	@Override
	public StcoVO selectcomment(int no) {
		return dao.selectcomment(no);
	}
	
	@Override
    public boolean deleteComment(int commentNo) {
        return dao.deleteComment(commentNo);
    }

	@Override
	public int updateComment(StcoVO comment) {
		return dao.updateComment(comment);
	}
	
	
	
	// 페이징기능

	
	@Override
    public int getTotalPosts() {
        return dao.getTotalPosts();
    }

    @Override
    public List<PostBoardVO> getPostboardListByPage(int page, int pageSize) {
        return dao.getPostboardListByPage(page, pageSize);
    }

    
    
    // 검색기능 
    
	@Override
	public List<PostBoardVO> searchBoard(String keyword) {
        return dao.searchBoard(keyword);
	}


	

	

	
	
	
	
}
	
	


