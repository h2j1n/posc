package mypage.vo;

public class ScheduleVO {
	
	private int scd_no;
	private String scd_start;
	private String scd_end;
	private String scd_title;
	private String scd_cont;
	private int user_no;
	
	
	public String getScd_cont() {
		return scd_cont;
	}
	public void setScd_cont(String scd_cont) {
		this.scd_cont = scd_cont;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public int getScd_no() {
		return scd_no;
	}
	public void setScd_no(int scd_no) {
		this.scd_no = scd_no;
	}
	public String getScd_start() {
		return scd_start;
	}
	public void setScd_start(String scd_start) {
		this.scd_start = scd_start;
	}
	public String getScd_end() {
		return scd_end;
	}
	public void setScd_end(String scd_end) {
		this.scd_end = scd_end;
	}
	public String getScd_title() {
		return scd_title;
	}
	public void setScd_title(String scd_title) {
		this.scd_title = scd_title;
	}
	public String getScd_count() {
		return scd_cont;
	}
	public void setScd_count(String scd_count) {
		this.scd_cont = scd_count;
	}
}
