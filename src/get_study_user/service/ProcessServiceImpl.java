package get_study_user.service;

import get_study_user.dao.IProcessDAO;
import get_study_user.dao.ISkillDAO;
import get_study_user.dao.ProcessDAOImpl;
import get_study_user.dao.SkillDAOImpl;
import get_study_user.vo.ProcessVO;
import get_study_user.vo.StudyMemberVO;

public class ProcessServiceImpl implements IProcessService{
	private static ProcessServiceImpl instance= null;
	private ProcessServiceImpl(){}
	public static ProcessServiceImpl getInstance() {
		if(instance == null) {	//없을 경우에만 생성해주기
			instance = new ProcessServiceImpl();
		}
		return instance;
	}
	
	private IProcessDAO dao = ProcessDAOImpl.getInstance();
	
	@Override
	public int processInsert(ProcessVO proVO) {
		// TODO Auto-generated method stub
		return dao.processInsert(proVO);
	}
	@Override
	public int insertStudyMem(String ap_no) {
		// TODO Auto-generated method stub
		return dao.insertStudyMem(ap_no);
	}

	
	
	
}
