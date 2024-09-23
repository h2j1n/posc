package mypage.service;

import java.util.List;
import java.util.Map;

import com.itextpdf.text.pdf.PdfStructTreeController.returnType;

import board_it.vo.ItBoardVO;
import get_study_user.vo.GetStudyUserVO;
import mypage.dao.IMypageDao;
import mypage.dao.MypageDaoImpl;
import mypage.vo.PortfolioVO;
import mypage.vo.ScheduleVO;
import mypage.vo.ToUpdateSkillVO;
import mypage.vo.UserStudyInfo;
import mypage.vo.UserStudyNoProInfo;
import mypage.vo.UserStudyProInfo;
import vo.LouFreeBoardVO;
import vo.MemberVO;

public class MypageServiceImpl implements IMypageService {

	private static IMypageService instance = null;
	private IMypageDao mypageDao;
	
	private MypageServiceImpl() {
		mypageDao = MypageDaoImpl.getInstance();
	}
	
	public static IMypageService getInstance() {
		if(instance == null) {
			instance = new MypageServiceImpl();
		}
		
		return instance;
	}

	@Override
	public MemberVO getMemberInfo(int user_no) {
		return mypageDao.selectMember(user_no);
	}

	@Override
	public List<String> skillList(int user_no) {
		return mypageDao.selectSkillList(user_no);
	}

	@Override
	public List<ScheduleVO> scheduleList(int user_no) {
		return mypageDao.selectScheduleList(user_no);
	}

	@Override
	public int registerSchedule(ScheduleVO scheduleVO) {
		return mypageDao.insertSchedule(scheduleVO);
	}

	@Override
	public List<ScheduleVO> scheduleDetail(Map<String, String> param) {
		return mypageDao.scheduleDetail(param);
	}

	@Override
	public int modifySchedule(ScheduleVO scheduleVO) {
		return mypageDao.updateSchedule(scheduleVO);
	}

	@Override
	public int removeSchedule(String scd_no) {
		return mypageDao.deleteSchedule(scd_no);
	}

	@Override
	public List<UserStudyInfo> userStudyInfoList(int user_no) {
		return mypageDao.selectUserStudyInfo(user_no);
	}

	@Override
	public int modifyUser(MemberVO memberVO) {
		return mypageDao.updateUser(memberVO);
	}

	@Override
	public int pwChk(MemberVO memberVO) {
		int chkStatus = 0;
		
		// 회원번호와 비밀번호로 회원정보를 확인한다.
		MemberVO result = mypageDao.selectWithPw(memberVO);
		
		// 유저정보가 있다면 상태를 변경한다.
		if(result != null) {
			chkStatus = 1;
		}
		
		return chkStatus;
	}

	@Override
	public int modifyUserPw(MemberVO memberVO) {
		return mypageDao.updateUserPw(memberVO);
	}

	@Override
	public List<PortfolioVO> getPortfolio(int user_no) {
		return mypageDao.selectPort(user_no);
	}

	@Override
	public int registerPort(PortfolioVO portfolioVO) {
		return mypageDao.insertPort(portfolioVO);
	}

	@Override
	public PortfolioVO getPortDetail(int port_no) {
		return mypageDao.selectPortDetail(port_no);
	}

	@Override
	public int modifyPort(PortfolioVO portVO) {
		return mypageDao.updatePort(portVO);
	}

	@Override
	public int removePort(PortfolioVO portVO) {
		return mypageDao.removePort(portVO);
	}

	@Override
	public List<UserStudyProInfo> userStudyProList(int user_no) {
		return mypageDao.selectUserStudyPro(user_no);
	}

	@Override
	public List<ItBoardVO> getItBoardList(int user_no) {
		return mypageDao.selectItBoardList(user_no);
	}

	@Override
	public List<LouFreeBoardVO> getFreeBoardList(int user_no) {
		return mypageDao.selectFreeBoardList(user_no);
	}

	@Override
	public List<GetStudyUserVO> getStudyUserList(int user_no) {
		return mypageDao.selectStudyUserList(user_no);
	}

	@Override
	public List<ToUpdateSkillVO> getUpSkillLis(int user_no) {
		return mypageDao.selectUpSkillList(user_no);
	}

	@Override
	public int removeSkill(ToUpdateSkillVO upSkillVO) {
		return mypageDao.deleteSkill(upSkillVO);
	}

	@Override
	public int registerSkill(ToUpdateSkillVO addVO) {
		return mypageDao.insertSkill(addVO);
	}

	@Override
	public List<UserStudyNoProInfo> userStudyNoProList(int user_no) {
		return mypageDao.selectStudyNoProList(user_no);
	}

	@Override
	public int cancelStudy(int ap_no) {
		return mypageDao.deleteStudyApply(ap_no);
	}
}
