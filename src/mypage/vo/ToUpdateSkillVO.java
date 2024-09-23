package mypage.vo;

public class ToUpdateSkillVO {
	private int stcd_no;
	private int user_no;
	private String sgdt_name;
	
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public int getStcd_no() {
		return stcd_no;
	}
	public void setStcd_no(int stcd_no) {
		this.stcd_no = stcd_no;
	}
	public String getSgdt_name() {
		return sgdt_name;
	}
	public void setSgdt_name(String sgdt_name) {
		this.sgdt_name = sgdt_name;
	}
}
