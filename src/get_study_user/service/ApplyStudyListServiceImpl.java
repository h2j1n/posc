package get_study_user.service;

import java.util.List;
import java.util.Map;

import get_study_user.dao.ApplyStudyListDAOImpl;
import get_study_user.dao.GetStudyListDAOImpl;
import get_study_user.dao.IApplyStudyListDAO;
import get_study_user.dao.IGetStudyListDAO;
import get_study_user.vo.ApplyVO;

public class ApplyStudyListServiceImpl implements IApplyStudyListService{
	
	private static ApplyStudyListServiceImpl instance = null;
	private IApplyStudyListDAO dao = ApplyStudyListDAOImpl.getInstance();

	private ApplyStudyListServiceImpl() {
		
	}

	public static ApplyStudyListServiceImpl getInstance() {
		if (instance == null) { // 없을 경우에만 생성해주기
			instance = new ApplyStudyListServiceImpl();
		}
		return instance;
	}


	@Override
	public List<ApplyVO> getApply(int std_no) {
		return dao.getApply(std_no);
	}

	@Override
	public int deleteStudyMem(String ap_no) {
		return dao.deleteStudyMem(ap_no);
		
	}

	@Override
	public String getGsuNo(String gsu_no) {
		// TODO Auto-generated method stub
		return dao.getGsuNo(gsu_no);
	}

	
	

}
