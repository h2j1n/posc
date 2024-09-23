package get_study_user.dao;

import get_study_user.vo.ProcessVO;
import get_study_user.vo.StudyMemberVO;

public interface IProcessDAO {

	int processInsert(ProcessVO proVO);

	int insertStudyMem(String ap_no);


}
