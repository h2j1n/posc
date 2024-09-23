package study.dao;

import java.util.List;

import study.vo.PlanStudyVO;
import study.vo.StudyLeaderVO;
import study.vo.StudyVO;

public interface IStdDetailDao {

	StudyVO getDetailInfo(int no);

	StudyLeaderVO getStudyLeader(int no);

	String getUserID(int no);

	boolean deleteStudyDetail(int no);

	boolean updateStudyDetail(StudyVO studyVO);

	boolean insertStudy(PlanStudyVO paramVO);

	boolean insertStudyMember(PlanStudyVO paramVO2);

	int getMaxNo();

	int updateGetStudyName(String std_name);

	int plusHit(int no);

}
