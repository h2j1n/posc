package get_study_user.service;

import java.util.List;

import get_study_user.dao.GetStudyListDAOImpl;
import get_study_user.dao.IGetStudyListDAO;
import get_study_user.vo.ApplyVO;
import get_study_user.vo.GetStudyListVO;
import get_study_user.vo.GetStudyUserVO;
import get_study_user.vo.ProcessVO;
import get_study_user.vo.StudyMemberVO;
import vo.MemberVO;

public class GetStudyListServiceImpl implements IGetStudyListService{

	
	private static GetStudyListServiceImpl instance = null;
	private IGetStudyListDAO dao = GetStudyListDAOImpl.getInstance();
	
	private GetStudyListServiceImpl() {
		
	}
	
	public static GetStudyListServiceImpl getInstance() {
		if(instance == null) {	//없을 경우에만 생성해주기
			instance = new GetStudyListServiceImpl();
		}
		return instance;
	}

	
	
	@Override
	public List<GetStudyUserVO> getStudyList() {
		return dao.getStudyList();
	}

	@Override
	public GetStudyUserVO selectDetailBoard(int parseInt) {
		// TODO Auto-generated method stub
		return dao.selectDetailBoard(parseInt);
	}

	@Override
	public GetStudyUserVO addHit(int parseInt) {
		// TODO Auto-generated method stub
		return dao.addHit(parseInt);
	}

	@Override
	public int deleteGetStudy(int parseInt) {
		// TODO Auto-generated method stub
		return dao.deleteGetStudy(parseInt);
	}

	@Override
	public int getStudyUpdate(GetStudyUserVO gsuVO) {
		// TODO Auto-generated method stub
		return dao.getStudyUpdate(gsuVO);
	}

	@Override
	public List<StudyMemberVO> selectStudyMemList(int parseInt) {
		// TODO Auto-generated method stub
		return dao.selectStudyMemList(parseInt);
	}

	@Override
	public int applyMember(ApplyVO aplVO) {
		// TODO Auto-generated method stub
		return dao.applyMember(aplVO);
	}

	@Override
	public String studyList(String std_name) {
		// TODO Auto-generated method stub
		return dao.studyList(std_name);
	}

	@Override
	public List<ApplyVO> selectaplList(int gsu_no) {
		// TODO Auto-generated method stub
		return dao.selectaplList(gsu_no);
	}



}
	