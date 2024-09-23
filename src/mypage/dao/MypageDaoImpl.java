package mypage.dao;

import java.util.List;
import java.util.Map;

import javax.websocket.Session;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import com.itextpdf.text.pdf.PdfStructTreeController.returnType;
import com.sun.org.apache.bcel.internal.generic.I2F;

import board_it.vo.ItBoardVO;
import get_study_user.vo.GetStudyUserVO;
import mypage.vo.PortfolioVO;
import mypage.vo.ScheduleVO;
import mypage.vo.ToUpdateSkillVO;
import mypage.vo.UserStudyInfo;
import mypage.vo.UserStudyNoProInfo;
import mypage.vo.UserStudyProInfo;
import oracle.jdbc.OracleConnection.CommitOption;
import util.MyBatisUtil;
import vo.LouFreeBoardVO;
import vo.MemberVO;

public class MypageDaoImpl implements IMypageDao {
	
	private static IMypageDao instance;
	
	private MypageDaoImpl() {
		
	}
	
	public static IMypageDao getInstance() {
		if(instance == null) {
			instance = new MypageDaoImpl();
		}
		
		return instance;
	}

	@Override
	public MemberVO selectMember(int user_no) {
		
		MemberVO memberVO = null;
		SqlSession session = null;
		
		try {
			session = MyBatisUtil.getSqlSession(true);
			
			memberVO = session.selectOne("member.selectMember",user_no);
			
		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			if(session != null) {
				session.close();
			}
		}
		
		return memberVO;
	}

	@Override
	public List<String> selectSkillList(int user_no) {
		
		List<String> skillList = null;
		SqlSession session = null;
		
		try {
			session = MyBatisUtil.getSqlSession(true);
			skillList = session.selectList("skill.selectSkillList",user_no);
			
		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			if(session != null) {
				session.close();
			}
		}
		
		return skillList;
	}

	@Override
	public List<ScheduleVO> selectScheduleList(int user_no) {
		
		List<ScheduleVO> scheduleList = null;
		SqlSession session = null;
		
		try {
			session = MyBatisUtil.getSqlSession(true);
			scheduleList = session.selectList("schedule.selectScheduleList",user_no);
			
		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			if(session != null) {
				session.close();
			}
		}
		
		return scheduleList;
	}

	@Override
	public int insertSchedule(ScheduleVO scheduleVO) {
		
		int status = 0;
		SqlSession session = null;
		
		try {
			session = MyBatisUtil.getSqlSession(true);
			status = session.insert("schedule.insertSchedule",scheduleVO);
			
			if(status > 0) {
				session.commit();
			}
			
		} catch (PersistenceException ex) {
			session.rollback();
			ex.printStackTrace();
		} finally {
			if(session != null) {
				session.close();
			}
		}
		
		return status;
	}

	@Override
	public List<ScheduleVO> scheduleDetail(Map<String, String> param) {
		
		List<ScheduleVO> scheduleliList = null;
		SqlSession sqlSession = null;
		
		try {
			sqlSession = MyBatisUtil.getSqlSession(true);
			scheduleliList = sqlSession.selectList("schedule.scheduleDetail",param);
			
		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			if(sqlSession != null) {
				sqlSession.close();
			}
		}
		
		return scheduleliList;
	}

	@Override
	public int updateSchedule(ScheduleVO scheduleVO) {
		
		int status = 0;
		SqlSession sqlSession = null;
		
		try {
			sqlSession = MyBatisUtil.getSqlSession();
			status = sqlSession.update("schedule.updateSchedule", scheduleVO);
			
			if(status > 0) {
				sqlSession.commit();
			}
			
		} catch (PersistenceException ex) {
			sqlSession.rollback();
			ex.printStackTrace();
		} finally {
			if(sqlSession != null) {
				sqlSession.close();
			}
		}
		
		return status;
	}

	@Override
	public int deleteSchedule(String scd_no) {
		
		int status = 0;
		SqlSession sqlSession = null;
		
		try {
			sqlSession = MyBatisUtil.getSqlSession();
			status = sqlSession.update("schedule.deleteSchedule", scd_no);
			
			if(status > 0) {
				sqlSession.commit();
			}
			
		} catch (PersistenceException ex) {
			sqlSession.rollback();
			ex.printStackTrace();
		} finally {
			if(sqlSession != null) {
				sqlSession.close();
			}
		}
		
		return status;
	}

	@Override
	public List<UserStudyInfo> selectUserStudyInfo(int user_no) {
		
		List<UserStudyInfo> userStudyInfoList = null;
		SqlSession sqlSession = null;
		
		try {
			sqlSession = MyBatisUtil.getSqlSession(true);
			userStudyInfoList = sqlSession.selectList("userStudyinfo.selectUserStudyInfo",user_no);
			
			
		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			if(sqlSession != null) {
				sqlSession.close();
			}
		}
		
		return userStudyInfoList;
	}

	@Override
	public int updateUser(MemberVO memberVO) {
		
		int status = 0;
		SqlSession sqlSession = null;
		
		try {
			sqlSession = MyBatisUtil.getSqlSession();
			status = sqlSession.update("member.updateUser",memberVO);
			
			if(status > 0) {
				sqlSession.commit();
			}
			
		} catch (PersistenceException ex) {
			sqlSession.rollback();
			ex.printStackTrace();
		} finally {
			if(sqlSession != null) {
				sqlSession.close();
			}
		}
		
		return status;
	}

	@Override
	public MemberVO selectWithPw(MemberVO memberVO) {
		
		MemberVO result = null;
		SqlSession sqlSession = null;
		
		try {
			sqlSession = MyBatisUtil.getSqlSession(true);
			result = sqlSession.selectOne("member.selectWithPw",memberVO);
			
		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			if(sqlSession != null) {
				sqlSession.close();
			}
		}
		return result;
	}

	@Override
	public int updateUserPw(MemberVO memberVO) {
		
		int status = 0;
		SqlSession sqlSession = null;
		
		try {
			sqlSession = MyBatisUtil.getSqlSession();
			status = sqlSession.update("member.updateUserPw",memberVO);
			
			if(status > 0) {
				sqlSession.commit();
			}
			
		} catch (PersistenceException ex) {
			sqlSession.rollback();
			ex.printStackTrace();
		} finally {
			if(sqlSession != null) {
				sqlSession.close();
			}
		}
		
		return status;
	}

	@Override
	public List<PortfolioVO> selectPort(int user_no) {
		
		List<PortfolioVO> portfolioliList = null;
		SqlSession sqlSession = null;
		
		try {
			sqlSession = MyBatisUtil.getSqlSession();
			portfolioliList = sqlSession.selectList("portfolio.selectPort",user_no);
			
		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			if(sqlSession != null) {
				sqlSession.close();
			}
		}
		
		
		
		return portfolioliList;
	}

	@Override
	public int insertPort(PortfolioVO portfolioVO) {
		
		int status = 0;
		SqlSession sqlSession = null;
		
		try {
			sqlSession = MyBatisUtil.getSqlSession();
			status = sqlSession.insert("portfolio.insertPort",portfolioVO);
			
			if(status > 0) {
				sqlSession.commit();
			}
			
		} catch (PersistenceException ex) {
			sqlSession.rollback();
			ex.printStackTrace();
		} finally {
			if(sqlSession != null) {
				sqlSession.close();
			}
		}
		
		return status;
	}

	@Override
	public PortfolioVO selectPortDetail(int port_no) {
		
		PortfolioVO portVO = null;
		SqlSession sqlSession = null;
		
		try {
			sqlSession = MyBatisUtil.getSqlSession(true);
			portVO = sqlSession.selectOne("portfolio.selectPortDetail",port_no);
			
		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			if (sqlSession != null) {
				sqlSession.close();
			}
		}
		
		return portVO;
	}

	@Override
	public int updatePort(PortfolioVO portVO) {

		int status = 0;
		SqlSession sqlSession = null;
		
		try {
			sqlSession = MyBatisUtil.getSqlSession();
			status = sqlSession.update("portfolio.updatePort",portVO);
			
			if(status > 0) {
				sqlSession.commit();
			}
			
		} catch (PersistenceException ex) {
			sqlSession.rollback();
			ex.printStackTrace();
		} finally {
			if(sqlSession != null) {
				sqlSession.close();
			}
		}
		return status;
	}

	@Override
	public int removePort(PortfolioVO portVO) {
		
		int status = 0;
		SqlSession sqlSession = null;
		
		try {
			sqlSession = MyBatisUtil.getSqlSession();
			status = sqlSession.update("portfolio.removePort",portVO);
			
			if(status > 0) {
				sqlSession.commit();
			}
			
		} catch (PersistenceException ex) {
			sqlSession.rollback();
			ex.printStackTrace();
		} finally {
			if(sqlSession != null) {
				sqlSession.close();
			}
		}
		
		return status;
	}

	@Override
	public List<UserStudyProInfo> selectUserStudyPro(int user_no) {
		List<UserStudyProInfo> userStudyProList = null;
		SqlSession sqlSession = null;
		
		try {
			sqlSession = MyBatisUtil.getSqlSession();
			userStudyProList = sqlSession.selectList("userStudyinfo.selectUserStudyPro",user_no);
			
		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			if(sqlSession != null) {
				sqlSession.close();
			}
		}
		
		return userStudyProList;
	}

	@Override
	public List<ItBoardVO> selectItBoardList(int user_no) {
		
		List<ItBoardVO> itBoardList = null;
		SqlSession sqlSession = null;
		
		try {
			sqlSession = MyBatisUtil.getSqlSession(true);
			itBoardList = sqlSession.selectList("userWriting.selectItBoardList",user_no);
			
		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			if(sqlSession != null) {
				sqlSession.close();
			}
		}
		
		return itBoardList;
	}

	@Override
	public List<LouFreeBoardVO> selectFreeBoardList(int user_no) {
		
		List<LouFreeBoardVO> freeBoardList = null;
		SqlSession sqlSession = null;
		
		try {
			sqlSession = MyBatisUtil.getSqlSession(true);
			freeBoardList = sqlSession.selectList("userWriting.selectFreeBoardList",user_no);
			
		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			if(sqlSession != null) {
				sqlSession.close();
			}
		}
		
		return freeBoardList;
	}

	@Override
	public List<GetStudyUserVO> selectStudyUserList(int user_no) {
		
		List<GetStudyUserVO> studyUserList = null;
		SqlSession sqlSession = null;
		
		try {
			sqlSession = MyBatisUtil.getSqlSession(true);
			studyUserList = sqlSession.selectList("userWriting.selectStudyUserList",user_no);
			
		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			if(sqlSession!=null) {
				sqlSession.close();
			}
		}
		
		return studyUserList;
	}

	@Override
	public List<ToUpdateSkillVO> selectUpSkillList(int user_no) {
		
		List<ToUpdateSkillVO> updateSkillList = null;
		SqlSession sqlSession = null;
		
		try {
			sqlSession = MyBatisUtil.getSqlSession(true);
			updateSkillList = sqlSession.selectList("skill.selectUpSkillList",user_no);
			
		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			if(sqlSession != null) {
				sqlSession.close();
			}
		}
		
		return updateSkillList;
	}

	@Override
	public int deleteSkill(ToUpdateSkillVO upSkillVO) {
		
		int status = 0;
		SqlSession sqlSession = null;
		
		try {
			sqlSession = MyBatisUtil.getSqlSession();
			status = sqlSession.delete("skill.deleteSkill",upSkillVO);
			if(status > 0) {
				sqlSession.commit();
			}
			
		} catch (PersistenceException ex) {
			sqlSession.rollback();
			ex.printStackTrace();
		} finally {
			if(sqlSession != null) {
				sqlSession.close();
			}
		}
		
		return status;
	}

	@Override
	public int insertSkill(ToUpdateSkillVO addVO) {

		int status = 0;
		SqlSession sqlSession = null;
		
		try {
			sqlSession = MyBatisUtil.getSqlSession();
			status = sqlSession.insert("skill.insertSkill",addVO);
			if(status > 0) {
				sqlSession.commit();
			}
			
		} catch (PersistenceException ex) {
			sqlSession.rollback();
			ex.printStackTrace();
		} finally {
			if(sqlSession != null) {
				sqlSession.close();
			}
		}
		
		return status;
	}

	@Override
	public List<UserStudyNoProInfo> selectStudyNoProList(int user_no) {
		
		List<UserStudyNoProInfo> studyNoProInfoList = null;
		SqlSession sqlSession = null;
		
		try {
			sqlSession = MyBatisUtil.getSqlSession(true);
			studyNoProInfoList = sqlSession.selectList("userStudyinfo.selectStudyNoProList",user_no);
			
		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			if(sqlSession != null) {
				sqlSession.close();
			}
		}
		
		return studyNoProInfoList;
	}

	@Override
	public int deleteStudyApply(int ap_no) {
		
		int status = 0;
		SqlSession sqlSession = null;
		
		try {
			sqlSession = MyBatisUtil.getSqlSession();
			status = sqlSession.delete("userStudyinfo.deleteStudyApply",ap_no);
			
			if(status > 0) {
				sqlSession.commit();
			}
			
		} catch (PersistenceException ex) {
			sqlSession.rollback();
			ex.printStackTrace();
		} finally {
			if(sqlSession != null) {
				sqlSession.close();
			}
		}
		
		return status; 
	}
	
}
