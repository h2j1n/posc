package user.userRLLDao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.print.attribute.standard.Fidelity;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import get_study_user.vo.SkillVO;
import user.vo.SkillsVO;
import util.MyBatisUtil;
import vo.MemberVO;

public class MemberDAOImpl implements IMemberDAO {

	private static MemberDAOImpl instance = null;

	private MemberDAOImpl() {

	}

	public static MemberDAOImpl getInstance() {
		if (instance == null) {
			instance = new MemberDAOImpl();
		}
		return instance;
	}

	@Override
	public int registerMember(MemberVO mv) {
		SqlSession session = null;
		int status = 0;
		try {
			session = MyBatisUtil.getSqlSession();

			status = session.insert("member.registerMember", mv);
			if (0 < status) {
				session.commit();
			}
		} catch (PersistenceException e) {
			session.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}

		return status;
	}

	@Override
	public String loginMember(Map<String, Object> memMap) {
		SqlSession session = null;
		String sessionId = "";

		try {
			session = MyBatisUtil.getSqlSession();
			sessionId = session.selectOne("member.loginMember", memMap);

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			session.close();

		}

		return sessionId;
	}

	@Override
	public String findId(Map<String, Object> findMap) {
		SqlSession session = null;
		String findId = "";

		try {
			session = MyBatisUtil.getSqlSession(true);

			findId = session.selectOne("member.findMember", findMap);

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			session.close();
		}

		return findId;
	}

	@Override
	public String findPw(Map<String, Object> findMap) {

		SqlSession session = null;
		String findPw = "";

		try {
			session = MyBatisUtil.getSqlSession(true);

			findPw = session.selectOne("member.findMemberPw", findMap);

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			session.close();
		}

		return findPw;
	}

	@Override
	public int getMemberNo(Map<String, Object> memMap) {

		SqlSession session = null;
		int memberNo = 0;

		try {
			session = MyBatisUtil.getSqlSession(true);

			memberNo = session.selectOne("member.getMemberNo", memMap);
			
				

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			session.close();
		}

		return memberNo;
	}

	@Override
	public List<SkillVO> joinSkills() {
		
		SqlSession session = null;
		List<SkillVO> skills =null;
			
			
			try {
				
				session=MyBatisUtil.getSqlSession(true);
				skills = session.selectList("member.joinSkills");
						
						
						
			} catch (PersistenceException e) {
				e.printStackTrace();
			}finally {
				session.close();
				
				
			}
		
		
		
		return skills;
	}

	@Override
	public int insertSkill(MemberVO mv) {
		SqlSession session = null;
		int cnt = 0;
			
		try {
			
			session=MyBatisUtil.getSqlSession();
			Map<String, Object> param = null;
			if(mv.getUser_fav() != null) {
				String[] favArr = mv.getUser_fav().split(",");
				param = new HashMap<String, Object>();
				param.put("user_no", mv.getUser_no());
				for(int i = 0; i < favArr.length; i++) {
					param.put("skillName", favArr[i]);
					cnt = session.insert("member.insertSkills",param);
					if(cnt > 0) {
						session.commit();
					}
				}
				
			}
		} catch (PersistenceException e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return cnt;
	}


}
