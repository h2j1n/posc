package main.service;

import java.util.List;

import main.dao.IMainNewDao;
import main.dao.MainNewDaoImpl;
import main.vo.MainNewVO;

public class MainNewServiceImpl implements IMainNewService{
	private static IMainNewDao dao = MainNewDaoImpl.getInstance();
	private static MainNewServiceImpl instance = null;

	private MainNewServiceImpl() {
	}

	public static MainNewServiceImpl getInstance() {
		if (instance == null) {
			instance = new MainNewServiceImpl();
		}
		return instance;
	}

	@Override
	public List<MainNewVO> getNewList() {
		return dao.getNewList();
	}

	@Override
	public List<MainNewVO> getNewProjectList() {
		return dao.getNewProjectList();
	}

	@Override
	public List<MainNewVO> getNewStudyList() {
		return dao.getNewStudyList();
	}

	@Override
	public int getTotalNewList() {
		return dao.getTotalNewList();
	}


	@Override
	public int getProNewList() {
		return dao.getProNewList();
	}

	@Override
	public int getStdNewList() {
		return dao.getStdNewList();
	}

	@Override
	public List<MainNewVO> getNewTotalListByPage(int page, int pageSize) {
		return dao.getNewTotalListByPage(page, pageSize);
	}
	
	@Override
	public List<MainNewVO> getNewProListByPage(int page, int pageSize) {
		return dao.getNewProListByPage(page, pageSize);
	}

	@Override
	public List<MainNewVO> getNewStdListByPage(int page, int pageSize) {
		return dao.getNewStdListByPage(page, pageSize);
	}
	
}
