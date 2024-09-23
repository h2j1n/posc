package get_study_user.service;

import java.util.List;

import get_study_user.dao.ISkillDAO;
import get_study_user.dao.SkillDAOImpl;
import get_study_user.vo.GetStudyListVO;
import get_study_user.vo.GetStudyUserVO;
import get_study_user.vo.SkillVO;
import vo.MemberVO;


public class SkillServiceImpl implements ISkillService {

	private static SkillServiceImpl instance= null;
	private SkillServiceImpl(){}
	public static SkillServiceImpl getInstance() {
		if(instance == null) {	//없을 경우에만 생성해주기
			instance = new SkillServiceImpl();
		}
		return instance;
	}
	
	
	private ISkillDAO dao = SkillDAOImpl.getInstance();
	
	@Override
	public List<SkillVO> selectSkillList() {
		// TODO Auto-generated method stub
		return dao.selectSkillList();
	}
	@Override
	public int insertStudyMemBoard(GetStudyUserVO gsuVO) {
		// TODO Auto-generated method stub
		return dao.insertStudyMemBoard(gsuVO);
	}
	@Override
	public List<GetStudyListVO> selectStudyList(int no) {
		// TODO Auto-generated method stub
		return dao.selectStudyList(no);
	}
	
	
	
	
}
