package chatting.service;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import chatting.vo.ChattingDetailVO;
import chatting.vo.ChattingVO;
import util.MyBatisUtil;
import vo.LouFreeBoardVO;


public class chatServiceImpl implements IchatService{

	private static IchatService dao = chatServiceImpl.getInstance();
	
	private static chatServiceImpl instance = null;

	private chatServiceImpl() {
	}

	public static chatServiceImpl getInstance() {
		if (instance == null) {
			instance = new chatServiceImpl();
		}
		return instance;
	}

	@Override
	public List<ChattingDetailVO> chattingList() {
		return dao.chattingList();
	}

	@Override
	public int chattingInsert(ChattingDetailVO chatDetailVO) {
		return dao.chattingInsert(chatDetailVO);
	}


	


	
}
