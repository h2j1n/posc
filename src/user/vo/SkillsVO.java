package user.vo;

import java.util.List;

import get_study_user.vo.SkillVO;
import vo.MemberVO;

public class SkillsVO {
	
	private int stcd_no;
	
	private int user_no;

	private List<String> skillList ;

	
	
	
	
	
	public SkillsVO() {
		super();
	}






	public SkillsVO(int user_no, List<String> skillList) {
		super();
		this.user_no = user_no;
		this.skillList = skillList;
	}






	public int getUser_no() {
		return user_no;
	}






	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}






	public List<String> getSkillList() {
		return skillList;
	}






	public void setSkillList(List<String> skillList) {
		this.skillList = skillList;
	}

	
	
	
	
	


	
	
	
}
