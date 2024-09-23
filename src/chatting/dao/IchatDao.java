package chatting.dao;

import java.util.List;

import chatting.vo.ChattingDetailVO;


public interface IchatDao {

	List<ChattingDetailVO> chattingList();
	
	int chattingInsert(ChattingDetailVO chatDetailVO);
	
}
