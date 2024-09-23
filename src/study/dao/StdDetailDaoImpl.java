package study.dao;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import study.vo.PlanStudyVO;
import study.vo.StudyLeaderVO;
import study.vo.StudyVO;
import util.MyBatisUtil;

public class StdDetailDaoImpl implements IStdDetailDao{
	private static StdDetailDaoImpl instance = null;

	private StdDetailDaoImpl() {
	}

	public static StdDetailDaoImpl getInstance() {
		if (instance == null) {
			instance = new StdDetailDaoImpl();
		}
		return instance;
	}

	@Override
	public StudyVO getDetailInfo(int no) {

		SqlSession session = null;
		StudyVO stdVO = null;

		try {

			session = MyBatisUtil.getSqlSession();
			stdVO = session.selectOne("stdDetail.getStudyDetail", no);

		} catch (PersistenceException e) {
			e.printStackTrace();
		} finally {
			session.close();

		}

		return stdVO;
	}

	@Override
	public StudyLeaderVO getStudyLeader(int no) {

		SqlSession session = null;
		StudyLeaderVO slVO = null;

		try {

			session = MyBatisUtil.getSqlSession();
			slVO = session.selectOne("stdDetail.getStudyLeader", no);

		} catch (PersistenceException e) {
			e.printStackTrace();
		} finally {
			session.close();

		}

		return slVO;
	}

	@Override
	public String getUserID(int no) {
		
		SqlSession session = null;
		String user_id = "";

		try {

			session = MyBatisUtil.getSqlSession();
			user_id = session.selectOne("stdDetail.getUserID", no);

		} catch (PersistenceException e) {
			e.printStackTrace();
		} finally {
			session.close();

		}

		return user_id;
	}

	@Override
	public boolean deleteStudyDetail(int no) {
		
		SqlSession session = null;
		
		try {
            session = MyBatisUtil.getSqlSession(false); 
            int result = session.update("stdDetail.deleteStudyDetail", no);
            session.commit();

            return result > 0;
        } catch (Exception e) {
            if (session != null) {
                session.rollback();
            }
            e.printStackTrace(); 
            return false; 
        } finally {
            if (session != null) {
                session.close(); 
            }
        }
	}

	@Override
	public boolean updateStudyDetail(StudyVO studyVO) {

		SqlSession session = null;
		
		try {
            session = MyBatisUtil.getSqlSession(false); 
            int result = session.update("stdDetail.updateStudyDetail", studyVO);
            session.commit();

            return result > 0;
        } catch (Exception e) {
            if (session != null) {
                session.rollback();
            }
            e.printStackTrace(); 
            return false; 
        } finally {
            if (session != null) {
                session.close(); 
            }
        }
	}

	@Override
	public boolean insertStudy(PlanStudyVO paramVO) {

		SqlSession session = null;
		
		try {
            session = MyBatisUtil.getSqlSession(true); 
            int result = session.insert("stdDetail.insertStudy", paramVO);
            session.commit();

            return result > 0;
        } catch (Exception e) {
            if (session != null) {
                session.rollback();
            }
            e.printStackTrace(); 
            return false; 
        } finally {
            if (session != null) {
                session.close(); 
            }
        }
	}

	@Override
	public boolean insertStudyMember(PlanStudyVO paramVO2) {

		SqlSession session = null;
		
		try {
            session = MyBatisUtil.getSqlSession(true); 
            int result = session.insert("stdDetail.insertStudyMember", paramVO2);
            session.commit();

            return result > 0;
        } catch (Exception e) {
            if (session != null) {
                session.rollback();
            }
            e.printStackTrace(); 
            return false; 
        } finally {
            if (session != null) {
                session.close(); 
            }
        }
	}

	@Override
	public int getMaxNo() {

		SqlSession session = null;
		int std_no = 0;

		try {

			session = MyBatisUtil.getSqlSession();
			std_no = session.selectOne("stdDetail.getMaxNo");

		} catch (PersistenceException e) {
			e.printStackTrace();
		} finally {
			session.close();

		}

		return std_no;
	}

	@Override
	public int updateGetStudyName(String std_name) {

		SqlSession session = null;
		int result = 0;
				
		try {
            session = MyBatisUtil.getSqlSession(false); 
            result = session.update("stdDetail.updateGetStudyName", std_name);
            session.commit();

            return result;
        } catch (Exception e) {
            if (session != null) {
                session.rollback();
            }
            e.printStackTrace(); 
        } finally {
            if (session != null) {
                session.close(); 
            }
        }
		return result;
	}

	@Override
	public int plusHit(int no) {
		
		SqlSession session = null;
		int result = 0;
				
		try {
            session = MyBatisUtil.getSqlSession(false); 
            result = session.update("stdDetail.plusHit", no);
            session.commit();

            return result;
        } catch (Exception e) {
            if (session != null) {
                session.rollback();
            }
            e.printStackTrace(); 
        } finally {
            if (session != null) {
                session.close(); 
            }
        }
		return result;
	}
	
	
}
