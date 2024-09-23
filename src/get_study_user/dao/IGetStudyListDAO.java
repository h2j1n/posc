package get_study_user.dao;

import java.util.List;

import get_study_user.vo.ApplyVO;
import get_study_user.vo.GetStudyListVO;
import get_study_user.vo.GetStudyUserVO;
import get_study_user.vo.ProcessVO;
import get_study_user.vo.StudyMemberVO;
import vo.MemberVO;

public interface IGetStudyListDAO {

	public List<GetStudyUserVO> getStudyList();

	public GetStudyUserVO selectDetailBoard(int parseInt);

	public GetStudyUserVO addHit(int parseInt);

	public int deleteGetStudy(int parseInt);

	public int getStudyUpdate(GetStudyUserVO gsuVO);

	public List<StudyMemberVO> selectStudyMemList(int parseInt);

	public int applyMember(ApplyVO aplVO);

	public String studyList(String std_name);

	public List<MemberVO> userNameList();

	public List<ApplyVO> selectaplList(int gsu_no);


}
