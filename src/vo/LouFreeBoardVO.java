package vo;

import java.time.LocalDate;

public class LouFreeBoardVO {
	private int free_no;
	private String free_title;
	private String free_content;
	private LocalDate free_date;
	private int free_hit;
	private String free_delyn;
	private int user_no;
	private int atch_file_id;
	private String user_id; 
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public LouFreeBoardVO(int free_no, String free_title, String free_content, int user_no) {
		super();
		this.free_no = free_no;
		this.free_title = free_title;
		this.free_content = free_content;
		this.user_no = user_no;
	}


	public LouFreeBoardVO(int free_no) {
		super();
		this.free_no = free_no;
	}


	public LouFreeBoardVO(String free_title, String free_content, int user_no) {
		super();
		this.free_title = free_title;
		this.free_content = free_content;
		this.user_no = user_no;
	}


	public LouFreeBoardVO() {
		super();
	}
	
	
	public LouFreeBoardVO(int free_no, String free_title, String free_content, LocalDate free_date, int free_hit,
			String free_delyn, int user_no, int atch_file_id) {
		super();
		this.free_no = free_no;
		this.free_title = free_title;
		this.free_content = free_content;
		this.free_date = free_date;
		this.free_hit = free_hit;
		this.free_delyn = free_delyn;
		this.user_no = user_no;
		this.atch_file_id = atch_file_id;
	}
	
	
	
	
	
	
	
	public LouFreeBoardVO(int free_no, String free_title, String free_content, LocalDate free_date, int free_hit,
			String free_delyn, int user_no, int atch_file_id, String user_id) {
		super();
		this.free_no = free_no;
		this.free_title = free_title;
		this.free_content = free_content;
		this.free_date = free_date;
		this.free_hit = free_hit;
		this.free_delyn = free_delyn;
		this.user_no = user_no;
		this.atch_file_id = atch_file_id;
		this.user_id = user_id;
	}

	
	

	public String getUser_id() {
		return user_id;
	}


	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}


	public int getFree_no() {
		return free_no;
	}
	public void setFree_no(int free_no) {
		this.free_no = free_no;
	}
	public String getFree_title() {
		return free_title;
	}
	public void setFree_title(String free_title) {
		this.free_title = free_title;
	}
	public String getFree_content() {
		return free_content;
	}
	public void setFree_content(String free_content) {
		this.free_content = free_content;
	}
	public LocalDate getFree_date() {
		return free_date;
	}
	public void setFree_date(LocalDate free_date) {
		this.free_date = free_date;
	}
	public int getFree_hit() {
		return free_hit;
	}
	public void setFree_hit(int free_hit) {
		this.free_hit = free_hit;
	}
	public String getFree_delyn() {
		return free_delyn;
	}
	public void setFree_delyn(String free_delyn) {
		this.free_delyn = free_delyn;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public int getAtch_file_id() {
		return atch_file_id;
	}
	public void setAtch_file_id(int atch_file_id) {
		this.atch_file_id = atch_file_id;
	}
	
	
	
	
	
	
	
	

	
	
	
	
	
	
}
