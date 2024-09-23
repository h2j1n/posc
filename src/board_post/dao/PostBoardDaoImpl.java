package board_post.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import board_post.vo.PostBoardVO;
import board_post.vo.StcoVO;
import util.MyBatisUtil;

public class PostBoardDaoImpl implements IPostBoardDao{

	private static PostBoardDaoImpl instance = null;
	private PostBoardDaoImpl() {}
	
	public static IPostBoardDao getInstance() {
		if(instance == null) {
			instance = new PostBoardDaoImpl();
		}
		return instance;
	}
	// 게시판 기능
	@Override
	public List<PostBoardVO> postboardList() {
		SqlSession session = null;		// db와 연결하기 위한 생산품
		List<PostBoardVO> postboardList = null;	// 전체 목록 데이터를 받을 변수
				
				
		try {
			session = MyBatisUtil.getSqlSession(true);
			postboardList = session.selectList("postboard.postboardList");
					
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			if(session != null) {
				session.close();
			}
		}
				
				
		return postboardList;
	}

	@Override
	public PostBoardVO selectBoard(int no) {
		SqlSession session = null;		// db와 연결하기 위한 생산품
		PostBoardVO postboardVO = null;	// 전체 목록 데이터를 받을 변수
		
		
		try {
			session = MyBatisUtil.getSqlSession(true);
			postboardVO = session.selectOne("postboard.selectBoard", no);
			
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			if(session != null) {
				session.close();
			}
		}
		
		
		return postboardVO;
	}

	@Override
	public PostBoardVO hitupdate(int no) {
		SqlSession session = null;		// db와 연결하기 위한 생산품
		PostBoardVO postboardVO = null;	// 전체 목록 데이터를 받을 변수
		
		
		try {
			session = MyBatisUtil.getSqlSession(true);
			postboardVO = session.selectOne("postboard.hitupdate", no);
			
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			if(session != null) {
				session.close();
			}
		}
		
		
		return postboardVO;
	}

	@Override
	public boolean deletePostBoard(PostBoardVO postboard) {
		 SqlSession session = null;

	        try {
	            session = MyBatisUtil.getSqlSession(false); 
	            int result = session.update("postboard.deletePostBoard", postboard);
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
	public int insertPostBoard(PostBoardVO postboardVO) {
		SqlSession session = null;		// db와 연결하기 위한 생산품
		int status = 0;	
		
		
		try {
			session = MyBatisUtil.getSqlSession();
			status = session.insert("postboard.insertPostBoard", postboardVO);
			
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

	@Override
	public int updateBoard(PostBoardVO postboardVO) {
		SqlSession session = null;		// db와 연결하기 위한 생산품
		int status = 0;	
		
		try {
			session = MyBatisUtil.getSqlSession();
			status = session.update("postboard.updateBoard", postboardVO);

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
	
	
	
	
//	댓글 기능
	// 댓글 불러오기
	@Override
	public List<StcoVO> getCommentsByPostNo(int postNo) {
	    List<StcoVO> comments = new ArrayList<>();
	    try (SqlSession session = MyBatisUtil.getSqlSession(true)) {
	        comments = session.selectList("postboard.getCommentsByPostNo", postNo);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return comments;
	}
	
	// 댓글 추가하기
	@Override
	public boolean insertComment(StcoVO comment) {
	    try (SqlSession session = MyBatisUtil.getSqlSession(true)) {
	        int count = session.insert("postboard.insertComment", comment);
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
			int result = session.update("postboard.deleteComment", commentNo);
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
	public StcoVO selectcomment(int no) {
		SqlSession session = null;		// db와 연결하기 위한 생산품
		StcoVO comment = null;	// 전체 목록 데이터를 받을 변수
		
		
		try {
			session = MyBatisUtil.getSqlSession(true);
			comment = session.selectOne("postboard.selectcomment", no);
			
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			if(session != null) {
				session.close();
			}
		}
		
		
		return comment;
	}
	
	// 댓글 수정하기
	@Override
	public int updateComment(StcoVO comment) {
		SqlSession session = null;		// db와 연결하기 위한 생산품
		int status = 0;	
		
		try {
			session = MyBatisUtil.getSqlSession();
			status = session.update("postboard.updateComment", comment);

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
	
	
	// 페이징 기능

	@Override
    public int getTotalPosts() {
        try (SqlSession session = MyBatisUtil.getSqlSession(true)) {
            return session.selectOne("postboard.getTotalPosts");
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }

    @Override
    public List<PostBoardVO> getPostboardListByPage(int page, int pageSize) {
        try (SqlSession session = MyBatisUtil.getSqlSession(true)) {
            Map<String, Integer> parameters = new HashMap<>();
            parameters.put("start", (page - 1) * pageSize);
            parameters.put("pageSize", pageSize);
            return session.selectList("postboard.getPostboardListByPage", parameters);
        } catch (Exception e) {
            e.printStackTrace();
            return new ArrayList<>();
        }
    }

    
    
    // 검색기능
	
	@Override
	public List<PostBoardVO> searchBoard(String keyword) {
	    try (SqlSession session = MyBatisUtil.getSqlSession(true)) {
	        Map<String, String> parameters = new HashMap<>();
	        parameters.put("keyword", keyword);
	        return session.selectList("postboard.searchBoard", parameters);
	    } catch (Exception e) {
	        e.printStackTrace();
	        return new ArrayList<>();
	    }
	}


	


	
	


}
