package board_post.vo;

import java.time.LocalDate;

public class PostBoardVO {
	private int post_no;
	private String post_title;
	private String post_content;
	private LocalDate post_date;
	private int post_hit;
	private String post_delyn;
	private int adm_no;
	private int atch_file_id;
	
	
	public int getPost_no() {
		return post_no;
	}
	public void setPost_no(int post_no) {
		this.post_no = post_no;
	}
	public String getPost_title() {
		return post_title;
	}
	public void setPost_title(String post_title) {
		this.post_title = post_title;
	}
	public String getPost_content() {
		return post_content;
	}
	public void setPost_content(String post_content) {
		this.post_content = post_content;
	}
	public LocalDate getPost_date() {
		return post_date;
	}
	public void setPost_date(LocalDate post_date) {
		this.post_date = post_date;
	}
	public int getPost_hit() {
		return post_hit;
	}
	public void setPost_hit(int post_hit) {
		this.post_hit = post_hit;
	}
	public String getPost_delyn() {
		return post_delyn;
	}
	public void setPost_delyn(String post_delyn) {
		this.post_delyn = post_delyn;
	}
	public int getAdm_no() {
		return adm_no;
	}
	public void setAdm_no(int adm_no) {
		this.adm_no = adm_no;
	}
	public int getAtch_file_id() {
		return atch_file_id;
	}
	public void setAtch_file_id(int atch_file_id) {
		this.atch_file_id = atch_file_id;
	}

	
}
