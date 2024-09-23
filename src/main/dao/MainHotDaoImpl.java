package main.dao;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import main.vo.MainHotVO;
import util.MyBatisUtil;

public class MainHotDaoImpl implements IMainHotDao{

	private static MainHotDaoImpl instance = null;

	private MainHotDaoImpl() {
	}

	public static MainHotDaoImpl getInstance() {
		if (instance == null) {
			instance = new MainHotDaoImpl();
		}
		return instance;
	}

	@Override
	public List<MainHotVO> getHotList() {
		
		SqlSession session = null;
		List<MainHotVO> hotList = null;
		

		try {
			session = MyBatisUtil.getSqlSession();
			hotList = session.selectList("mainGetHot.getHotList");

		} catch (PersistenceException e) {
			e.printStackTrace();
		} finally {
			if (session != null) {
				session.close();

			}

		}
		
		return hotList;
	}
	
}
