package admin.adminLoginDao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import ad.vo.AdVO;
import board_it.vo.ItBoardVO;
import board_it.vo.ItVo;
import util.MyBatisUtil;
import vo.MemberVO;

public class AdminDaoImpl implements IAdminDao {

	private static AdminDaoImpl instance = null;

	private AdminDaoImpl() {
	}

	public static AdminDaoImpl getInstance() {
		if (instance == null) {
			instance = new AdminDaoImpl();
		}
		return instance;
	}

	@Override
	public int loginAdmin(Map<String, Object> map) {

		SqlSession session = null;
		int adminId = 0;

		try {

			session = MyBatisUtil.getSqlSession();
			adminId = session.selectOne("admin.Login", map);

		} catch (PersistenceException e) {
			e.printStackTrace();
		} finally {
			session.close();

		}

		return adminId;
	}

	@Override
	public String loginAdminId(Map<String, Object> map) {

		SqlSession session = null;
		String adminId = null;

		try {

			session = MyBatisUtil.getSqlSession();
			adminId = session.selectOne("admin.LoginId", map);

		} catch (PersistenceException e) {
			e.printStackTrace();
		} finally {
			session.close();

		}

		return adminId;
	}

	@Override
	public List<MemberVO> getUserList() {
		
		SqlSession session = null;
		List<MemberVO> memberVO = null;

		try {

			session = MyBatisUtil.getSqlSession();
			memberVO = session.selectList("admin.getUser");

		} catch (PersistenceException e) {
			e.printStackTrace();
		} finally {
			session.close();

		}

		return memberVO;
	}

	@Override
	public List<MemberVO> getBlackUserList() {

		SqlSession session = null;
		List<MemberVO> memberVO = null;

		try {

			session = MyBatisUtil.getSqlSession();
			memberVO = session.selectList("admin.getBlackUser");

		} catch (PersistenceException e) {
			e.printStackTrace();
		} finally {
			session.close();

		}

		return memberVO;
	}
	
	@Override
	public boolean deleteUser(MemberVO memberVO) {
		
		SqlSession session = null;

        try {
            session = MyBatisUtil.getSqlSession(false); 
            int result = session.update("admin.removeUser", memberVO);
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
	public MemberVO selectUser(int no) {
		
		SqlSession session = null;		
		MemberVO memberVO = null;	
		
		
		try {
			session = MyBatisUtil.getSqlSession(true);
			memberVO = session.selectOne("admin.selectUser", no);
			
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			if(session != null) {
				session.close();
			}
		}
		
		
		return memberVO;
	}

	@Override
	public List<MemberVO> searchUser(String keyword) {
		try (SqlSession session = MyBatisUtil.getSqlSession(true)) {
	        Map<String, String> param = new HashMap<>();
	        param.put("keyword", keyword);
	        
	        return session.selectList("admin.searchUser", param);
	    } catch (Exception e) {
	        e.printStackTrace();
	        
	        return new ArrayList<>();
	    }
	}

	@Override
	public List<ItVo> getITBoardTotalList() {

		SqlSession session = null;
		List<ItVo> ItList = null;

		try {

			session = MyBatisUtil.getSqlSession();
			ItList = session.selectList("admin.getITBoard");

		} catch (PersistenceException e) {
			e.printStackTrace();
		} finally {
			session.close();

		}

		return ItList;
	}

	@Override
	public List<ItVo> getITBoardPermit_N_List() {

		SqlSession session = null;
		List<ItVo> ItList = null;

		try {

			session = MyBatisUtil.getSqlSession();
			ItList = session.selectList("admin.getITBoard_N");

		} catch (PersistenceException e) {
			e.printStackTrace();
		} finally {
			session.close();

		}

		return ItList;
	}

	@Override
	public List<ItVo> getITBoardPermit_Y_List() {

		SqlSession session = null;
		List<ItVo> ItList = null;

		try {

			session = MyBatisUtil.getSqlSession();
			ItList = session.selectList("admin.getITBoard_Y");

		} catch (PersistenceException e) {
			e.printStackTrace();
		} finally {
			session.close();

		}

		return ItList;
	}

	@Override
	public ItVo selectIT(int no) {
		
		SqlSession session = null;		
		ItVo itVO = null;	
		
		
		try {
			session = MyBatisUtil.getSqlSession(true);
			itVO = session.selectOne("admin.selectIT", no);
			
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			if(session != null) {
				session.close();
			}
		}
		
		
		return itVO;
	}

	@Override
	public boolean deleteIT(ItVo itVO) {
		
		SqlSession session = null;

        try {
            session = MyBatisUtil.getSqlSession(false); 
            int result = session.update("admin.removeIT", itVO);
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
	public boolean confirmIT(ItVo itVO) {

		SqlSession session = null;

        try {
            session = MyBatisUtil.getSqlSession(false); 
            int result = session.update("admin.confirmIT", itVO);
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

	
}
