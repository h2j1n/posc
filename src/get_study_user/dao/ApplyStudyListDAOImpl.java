package get_study_user.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import get_study_user.vo.ApplyVO;
import get_study_user.vo.GetStudyUserVO;
import main.vo.MainHotVO;
import util.MyBatisUtil;

public class ApplyStudyListDAOImpl implements IApplyStudyListDAO {

	private static ApplyStudyListDAOImpl instance = null;

	private ApplyStudyListDAOImpl() {
		
	}

	public static ApplyStudyListDAOImpl getInstance() {
		if (instance == null) { // 없을 경우에만 생성해주기
			instance = new ApplyStudyListDAOImpl();
		}
		return instance;
	}



	@Override
	public List<ApplyVO> getApply(int std_no) {
		SqlSession session = null;		//디비와 연결하기 위한 생산품
		List<ApplyVO> applyList = null;	//전체 목록 데이터를 받을 변수
		
		try {
			
			session=MyBatisUtil.getSqlSession(true);
			applyList = session.selectList("apply.applyList",std_no);
			if(applyList!=null) {
				System.out.println("applyList 가져옴");
			}
			 
		} catch (PersistenceException e) {
			e.printStackTrace();
		}finally {
			if(session != null) {
				session.close();
			}
		}
		return applyList;
	}

	@Override
	public int deleteStudyMem(String ap_no) {
		SqlSession session =null;
		int status = 0;
		
		try {
			
			session=MyBatisUtil.getSqlSession();
			status = session.delete("apply.deleteStudyMem",ap_no);
				
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
	public String getGsuNo(String ap_no) {
		SqlSession session = null;		//디비와 연결하기 위한 생산품
		String gsu_no= null;	//전체 목록 데이터를 받을 변수
		
		try {
			
			session=MyBatisUtil.getSqlSession(true);
			gsu_no = session.selectOne("apply.getGsuNo",ap_no);
			if(gsu_no!=null) {
			}
			 
		} catch (PersistenceException e) {
			e.printStackTrace();
		}finally {
			if(session != null) {
				session.close();
			}
		}
		return gsu_no;
	}


}
