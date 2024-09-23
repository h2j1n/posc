package get_study_user.service;

import get_study_user.vo.ProcessVO;
import get_study_user.vo.StudyMemberVO;

public interface IProcessService {

	int processInsert(ProcessVO proVO);

	int insertStudyMem(String ap_no);


}
