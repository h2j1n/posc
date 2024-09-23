package get_study_user.dao;

import org.apache.ibatis.session.SqlSession;

import get_study_user.vo.ProcessVO;
import get_study_user.vo.StudyMemberVO;
import util.MyBatisUtil;

public class ProcessDAOImpl implements IProcessDAO{
	private static IProcessDAO instance= null;
	private ProcessDAOImpl(){}
	public static IProcessDAO getInstance() {
		if(instance == null) {	//없을 경우에만 생성해주기
			instance = new ProcessDAOImpl();
		}
		return instance;
	}
	
	
	@Override
	public int processInsert(ProcessVO proVO) {
		SqlSession session =null;
		int status = 0;
		
		try {
			
			session=MyBatisUtil.getSqlSession();
			status = session.insert("pro.insertProcess",proVO);
				
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
	public int insertStudyMem(String ap_no) {
		SqlSession session =null;
		int status = 0;
		
		try {
			
			session=MyBatisUtil.getSqlSession();
			status = session.insert("pro.insertStudyMem",ap_no);
				
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
	
	
}
