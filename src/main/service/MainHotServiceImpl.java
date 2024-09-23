package main.service;

import java.util.List;

import main.dao.IMainHotDao;
import main.dao.MainHotDaoImpl;
import main.vo.MainHotVO;

public class MainHotServiceImpl implements IMainHotService{
	private static IMainHotDao dao = MainHotDaoImpl.getInstance();
	private static MainHotServiceImpl instance = null;

	private MainHotServiceImpl() {
	}

	public static MainHotServiceImpl getInstance() {
		if (instance == null) {
			instance = new MainHotServiceImpl();
		}
		return instance;
	}

	@Override
	public List<MainHotVO> getHotList() {
		return dao.getHotList();
	}
	
	
	
}
