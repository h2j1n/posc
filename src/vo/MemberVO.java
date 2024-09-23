package vo;

import java.time.LocalDate;

public class MemberVO {
	private int user_no;
	private String user_id;
	private String user_pw;
	private String user_name;
	private LocalDate user_bir;
	private String user_tel;
	private String user_zip;
	private String user_add1;
	private String user_add2;
	private double user_grade;
	private String user_fav;
	private int user_rep_cnt;
	private String user_delyn;
	private String user_email;
	private String atch_fill_id;

	public MemberVO() {
		super();
	}
	
	
	
	
	


	public MemberVO(String user_id, String user_pw, String user_name, LocalDate user_bir, String user_tel,
			String user_zip, String user_add1, String user_add2, String user_fav, String user_email) {
		super();
		this.user_id = user_id;
		this.user_pw = user_pw;
		this.user_name = user_name;
		this.user_bir = user_bir;
		this.user_tel = user_tel;
		this.user_zip = user_zip;
		this.user_add1 = user_add1;
		this.user_add2 = user_add2;
		this.user_fav = user_fav;
		this.user_email = user_email;
	}
































	public String getUser_zip() {
		return user_zip;
	}







	public void setUser_zip(String user_zip) {
		this.user_zip = user_zip;
	}




	public String getUser_add1() {
		return user_add1;
	}

	public void setUser_add1(String user_add1) {
		this.user_add1 = user_add1;
	}

	public String getUser_add2() {
		return user_add2;
	}

	public void setUser_add2(String user_add2) {
		this.user_add2 = user_add2;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_pw() {
		return user_pw;
	}

	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public LocalDate getUser_bir() {
		return user_bir;
	}

	public void setUser_bir(LocalDate user_bir) {
		this.user_bir = user_bir;
	}


	public String getUser_tel() {
		return user_tel;
	}

	public void setUser_tel(String user_tel) {
		this.user_tel = user_tel;
	}

	public double getUser_grade() {
		return user_grade;
	}

	public void setUser_grade(double user_grade) {
		this.user_grade = user_grade;
	}

	public String getUser_fav() {
		return user_fav;
	}

	public void setUser_fav(String user_fav) {
		this.user_fav = user_fav;
	}

	public int getUser_rep_cnt() {
		return user_rep_cnt;
	}

	public void setUser_rep_cnt(int user_rep_cnt) {
		this.user_rep_cnt = user_rep_cnt;
	}

	public String getUser_delyn() {
		return user_delyn;
	}

	public void setUser_delyn(String user_delyn) {
		this.user_delyn = user_delyn;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getAtch_fill_id() {
		return atch_fill_id;
	}

	public void setAtch_fill_id(String atch_fill_id) {
		this.atch_fill_id = atch_fill_id;
	}

}
