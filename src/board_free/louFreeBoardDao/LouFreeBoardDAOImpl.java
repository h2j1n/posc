package board_free.louFreeBoardDao;

import java.nio.channels.SeekableByteChannel;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import board_free.vo.FrcoVO;
import board_post.vo.PostBoardVO;
import javafx.scene.Parent;
import util.MyBatisUtil;
import vo.LouFreeBoardVO;

public class LouFreeBoardDAOImpl implements ILouFreeBoardDAO {

	
	private static LouFreeBoardDAOImpl instance = null;

	private LouFreeBoardDAOImpl() {
	}

	public static LouFreeBoardDAOImpl getInstance() {
		if (instance == null) {
			instance = new LouFreeBoardDAOImpl();
		}
		return instance;
	}

	@Override
	public List<LouFreeBoardVO> FreeBoardList() {
		SqlSession session = null;
		List<LouFreeBoardVO> boardList =null;
		
		
		try {
			session = MyBatisUtil.getSqlSession();
			boardList = session.selectList("louFreeBoard.BoardList");
			
			
		} catch (PersistenceException e) {
			e.printStackTrace();
		}finally {
			if(session!=null) {
			session.close();
				
			}
			
			
		}
		
		
		
		return boardList;
	}

	@Override
	public int RegisterBoard(LouFreeBoardVO louFreeBoardVO) {
		SqlSession session = null;
		int cnt = 0;
		

		try {
			session = MyBatisUtil.getSqlSession();
			
			cnt = session.insert("louFreeBoard.registerBoard",louFreeBoardVO);
			if(0<cnt) {
				session.commit();
				
				
				
			}

		} catch (PersistenceException e) {
			e.printStackTrace();
		} finally {
			session.close();

		}
		
		return cnt;
	}

	@Override
	public LouFreeBoardVO detailBoard(int parseInt) {
		SqlSession session = null;
		LouFreeBoardVO louFreeBoardVO = null;
		

		try {
			session = MyBatisUtil.getSqlSession(true);
			louFreeBoardVO = session.selectOne("louFreeBoard.detailBoard",parseInt);
			

		} catch (PersistenceException e) {
			e.printStackTrace();
		} finally {
			session.close();

		}
		
		
		
		
		
		
		
		return louFreeBoardVO;
	}

	@Override
	public int UpdateBoard(LouFreeBoardVO freeBoardVO) {
		SqlSession session = null;
		int cnt = 0;
			
			try {
				
				session=MyBatisUtil.getSqlSession();
				cnt = session.update("louFreeBoard.updateBoard",freeBoardVO);
				
						if(0<cnt) {
							session.commit();
						}
						
						
						
						
						
			} catch (PersistenceException e) {
				e.printStackTrace();
			}finally {
				session.close();
				
				
			}
		
		
		return cnt;
	}

	@Override
	public int deleteBoard(int parseInt) {
		SqlSession session = null;
		int cnt = 0;
		
			
			
			try {
				
				session=MyBatisUtil.getSqlSession();
				cnt = session.delete("louFreeBoard.deleteBoard",parseInt);
				
				if(0<cnt) {
					session.commit();
				}
						
			} catch (PersistenceException e) {
				e.printStackTrace();
			}finally {
				session.close();
				
				
			}
		
		
		return cnt;
	}



	@Override
	public List<LouFreeBoardVO> searchList(String keyword) {
		SqlSession session = null;
			 
		List<LouFreeBoardVO> searchList =null;
			
			try {
				Map<String, String> map = new HashMap<String, String>();
				map.put("keyword", keyword);
				session=MyBatisUtil.getSqlSession();
				searchList = session.selectList("louFreeBoard.searchList",map);
						
						
			} catch (PersistenceException e) {
				e.printStackTrace();
			}finally {
				session.close();
				
				
			}
		
		
		
		return searchList;
	}

	@Override
	public int getTotalFrees() {
		
		SqlSession session = null;
		int cnt = 0;
			try {
				session=MyBatisUtil.getSqlSession(true);
				cnt = session.selectOne("louFreeBoard.getTotalFrees");		
			} catch (PersistenceException e) {
				e.printStackTrace();
			}finally {
				session.close();
			}
		
		
		
		
		
		
		return cnt;
	}

	
	
	
	
	
	
	
	@Override
	public List<LouFreeBoardVO> pageBoardList(int page, int pageSize) {
		
		SqlSession session = null;
		List<LouFreeBoardVO> pageBoardList= null;
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", (page-1)*pageSize);
		map.put("pageSize", pageSize);
		
		
			try {
				
				session=MyBatisUtil.getSqlSession();
				pageBoardList = session.selectList("louFreeBoard.pageBoardList",map);
			} catch (PersistenceException e) {
				e.printStackTrace();
			}finally {
				session.close();
				
				
			}
		
		
		return pageBoardList;
	}

	@Override
	public int updateHit(int parseInt) {
		SqlSession session = null;
		int hitPlus = 0;
			
			try {
				
				session=MyBatisUtil.getSqlSession();
				hitPlus = session.update("louFreeBoard.hitPlus",parseInt);
				
				if(0<hitPlus) {
					session.commit();
				}
						
						
			} catch (PersistenceException e) {
				e.printStackTrace();
			}finally {
				session.close();
				
				
			}
		
		
		
		return hitPlus;
	}

	@Override
	public List<LouFreeBoardVO> searchResult(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	
//	댓글 기능
	// 댓글 불러오기
	@Override
	public List<FrcoVO> getCommentsByPostNo(int freeNo) {
	    List<FrcoVO> comments = new ArrayList<>();
	    try (SqlSession session = MyBatisUtil.getSqlSession(true)) {
	        comments = session.selectList("louFreeBoard.getCommentsByPostNo", freeNo);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return comments;
	}
	
	// 댓글 추가하기
	@Override
	public boolean insertComment(FrcoVO comment) {
	    try (SqlSession session = MyBatisUtil.getSqlSession(true)) {
	        int count = session.insert("louFreeBoard.insertComment", comment);
	        return count > 0;
	    } catch (Exception e) {
	        e.printStackTrace();
	        return false;
	    }
	}
	
	
	// 댓글 삭제하기
	@Override
	public boolean deleteComment(int commentNo) {
		SqlSession session = null;
		
		try {
			session = MyBatisUtil.getSqlSession(false); 
			int result = session.update("louFreeBoard.deleteComment", commentNo);
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
	
	
	
	
	
	// 댓글 수정하기
	@Override
	public int updateComment(FrcoVO comment) {
		SqlSession session = null;		// db와 연결하기 위한 생산품
		int status = 0;	
		
		try {
			session = MyBatisUtil.getSqlSession();
			status = session.update("louFreeBoard.updateComment", comment);

			if(status>0) {	//성공
				session.commit();
			}
			
		}catch(Exception e){
			session.rollback();
			e.printStackTrace();
		}finally {
			if(session != null) {
				session.close();
			}
		}
		
		return status;
	}
	
	@Override
	public LouFreeBoardVO selectBoard(int no) {
		SqlSession session = null;		// db와 연결하기 위한 생산품
		LouFreeBoardVO louFreeBoardVO = null;	// 전체 목록 데이터를 받을 변수
		
		
		try {
			session = MyBatisUtil.getSqlSession(true);
			louFreeBoardVO = session.selectOne("louFreeBoard.selectBoard", no);
			
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			if(session != null) {
				session.close();
			}
		}
		
		
		return louFreeBoardVO;
	}





	
	
	
	
	
	
}
