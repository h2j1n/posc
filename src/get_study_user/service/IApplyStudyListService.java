package get_study_user.service;

import java.util.List;
import java.util.Map;

import get_study_user.vo.ApplyVO;

public interface IApplyStudyListService {

	List<ApplyVO> getApply(int i);

	int deleteStudyMem(String ap_no);

	String getGsuNo(String gsu_no);

	

}
