package main.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import main.vo.MainNewVO;
import util.MyBatisUtil;

public class MainNewDaoImpl implements IMainNewDao{

	private static MainNewDaoImpl instance = null;

	private MainNewDaoImpl() {
	}

	public static MainNewDaoImpl getInstance() {
		if (instance == null) {
			instance = new MainNewDaoImpl();
		}
		return instance;
	}

	@Override
	public List<MainNewVO> getNewList() {
		
		SqlSession session = null;
		List<MainNewVO> newList = null;
		
		try {
			session = MyBatisUtil.getSqlSession();
			newList = session.selectList("mainGetNew.getNewTotalList1");
			
			
		} catch (PersistenceException e) {
			e.printStackTrace();
		} finally {
			if (session != null) {
				session.close();

			}

		}
		
		return newList;
	}

	@Override
	public List<MainNewVO> getNewProjectList() {
		
		SqlSession session = null;
		List<MainNewVO> newList = null;
		
		try {
			session = MyBatisUtil.getSqlSession();
			newList = session.selectList("mainGetNew.getNewProjectList");
			
			
		} catch (PersistenceException e) {
			e.printStackTrace();
		} finally {
			if (session != null) {
				session.close();

			}

		}
		
		return newList;
	}

	@Override
	public List<MainNewVO> getNewStudyList() {
		
		SqlSession session = null;
		List<MainNewVO> newList = null;
		
		try {
			session = MyBatisUtil.getSqlSession();
			newList = session.selectList("mainGetNew.getNewStudyList");
			
			
		} catch (PersistenceException e) {
			e.printStackTrace();
		} finally {
			if (session != null) {
				session.close();

			}

		}
		
		return newList;
	}

	
	
	/////////////////////////////////////////////////////////////////////////////
	
	
	@Override
	public int getTotalNewList() {
		
		try(SqlSession session = MyBatisUtil.getSqlSession(true)){
			
			return session.selectOne("mainGetNew.getNewTotalList");
		}catch (Exception e) {
			e.printStackTrace();
			return 0; 
		}
		
	}

	@Override
	public int getProNewList() {
		
		try(SqlSession session = MyBatisUtil.getSqlSession(true)){
			
			return session.selectOne("mainGetNew.getNewProList");
		}catch (Exception e) {
			e.printStackTrace();
			return 0; 
		}
	}

	@Override
	public int getStdNewList() {
		
		try(SqlSession session = MyBatisUtil.getSqlSession(true)){
			
			return session.selectOne("mainGetNew.getNewStdList");
		}catch (Exception e) {
			e.printStackTrace();
			return 0; 
		}
	}
	
	@Override
	public List<MainNewVO> getNewTotalListByPage(int page, int pageSize) {
		
		try(SqlSession session = MyBatisUtil.getSqlSession(true)){
			
			Map<String, Integer> param = new HashMap<String, Integer>();
			param.put("start", (page - 1) * pageSize);
			param.put("pageSize", pageSize);
			
			return session.selectList("mainGetNew.getNewTotalListByPage", param);
		}catch (Exception e) {
			e.printStackTrace();
			return new ArrayList<>();
		}
		
	}

	@Override
	public List<MainNewVO> getNewProListByPage(int page, int pageSize) {
		
		try(SqlSession session = MyBatisUtil.getSqlSession(true)){
			
			Map<String, Integer> param = new HashMap<String, Integer>();
			param.put("start", (page - 1) * pageSize);
			param.put("pageSize", pageSize);
			
			return session.selectList("mainGetNew.getNewProListByPage", param);
		}catch (Exception e) {
			e.printStackTrace();
			return new ArrayList<>();
		}
		
	}

	@Override
	public List<MainNewVO> getNewStdListByPage(int page, int pageSize) {
		
		try(SqlSession session = MyBatisUtil.getSqlSession(true)){
			
			Map<String, Integer> param = new HashMap<String, Integer>();
			param.put("start", (page - 1) * pageSize);
			param.put("pageSize", pageSize);
			
			return session.selectList("mainGetNew.getNewStdListByPage", param);
		}catch (Exception e) {
			e.printStackTrace();
			return new ArrayList<>();
		}
		
	}
	
	
}
