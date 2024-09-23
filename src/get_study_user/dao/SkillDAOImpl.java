package get_study_user.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import get_study_user.vo.GetStudyListVO;
import get_study_user.vo.GetStudyUserVO;
import get_study_user.vo.SkillVO;
import util.MyBatisUtil;
import vo.MemberVO;

public class SkillDAOImpl implements ISkillDAO {

	private static ISkillDAO instance= null;
	private SkillDAOImpl(){}
	public static ISkillDAO getInstance() {
		if(instance == null) {	//없을 경우에만 생성해주기
			instance = new SkillDAOImpl();
		}
		return instance;
	}
	
	@Override
	public List<SkillVO> selectSkillList() {
		SqlSession session = null;
		List<SkillVO> skillList = null;

		try {
			session = MyBatisUtil.getSqlSession(true);
			skillList = session.selectList("skills.selectSkillList");

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null) {
				session.close();
			}
		}

		return skillList;
	}
	
	
	@Override
	public int insertStudyMemBoard(GetStudyUserVO gsuVO) {
		SqlSession session =null;
		int status = 0;
		
		try {
			
			session=MyBatisUtil.getSqlSession();
			status = session.insert("getStudy.insertStudyMemBoard",gsuVO);
				
			if(status>0) {	//성공
				session.commit();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) {
				session.close();
			}
		}
		
		return status;
	}
	
	
	@Override
	public List<GetStudyListVO> selectStudyList(int gsu_no) {
		SqlSession session = null;
		List<GetStudyListVO> selectStudyList = null;

		try {
			session = MyBatisUtil.getSqlSession(true);
			selectStudyList = session.selectList("skills.getStudyList",gsu_no );

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null) {
				session.close();
			}
		}

		return selectStudyList;
	}
	
	
}

