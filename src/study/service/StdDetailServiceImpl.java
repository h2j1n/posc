package study.service;

import java.util.List;

import study.dao.IStdDetailDao;
import study.dao.StdDetailDaoImpl;
import study.vo.PlanStudyVO;
import study.vo.StudyLeaderVO;
import study.vo.StudyVO;

public class StdDetailServiceImpl implements IStdDetailService{
	private static StdDetailServiceImpl instance = null;

	private IStdDetailDao dao = StdDetailDaoImpl.getInstance();
	
	private StdDetailServiceImpl() {
	}

	public static StdDetailServiceImpl getInstance() {
		if (instance == null) {
			instance = new StdDetailServiceImpl();
		}
		return instance;
	}

	@Override
	public StudyVO getDetailInfo(int no) {
		return dao.getDetailInfo(no);
	}

	@Override
	public StudyLeaderVO getStudyLeader(int no) {
		return dao.getStudyLeader(no);
	}

	@Override
	public String getUserID(int no) {
		return dao.getUserID(no);
	}

	@Override
	public boolean deleteStudyDetail(int no) {
		return dao.deleteStudyDetail(no);
	}

	@Override
	public boolean updateStudyDetail(StudyVO studyVO) {
		return dao.updateStudyDetail(studyVO);
	}

	@Override
	public boolean insertStudy(PlanStudyVO paramVO) {
		return dao.insertStudy(paramVO);
	}

	@Override
	public boolean insertStudyMember(PlanStudyVO paramVO2) {
		return dao.insertStudyMember(paramVO2);
	}

	@Override
	public int getMaxNo() {
		return dao.getMaxNo();
	}

	@Override
	public int updateGetStudyName(String std_name) {
		return dao.updateGetStudyName(std_name);
	}

	@Override
	public int plusHit(int no) {
		return dao.plusHit(no);
	}
}
