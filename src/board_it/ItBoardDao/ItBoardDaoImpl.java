package board_it.ItBoardDao;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import board_it.vo.ItVo;
import javafx.scene.Parent;
import oracle.net.aso.s;
import util.MyBatisUtil;

public class ItBoardDaoImpl implements IItBoardDao {

	private static ItBoardDaoImpl instance = null;

	private ItBoardDaoImpl() {
	}

	public static ItBoardDaoImpl getInstance() {
		if (instance == null) {
			instance = new ItBoardDaoImpl();
		}
		return instance;
	}

	@Override
	public int registerBoard(ItVo iv) {
		SqlSession session = null;
		int status = 0;

		try {

			session = MyBatisUtil.getSqlSession();
			status = session.insert("itBoard.resigterBoard", iv);
			if (0 < status) {
				session.commit();

			}

		} catch (PersistenceException e) {
			e.printStackTrace();
		} finally {
			session.close();

		}

		return status;
	}

	@Override
	public List<ItVo> getListBoard() {
		SqlSession session = null;
		List<ItVo> ivList = null;	
			
			try {
				
				session=MyBatisUtil.getSqlSession(true);
				ivList = session.selectList("itBoard.getListBoard");
						
						
						
			} catch (PersistenceException e) {
				e.printStackTrace();
			}finally {
				session.close();
				
				
			}
		
		
		
		return ivList;
	}

	@Override
	public ItVo detailItBoard(int parseInt) {
		SqlSession session = null;
		ItVo iv = null;
			try {
				
				session=MyBatisUtil.getSqlSession(true);
				iv = session.selectOne("itBoard.detailBoard", parseInt);
						
						
						
						
			} catch (PersistenceException e) {
				e.printStackTrace();
			}finally {
				session.close();
				
				
			}
		
		
		return iv;
	}

	@Override
	public int updateBoard(ItVo iv) {
		SqlSession session = null;
		int status = 0;	
			
			try {
				
				session = MyBatisUtil.getSqlSession();
				status = session.update("itBoard.updateBoard",iv);
				if(0<status) {
					session.commit();
				}
						
						
			} catch (PersistenceException e) {
				e.printStackTrace();
			}finally {
				session.close();
				
				
			}
		
		
		return status;
	}

	@Override
	public int deleteBoard(int parseInt) {
		SqlSession session = null;
		int status = 0;
			
			try {
				
				session=MyBatisUtil.getSqlSession();
				status = session.delete("itBoard.deleteBoard",parseInt);
					if(0<status) {
						session.commit();
					}
						
						
			} catch (PersistenceException e) {
				e.printStackTrace();
			}finally {
				session.close();
				
				
			}
		
		return status;
	}

}
