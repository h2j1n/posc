package get_study_user.dao;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import get_study_user.vo.ApplyVO;
import get_study_user.vo.GetStudyListVO;
import get_study_user.vo.GetStudyUserVO;
import get_study_user.vo.ProcessVO;
import get_study_user.vo.StudyMemberVO;
import util.MyBatisUtil;
import vo.LouFreeBoardVO;
import vo.MemberVO;

public class GetStudyListDAOImpl implements IGetStudyListDAO{

	private static GetStudyListDAOImpl instance=null;
	
	private GetStudyListDAOImpl() {
		
	}
	
	public static GetStudyListDAOImpl getInstance() {
		if(instance == null) {	//없을 경우에만 생성해주기
			instance = new GetStudyListDAOImpl();
		}
		return instance;
	}


	
	@Override
	public List<GetStudyUserVO> getStudyList() {
		SqlSession session = null;		//디비와 연결하기 위한 생산품
		List<GetStudyUserVO> studyList = null;	//전체 목록 데이터를 받을 변수
		
		try {
			
			session=MyBatisUtil.getSqlSession(true);
			studyList = session.selectList("getStudy.getStudyList");
			 
		} catch (PersistenceException e) {
			e.printStackTrace();
		}finally {
			if(session != null) {
				session.close();
			}
		}
		
		return studyList;
	}


	@Override
	public GetStudyUserVO selectDetailBoard(int parseInt) {
		SqlSession session = null;
		GetStudyUserVO gsuVO = null;
		

		try {
			session = MyBatisUtil.getSqlSession(true);
			gsuVO = session.selectOne("getStudy.getStudyDetailList",parseInt);

		} catch (PersistenceException e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return gsuVO;
	}


	@Override
	public GetStudyUserVO addHit(int gsu_no) {
		SqlSession session = null;		//디비와 연결하기 위한 생산품
		GetStudyUserVO gsuVO = null;	//전체 목록 데이터를 받을 변수
		
		try {
			session=MyBatisUtil.getSqlSession(true); //true: 커밋여부  ,ㅣ 삭제등록업데이트는  false 
			gsuVO = session.selectOne("getStudy.addHit",gsu_no);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) {
				session.close();
			}
		}
		
		return gsuVO;
	}


	@Override
	public int deleteGetStudy(int parseInt) {
		SqlSession session =null;
		int status = 0;
		
		try {
			
			session=MyBatisUtil.getSqlSession();
			status = session.delete("getStudy.deleteGetStudy",parseInt);
				
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
	public int getStudyUpdate(GetStudyUserVO gsuVO) {
		SqlSession session =null;
		int status = 0;
		
		try {
			
			session=MyBatisUtil.getSqlSession();
			status = session.update("getStudy.getStudyUpdate",gsuVO);
				
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
	public List<StudyMemberVO> selectStudyMemList(int parseInt) {
		SqlSession session = null;		//디비와 연결하기 위한 생산품
		List<StudyMemberVO> studyMemList = null;	//전체 목록 데이터를 받을 변수
		
		try {
			
			session=MyBatisUtil.getSqlSession(true);
			studyMemList = session.selectList("getStudy.getStudyMemberList");
			 
		} catch (PersistenceException e) {
			e.printStackTrace();
		}finally {
			if(session != null) {
				session.close();
			}
		}
		
		return studyMemList;
	}

	@Override
	public int applyMember(ApplyVO aplVO) {
		SqlSession session =null;
		int status = 0;
		
		try {
			
			session=MyBatisUtil.getSqlSession();
			status = session.insert("getStudy.applyMember",aplVO);
				
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
	public String studyList(String std_name) {
		SqlSession session = null;		//디비와 연결하기 위한 생산품
		String std_no = null;	//전체 목록 데이터를 받을 변수
		
		try {
			session=MyBatisUtil.getSqlSession(true);
			std_no = session.selectOne("getStudy.getStudyNo",std_name);
			 
		} catch (PersistenceException e) {
			e.printStackTrace();
		}finally {
			if(session != null) {
				session.close();
			}
		}
		
		return std_no;
	}

	@Override
	public List<MemberVO> userNameList() {
		SqlSession session = null;		//디비와 연결하기 위한 생산품
		List<MemberVO> userNameList = null;	//전체 목록 데이터를 받을 변수
		
		try {
			session=MyBatisUtil.getSqlSession(true);
			userNameList = session.selectList("getStudy.userNameList");
		} catch (PersistenceException e) {
			e.printStackTrace();
		}finally {
			if(session != null) {
				session.close();
			}
		}
		
		return userNameList;
	}

	@Override
	public List<ApplyVO> selectaplList(int gsu_no) {
		SqlSession session = null;		//디비와 연결하기 위한 생산품
		List<ApplyVO> selectaplList = null;	//전체 목록 데이터를 받을 변수
		
		try {
			
			session=MyBatisUtil.getSqlSession(true);
			selectaplList = session.selectList("getStudy.selectaplList");
			 
		} catch (PersistenceException e) {
			e.printStackTrace();
		}finally {
			if(session != null) {
				session.close();
			}
		}
		
		return selectaplList;
	}

	
}
