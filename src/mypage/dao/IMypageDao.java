package mypage.dao;

import java.util.List;
import java.util.Map;

import board_it.vo.ItBoardVO;
import get_study_user.vo.GetStudyUserVO;
import mypage.vo.PortfolioVO;
import mypage.vo.ScheduleVO;
import mypage.vo.ToUpdateSkillVO;
import mypage.vo.UserStudyInfo;
import mypage.vo.UserStudyNoProInfo;
import mypage.vo.UserStudyProInfo;
import vo.LouFreeBoardVO;
import vo.MemberVO;

public interface IMypageDao {

	MemberVO selectMember(int user_no);

	List<String> selectSkillList(int user_no);

	List<ScheduleVO> selectScheduleList(int user_no);

	int insertSchedule(ScheduleVO scheduleVO);

	List<ScheduleVO> scheduleDetail(Map<String, String> param);

	int updateSchedule(ScheduleVO scheduleVO);

	int deleteSchedule(String scd_no);

	List<UserStudyInfo> selectUserStudyInfo(int user_no);

	int updateUser(MemberVO memberVO);

	MemberVO selectWithPw(MemberVO memberVO);

	int updateUserPw(MemberVO memberVO);

	List<PortfolioVO> selectPort(int user_no);

	int insertPort(PortfolioVO portfolioVO);

	PortfolioVO selectPortDetail(int port_no);

	int updatePort(PortfolioVO portVO);

	int removePort(PortfolioVO portVO);

	List<UserStudyProInfo> selectUserStudyPro(int user_no);

	List<ItBoardVO> selectItBoardList(int user_no);

	List<LouFreeBoardVO> selectFreeBoardList(int user_no);

	List<GetStudyUserVO> selectStudyUserList(int user_no);

	List<ToUpdateSkillVO> selectUpSkillList(int user_no);

	int deleteSkill(ToUpdateSkillVO upSkillVO);

	int insertSkill(ToUpdateSkillVO addVO);

	List<UserStudyNoProInfo> selectStudyNoProList(int user_no);

	int deleteStudyApply(int ap_no);

}
