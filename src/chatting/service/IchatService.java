package chatting.service;

import java.util.List;

import chatting.vo.ChattingDetailVO;


public interface IchatService {

	List<ChattingDetailVO> chattingList();
	
	int chattingInsert(ChattingDetailVO chatDetailVO);
}
