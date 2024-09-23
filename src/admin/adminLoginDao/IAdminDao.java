package admin.adminLoginDao;

import java.util.List;
import java.util.Map;

import board_it.vo.ItBoardVO;
import board_it.vo.ItVo;
import vo.MemberVO;

public interface IAdminDao {

	int loginAdmin(Map<String, Object> map);

	String loginAdminId(Map<String, Object> map);

	List<MemberVO> getUserList();

	boolean deleteUser(MemberVO memberVO);

	MemberVO selectUser(int no);

	List<MemberVO> getBlackUserList();
	
	List<MemberVO> searchUser(String keyword);

	List<ItVo> getITBoardTotalList();

	List<ItVo> getITBoardPermit_N_List();
	
	List<ItVo> getITBoardPermit_Y_List();

	ItVo selectIT(int no);

	boolean deleteIT(ItVo itVO);

	boolean confirmIT(ItVo itVO);


}
