package user.userRLLService;

import java.util.List;
import java.util.Map;

import get_study_user.vo.SkillVO;
import user.userRLLDao.IMemberDAO;
import user.userRLLDao.MemberDAOImpl;
import user.vo.SkillsVO;
import vo.MemberVO;

public class MemberServiceImpl implements IMemberService {

	
	private static IMemberDAO dao = MemberDAOImpl.getInstance();
	private static MemberServiceImpl instance =null;
	
	private MemberServiceImpl() {
	}
	
	public static MemberServiceImpl getInstance() {
		if(instance==null) {
			instance= new MemberServiceImpl();
		}
		return instance;
	}

	@Override
	public int registerMember(MemberVO mv) {
		
		
		return dao.registerMember(mv);
	}

	@Override
	public String loginMember(Map<String, Object> memMap) {
		
		
		return dao.loginMember(memMap);
	}

	@Override
	public String findId(Map<String, Object> findMap) {
		
		return dao.findId(findMap);
	}

	@Override
	public String findPw(Map<String, Object> findMap) {
		
		return dao.findPw(findMap);
	}
	
	

	@Override
	public int getMemberNo(Map<String, Object> memMap) {
		return dao.getMemberNo(memMap);
	}

	@Override
	public List<SkillVO> joinSkills() {
		// TODO Auto-generated method stub
		return dao.joinSkills();
	}



	@Override
	public int insertSkill(MemberVO mv) {
		// TODO Auto-generated method stub
		return dao.insertSkill(mv);
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
