package board_free.louFreeBoardService;

import java.util.List;
import java.util.Map;

import board_free.vo.FrcoVO;
import board_post.vo.StcoVO;
import vo.LouFreeBoardVO;

public interface ILouFreeBoardService {

	List<LouFreeBoardVO> FreeBoardList();

	int RegisterBoard(LouFreeBoardVO louFreeBoardVO);

	LouFreeBoardVO detailBoard(int parseInt);

	int UpdateBoard(LouFreeBoardVO freeBoardVO);

	int deleteBoard(int parseInt);

	List<LouFreeBoardVO> searchList(Map<String, Object> map);

	List<LouFreeBoardVO> searchList(String keyword);

	int getTotalFrees();

	List<LouFreeBoardVO> pageBoardList(int page, int pageSize);

	int updateHit(int parseInt);
	
	
//	댓글기능
	
	List<FrcoVO> getCommentsByPostNo(int freeNo);
	
    boolean addComment(FrcoVO comment);

	
	boolean deleteComment(int commentNo);

	public int updateComment(FrcoVO comment);
	
	public LouFreeBoardVO selectBoard(int no);

}
