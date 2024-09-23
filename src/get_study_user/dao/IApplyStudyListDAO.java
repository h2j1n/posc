package get_study_user.dao;

import java.util.List;
import java.util.Map;

import get_study_user.vo.ApplyVO;

public interface IApplyStudyListDAO {

	List<ApplyVO> getApply(int std_no);

	int deleteStudyMem(String ap_no);

	String getGsuNo(String gsu_no);



}
