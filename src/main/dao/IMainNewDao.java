package main.dao;

import java.util.List;

import main.vo.MainNewVO;

public interface IMainNewDao {

	List<MainNewVO> getNewList();

	List<MainNewVO> getNewProjectList();

	List<MainNewVO> getNewStudyList();
	
	//paging
	
	public int getTotalNewList();

	public int getProNewList();
	
	public int getStdNewList();
	
	public List<MainNewVO> getNewTotalListByPage(int page, int pageSize);

	public List<MainNewVO> getNewProListByPage(int page, int pageSize);
	
	public List<MainNewVO> getNewStdListByPage(int page, int pageSize);
	
	
}
