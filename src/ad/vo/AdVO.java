package ad.vo;

import java.time.LocalDate;

public class AdVO {
	private int ad_no;
	private String ad_title;
	private String ad_content;
	private LocalDate ad_date;
	private String ad_delyn;
	private String ad_file;
	private String ad_confirm;
	private String ad_user;
	
	private byte[] ad_File_Byte;

    public byte[] getAd_File_Byte() {
        return ad_File_Byte;
    }

    public void setAd_File_Byte(byte[] ad_File_Byte) {
        this.ad_File_Byte = ad_File_Byte;
    }
	
	
	public int getAd_no() {
		return ad_no;
	}
	public void setAd_no(int ad_no) {
		this.ad_no = ad_no;
	}
	public String getAd_title() {
		return ad_title;
	}
	public void setAd_title(String ad_title) {
		this.ad_title = ad_title;
	}
	public String getAd_content() {
		return ad_content;
	}
	public void setAd_content(String ad_content) {
		this.ad_content = ad_content;
	}
	public LocalDate getAd_date() {
		return ad_date;
	}
	public void setAd_date(LocalDate ad_date) {
		this.ad_date = ad_date;
	}
	public String getAd_delyn() {
		return ad_delyn;
	}
	public void setAd_delyn(String ad_delyn) {
		this.ad_delyn = ad_delyn;
	}
	
	public String getAd_file() {
		return ad_file;
	}
	public void setAd_file(String ad_file) {
		this.ad_file = ad_file;
	}
	public String getAd_confirm() {
		return ad_confirm;
	}
	public void setAd_confirm(String ad_confirm) {
		this.ad_confirm = ad_confirm;
	}
	public String getAd_user() {
		return ad_user;
	}
	public void setAd_user(String ad_user) {
		this.ad_user = ad_user;
	}
	
	
	

}
