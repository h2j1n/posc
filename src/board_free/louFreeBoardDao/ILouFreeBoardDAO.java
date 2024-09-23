package board_free.louFreeBoardDao;

import java.util.List;
import java.util.Map;

import board_free.vo.FrcoVO;
import board_post.vo.PostBoardVO;
import board_post.vo.StcoVO;
import vo.LouFreeBoardVO;

public interface ILouFreeBoardDAO {

	List<LouFreeBoardVO> FreeBoardList();

	int RegisterBoard(LouFreeBoardVO louFreeBoardVO);

	LouFreeBoardVO detailBoard(int parseInt);

	int UpdateBoard(LouFreeBoardVO freeBoardVO);

	int deleteBoard(int parseInt);

	List<LouFreeBoardVO> searchResult(Map<String, Object> map);

	List<LouFreeBoardVO> searchList(String keyword);

	int getTotalFrees();

	List<LouFreeBoardVO> pageBoardList(int page, int pageSize);

	int updateHit(int parseInt);
	
	
//	댓글 기능
	List<FrcoVO> getCommentsByPostNo(int freeNo);
	
    boolean insertComment(FrcoVO comment);


	boolean deleteComment(int commentNo);

	public int updateComment(FrcoVO comment);
	
	public LouFreeBoardVO selectBoard(int no);

}
