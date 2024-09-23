package chatting.vo;

import java.time.LocalDate;

public class ChattingDetailVO {

	private int chat_d_no;
	private String chat_gubun;
	private String chat_cont;
	private LocalDate chat_date;
	private int user_no;
	private int chat_no;
	
	
	
	
	public ChattingDetailVO() {
		super();
	}
	public ChattingDetailVO(int chat_d_no, String chat_gubun, String chat_cont, LocalDate chat_date, int user_no,
			int chat_no) {
		super();
		this.chat_d_no = chat_d_no;
		this.chat_gubun = chat_gubun;
		this.chat_cont = chat_cont;
		this.chat_date = chat_date;
		this.user_no = user_no;
		this.chat_no = chat_no;
	}
	public int getChat_d_no() {
		return chat_d_no;
	}
	public void setChat_d_no(int chat_d_no) {
		this.chat_d_no = chat_d_no;
	}
	public String getChat_gubun() {
		return chat_gubun;
	}
	public void setChat_gubun(String chat_gubun) {
		this.chat_gubun = chat_gubun;
	}
	public String getChat_cont() {
		return chat_cont;
	}
	public void setChat_cont(String chat_cont) {
		this.chat_cont = chat_cont;
	}
	public LocalDate getChat_date() {
		return chat_date;
	}
	public void setChat_date(LocalDate chat_date) {
		this.chat_date = chat_date;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public int getChat_no() {
		return chat_no;
	}
	public void setChat_no(int chat_no) {
		this.chat_no = chat_no;
	}

	
	
	
}
