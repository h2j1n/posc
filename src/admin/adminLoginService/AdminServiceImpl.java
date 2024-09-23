package admin.adminLoginService;

import java.util.List;
import java.util.Map;

import admin.adminLoginDao.AdminDaoImpl;
import admin.adminLoginDao.IAdminDao;
import board_it.vo.ItBoardVO;
import board_it.vo.ItVo;
import vo.MemberVO;

public class AdminServiceImpl implements IAdminService {

	
		private static AdminServiceImpl instance = null;
		
		
		
		private static IAdminDao dao = AdminDaoImpl.getInstance();
		
		private AdminServiceImpl() {
		}

		public static AdminServiceImpl getInstance() {
			if (instance == null) {
				instance = new AdminServiceImpl();
			}
			return instance;
		}

		@Override
		public int loginAdmin(Map<String, Object> map) {
			return dao.loginAdmin(map);
		}

		@Override
		public String loginAdminId(Map<String, Object> map) {
			return dao.loginAdminId(map);
		}

		@Override
		public List<MemberVO> getUserList() {
			return dao.getUserList();
		}

		@Override
		public List<MemberVO> getBlackUserList() {
			return dao.getBlackUserList();
		}
		
		@Override
		public boolean deleteUser(MemberVO memberVO) {
			return dao.deleteUser(memberVO);
		}

		@Override
		public MemberVO selectUser(int no) {
			return dao.selectUser(no);
		}

		@Override
		public List<MemberVO> searchUser(String keyword) {
			return dao.searchUser(keyword);
		}

		@Override
		public List<ItVo> getITBoardTotalList() {
			return dao.getITBoardTotalList();
		}

		@Override
		public List<ItVo> getITBoardPermit_N_List() {
			return dao.getITBoardPermit_N_List();
		}

		@Override
		public List<ItVo> getITBoardPermit_Y_List() {
			return dao.getITBoardPermit_Y_List();
		}

		@Override
		public ItVo selectIT(int no) {
			return dao.selectIT(no);
		}

		@Override
		public boolean deleteIT(ItVo itVO) {
			return dao.deleteIT(itVO);
		}

		@Override
		public boolean confirmIT(ItVo itVO) {
			return dao.confirmIT(itVO);
		}




		
	
}
