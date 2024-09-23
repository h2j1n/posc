package admin.adminLoginService;

import java.util.List;
import java.util.Map;

import board_it.vo.ItBoardVO;
import board_it.vo.ItVo;
import vo.MemberVO;

public interface IAdminService {

	int loginAdmin(Map<String, Object> map);

	String loginAdminId(Map<String, Object> map);

	List<MemberVO> getUserList();

	List<MemberVO> getBlackUserList();
	
	boolean deleteUser(MemberVO memberVO);
	
	MemberVO selectUser(int no);
	
	List<MemberVO> searchUser(String keyword);
	
	List<ItVo> getITBoardTotalList();

	List<ItVo> getITBoardPermit_N_List();
	
	List<ItVo> getITBoardPermit_Y_List();

	ItVo selectIT(int parseInt);

	boolean deleteIT(ItVo itVO);

	boolean confirmIT(ItVo itVO);
	
}
