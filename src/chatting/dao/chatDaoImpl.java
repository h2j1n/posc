package chatting.dao;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import chatting.vo.ChattingDetailVO;
import util.MyBatisUtil;

public class chatDaoImpl implements IchatDao{

	private static chatDaoImpl instance = null;

	private chatDaoImpl() {
	}

	public static chatDaoImpl getInstance() {
		if (instance == null) {
			instance = new chatDaoImpl();
		}
		return instance;
	}

	@Override
	public List<ChattingDetailVO> chattingList() {
		
		SqlSession session = null;
		List<ChattingDetailVO> boardList =null;
		

		try {
			session = MyBatisUtil.getSqlSession();
			boardList = session.selectList("chat.loadChat");
			
			

		} catch (PersistenceException e) {
			e.printStackTrace();
		} finally {
			if (session != null) {
				session.close();

			}

		}
		
		return boardList;
	}


	@Override
	public int chattingInsert(ChattingDetailVO chatDetailVO) {
		SqlSession session = null;
		int status = 0;

		try {
			session = MyBatisUtil.getSqlSession();
			status = session.insert("chat.insertChat", chatDetailVO);
			
			

		} catch (PersistenceException e) {
			e.printStackTrace();
		} finally {
			if (session != null) {
				session.close();

			}

		}
		
		return status;
	}
	
}
