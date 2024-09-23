package board_free.louFreeBoardService;

import java.util.List;
import java.util.Map;

import board_free.louFreeBoardDao.ILouFreeBoardDAO;
import board_free.louFreeBoardDao.LouFreeBoardDAOImpl;
import board_free.vo.FrcoVO;
import board_post.vo.PostBoardVO;
import board_post.vo.StcoVO;
import vo.LouFreeBoardVO;

public class LouFreeBoardServiceImpl implements ILouFreeBoardService {
	private static ILouFreeBoardDAO dao = LouFreeBoardDAOImpl.getInstance();
	private static LouFreeBoardServiceImpl instance = null;

	
	
	
	
	private LouFreeBoardServiceImpl() {
	}
	public static LouFreeBoardServiceImpl getInstance() {
		if (instance == null) {
			instance = new LouFreeBoardServiceImpl();
		}
		return instance;
	}

	@Override
	public List<LouFreeBoardVO> FreeBoardList() {
		
		
		return dao.FreeBoardList();
	}
	@Override
	
	
	
	public int RegisterBoard(LouFreeBoardVO louFreeBoardVO) {
		
		
		
		return dao.RegisterBoard(louFreeBoardVO);
	}
	@Override
	public LouFreeBoardVO detailBoard(int parseInt) {
		
		return dao.detailBoard(parseInt);
	}
	@Override
	public int UpdateBoard(LouFreeBoardVO freeBoardVO) {
		
		return dao.UpdateBoard(freeBoardVO);
	}
	@Override
	public int deleteBoard(int parseInt) {
		return dao.deleteBoard(parseInt);
	}
	@Override
	public List<LouFreeBoardVO> searchList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.searchResult(map);
	}
	
	
	
	
	
	@Override
	public List<LouFreeBoardVO> searchList(String keyword) {
		return dao.searchList(keyword);
	}
	@Override
	public int getTotalFrees() {
		return dao.getTotalFrees();
	}
	@Override
	public List<LouFreeBoardVO> pageBoardList(int page, int pageSize) {
		return dao.pageBoardList(page,pageSize);
	}
	@Override
	public int updateHit(int parseInt) {
		return dao.updateHit(parseInt);
	}

	
	
	
//	댓글 기능
	
	@Override
	public List<FrcoVO> getCommentsByPostNo(int freeNo) {
		return dao.getCommentsByPostNo(freeNo);
	}

	@Override
	public boolean addComment(FrcoVO comment) {
		return dao.insertComment(comment);
	}

	
	
	@Override
    public boolean deleteComment(int commentNo) {
        return dao.deleteComment(commentNo);
    }

	@Override
	public int updateComment(FrcoVO comment) {
		return dao.updateComment(comment);
	}
	
	@Override
	public LouFreeBoardVO selectBoard(int no) {
		return dao.selectBoard(no);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
