package get_study_user.vo;

/**
 * 모집글 table 속성
 * 
 * @author Administrator
 *
 */
public class GetStudyUserVO {

	private int gsu_no;
	private String gsu_title;
	private String gsu_content;
	private String gsu_start;
	private int gsu_hit;
	private String gsu_delyn;
	private int user_no;
	/* private int atch_file_id; */
	private int gsu_gubun;
	private String gsu_end;
	private String gsu_skills;
	private int gsu_memcnt;
	private String gsu_period;
	private String Gsu_stdname;

	private String user_id;
	private String user_no1;

	

	
	
	
	
	public String getGsu_user_id() {
		return user_id;
	}

	public void setGsu_user_id(String user_id) {
		user_id = user_id;
	}

	public String getGsu_stdname() {
		return Gsu_stdname;
	}

	public void setGsu_stdname(String gsu_stdname) {
		Gsu_stdname = gsu_stdname;
	}

	public int getGsu_no() {
		return gsu_no;
	}

	public void setGsu_no(int gsu_no) {
		this.gsu_no = gsu_no;
	}

	public String getGsu_title() {
		return gsu_title;
	}

	public void setGsu_title(String gsu_title) {
		this.gsu_title = gsu_title;
	}

	public String getGsu_content() {
		return gsu_content;
	}

	public void setGsu_content(String gsu_content) {
		this.gsu_content = gsu_content;
	}

	public String getGsu_start() {
		return gsu_start;
	}

	public void setGsu_start(String gsu_start) {
		this.gsu_start = gsu_start;
	}

	public int getGsu_hit() {
		return gsu_hit;
	}

	public void setGsu_hit(int gsu_hit) {
		this.gsu_hit = gsu_hit;
	}

	public String getGsu_delyn() {
		return gsu_delyn;
	}

	public void setGsu_delyn(String gsu_delyn) {
		this.gsu_delyn = gsu_delyn;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	/*
	 * public int getAtch_file_id() { return atch_file_id; }
	 * 
	 * public void setAtch_file_id(int atch_file_id) { this.atch_file_id =
	 * atch_file_id; }
	 */

	public int getGsu_gubun() {
		return gsu_gubun;
	}

	public void setGsu_gubun(int gsu_gubun) {
		this.gsu_gubun = gsu_gubun;
	}

	public String getGsu_end() {
		return gsu_end;
	}

	public void setGsu_end(String gsu_end) {
		this.gsu_end = gsu_end;
	}

	public String getGsu_skills() {
		return gsu_skills;
	}

	public void setGsu_skills(String gsu_skills) {
		this.gsu_skills = gsu_skills;
	}

	public int getGsu_memcnt() {
		return gsu_memcnt;
	}

	public void setGsu_memcnt(int gsu_memcnt) {
		this.gsu_memcnt = gsu_memcnt;
	}

	public String getGsu_period() {
		return gsu_period;
	}

	public void setGsu_period(String gsu_period) {
		this.gsu_period = gsu_period;
	}
}
