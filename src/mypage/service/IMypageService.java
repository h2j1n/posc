package mypage.service;

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

public interface IMypageService {

	/**
	 * 유저 정보를 가져오는 함수
	 * @param user_no
	 * @return
	 */
	MemberVO getMemberInfo(int user_no);

	/**
	 * 유저의 기술스택을 가져오는 함수
	 * @param user_no
	 * @return
	 */
	List<String> skillList(int user_no);

	/**
	 * 유저의 일정 정보를 가져오는 함수
	 * @param user_no
	 * @return
	 */
	List<ScheduleVO> scheduleList(int user_no);

	/**
	 * 유저의 일정을 등록하는 함수
	 * @param scheduleVO
	 * @return
	 */
	int registerSchedule(ScheduleVO scheduleVO);

	/**
	 * 상세일정 정보를 가져오는 함수
	 * @param param
	 * @return
	 */
	List<ScheduleVO> scheduleDetail(Map<String, String> param);

	/**
	 * 상세일정을 수정하는 함수
	 * @param scheduleVO
	 * @return
	 */
	int modifySchedule(ScheduleVO scheduleVO);

	/**
	 * 일정을 삭제하는 함수
	 * @param scd_no
	 * @return
	 */
	int removeSchedule(String scd_no);

	/**
	 * 유저의 스터디정보를 가져온다.
	 * @param user_no
	 * @return
	 */
	List<UserStudyInfo> userStudyInfoList(int user_no);

	/**
	 * 유저 정보를 수정한다.
	 * @param memberVO
	 * @return
	 */
	int modifyUser(MemberVO memberVO);

	/**
	 * 비밀번호 확인
	 * @param memberVO
	 * @return
	 */
	int pwChk(MemberVO memberVO);

	/**
	 * 비밀번호 수정
	 * @param memberVO
	 * @return
	 */
	int modifyUserPw(MemberVO memberVO);

	/**
	 * 유저의 포트폴리오 조회
	 * @param user_no
	 * @return
	 */
	List<PortfolioVO> getPortfolio(int user_no);

	/**
	 * 포트폴리오 등록
	 * @param portfolioVO
	 * @return
	 */
	int registerPort(PortfolioVO portfolioVO);

	/**
	 * 포트폴리오 상세
	 * @param port_no
	 * @return
	 */
	PortfolioVO getPortDetail(int port_no);

	/**
	 * 포트폴리오 수정
	 * @param portVO
	 * @return
	 */
	int modifyPort(PortfolioVO portVO);

	/**
	 * 포트폴리오 삭제
	 * @param portVO
	 * @return
	 */
	int removePort(PortfolioVO portVO);

	/**
	 * 사용자가 신청한 스터디 조회
	 * @param user_no
	 * @return
	 */
	List<UserStudyProInfo> userStudyProList(int user_no);

	/**
	 * 아이티 행사 게시판에서 작성한 글 조회
	 * @param user_no
	 * @return
	 */
	List<ItBoardVO> getItBoardList(int user_no);

	/**
	 * 자유게시판에서 작성한 글 조회
	 * @param user_no
	 * @return
	 */
	List<LouFreeBoardVO> getFreeBoardList(int user_no);

	/**
	 * 스터디 모집에서 작성한 글 조회
	 * @param user_no
	 * @return
	 */
	List<GetStudyUserVO> getStudyUserList(int user_no);

	/**
	 * 업데이트를 하기위해서, 유저의 스킬정보를 VO로 조회
	 * @param user_no
	 * @return
	 */
	List<ToUpdateSkillVO> getUpSkillLis(int user_no);

	/**
	 * 유저가 지운 기술을 스택에서 삭제한다.
	 * @param upSkillVO
	 * @return
	 */
	int removeSkill(ToUpdateSkillVO upSkillVO);

	/**
	 * 유저가 새로 추가한 기술을 스택에 추가한다.
	 * @param addVO
	 * @return
	 */
	int registerSkill(ToUpdateSkillVO addVO);

	/**
	 * 신청했으나 아직 처리되지 않은 스터디 정보를 가져온다.
	 * @param user_no
	 * @return
	 */
	List<UserStudyNoProInfo> userStudyNoProList(int user_no);

	/**
	 * 스터디 신청 취소
	 * @param ap_no
	 * @return
	 */
	int cancelStudy(int ap_no);
}
