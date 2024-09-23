package ad.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import ad.vo.AdVO;
import util.MyBatisUtil;

public class AdDaoImpl implements IAdDao{
	private static AdDaoImpl instance = null;
	private AdDaoImpl() {}
	
	public static IAdDao getInstance() {
		if(instance == null) {
			instance = new AdDaoImpl();
		}
		return instance;
	}
	
	// 컨펌된 리스트 
	@Override
	public List<AdVO> confirmList() {
		SqlSession session = null;		// db와 연결하기 위한 생산품
		List<AdVO> confirmList = null;	// 전체 목록 데이터를 받을 변수
				
				
		try {
			session = MyBatisUtil.getSqlSession(true);
			confirmList = session.selectList("ad.confirmList");
					
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			if(session != null) {
				session.close();
			}
		}
				
				
		return confirmList;
	}
	
	// 신청받은 리스트
	@Override
	public List<AdVO> adList() {
		SqlSession session = null;		// db와 연결하기 위한 생산품
		List<AdVO> adList = null;	// 전체 목록 데이터를 받을 변수
				
				
		try {
			session = MyBatisUtil.getSqlSession(true);
			adList = session.selectList("ad.adList");
					
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			if(session != null) {
				session.close();
			}
		}
				
				
		return adList;
	}

	@Override
	public AdVO selectad(int no) {
		SqlSession session = null;		// db와 연결하기 위한 생산품
		AdVO adVO = null;	// 전체 목록 데이터를 받을 변수
		
		
		try {
			session = MyBatisUtil.getSqlSession(true);
			adVO = session.selectOne("ad.selectad", no);
			
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			if(session != null) {
				session.close();
			}
		}
		
		
		return adVO;
	}
	
	// 광고 삭제
	@Override
	public boolean deleteAd(AdVO adList) {
		SqlSession session = null;

        try {
            session = MyBatisUtil.getSqlSession(false); 
            int result = session.update("ad.deleteAd", adList);
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
	
	//광고 승인
	@Override
	public boolean confirmAd(AdVO adList) {
		SqlSession session = null;

        try {
            session = MyBatisUtil.getSqlSession(false); 
            int result = session.update("ad.confirmAd", adList);
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

	// 사용자 광고 추가
	@Override
	public int insertAd(AdVO adList) {
		SqlSession session = null;		// db와 연결하기 위한 생산품
		int status = 0;	
		
		
		try {
			session = MyBatisUtil.getSqlSession();
			status = session.insert("ad.insertAd", adList);
			
			if(status>0) {	//성공
				session.commit();
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			if(session != null) {
				session.close();
			}
		}
		
		
		return status;
	}
	
	// 관리자 광고 추가
	@Override
	public int insertAd_admin(AdVO adList) {
		SqlSession session = null;		// db와 연결하기 위한 생산품
		int status = 0;	
		
		
		try {
			session = MyBatisUtil.getSqlSession();
			status = session.insert("ad.insertAd_admin", adList);
			
			if(status>0) {	//성공
				session.commit();
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			if(session != null) {
				session.close();
			}
		}
		
		
		return status;
	}

	//컨펌 광고 메인 출력
	@Override
	public List<AdVO> getConfirmedAds() {
		SqlSession session = null;
        List<AdVO> confirmedAds = null;

        try {
            session = MyBatisUtil.getSqlSession(true);
            confirmedAds = session.selectList("ad.getConfirmedAds");

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
        }

        return confirmedAds;
    }
	
	

}
