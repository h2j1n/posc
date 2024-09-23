package main.service;

import java.util.List;

import main.vo.MainNewVO;

public interface IMainNewService {

	public List<MainNewVO> getNewList();
	
	public List<MainNewVO> getNewProjectList();

	public List<MainNewVO> getNewStudyList();
	
	//paging
	public int getTotalNewList();

	public int getProNewList();
	
	public int getStdNewList();
	
	public List<MainNewVO> getNewTotalListByPage(int page, int pageSize);

	public List<MainNewVO> getNewProListByPage(int page, int pageSize);
	
	public List<MainNewVO> getNewStdListByPage(int page, int pageSize);
	
}
