package get_study_user.dao;

import java.util.List;

import get_study_user.vo.GetStudyListVO;
import get_study_user.vo.GetStudyUserVO;
import get_study_user.vo.SkillVO;
import vo.MemberVO;



public interface ISkillDAO {

	public List<SkillVO> selectSkillList();

	public int insertStudyMemBoard(GetStudyUserVO gsuVO);

	public List<GetStudyListVO> selectStudyList(int no);

	
	
	
	
}
