package chatting.vo;

import java.time.LocalDate;

public class ChattingVO {
	
	private int chat_no;
	private LocalDate chat_credate;
	
	public ChattingVO() {
		super();
	}

	public ChattingVO(int chat_no, LocalDate chat_credate) {
		super();
		this.chat_no = chat_no;
		this.chat_credate = chat_credate;
	}
	
	public int getChat_no() {
		return chat_no;
	}
	public void setChat_no(int chat_no) {
		this.chat_no = chat_no;
	}
	public LocalDate getChat_credate() {
		return chat_credate;
	}
	public void setChat_credate(LocalDate chat_credate) {
		this.chat_credate = chat_credate;
	}
	
	
	
}
