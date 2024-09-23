package user.userRLLService;

import java.util.List;
import java.util.Map;

import get_study_user.vo.SkillVO;
import user.vo.SkillsVO;
import vo.MemberVO;

public interface IMemberService {

	int registerMember(MemberVO mv);

	String loginMember(Map<String, Object> memMap);

	String findId(Map<String, Object> findMap);

	String findPw(Map<String, Object> findMap);

	int getMemberNo(Map<String, Object> memMap);

	List<SkillVO> joinSkills();


	int insertSkill(MemberVO mv);





}
