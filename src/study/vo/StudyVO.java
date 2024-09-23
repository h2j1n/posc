package study.vo;

public class StudyVO {
	
	private int std_no;
	private String std_name;
	private String std_strdt;
	private String std_enddt;
	private int sgbn_no;
	private String std_delyn;
	private String std_cont;
	private String user_info;
	private String std_date;
	
	

	public StudyVO(int std_no, String std_name, String std_strdt, String std_enddt, int sgbn_no, String std_cont) {
		super();
		this.std_no = std_no;
		this.std_name = std_name;
		this.std_strdt = std_strdt;
		this.std_enddt = std_enddt;
		this.sgbn_no = sgbn_no;
		this.std_cont = std_cont;
	}
	
	

	public StudyVO(int std_no, String std_name, String std_strdt, String std_enddt, int sgbn_no, String std_delyn,
			String std_cont, String std_date) {
		super();
		this.std_no = std_no;
		this.std_name = std_name;
		this.std_strdt = std_strdt;
		this.std_enddt = std_enddt;
		this.sgbn_no = sgbn_no;
		this.std_delyn = std_delyn;
		this.std_cont = std_cont;
		this.std_date = std_date;
	}



	public StudyVO() {
		super();
	}



	public int getStd_no() {
		return std_no;
	}



	public void setStd_no(int std_no) {
		this.std_no = std_no;
	}



	public String getStd_name() {
		return std_name;
	}



	public void setStd_name(String std_name) {
		this.std_name = std_name;
	}



	public String getStd_strdt() {
		return std_strdt;
	}



	public void setStd_strdt(String std_strdt) {
		this.std_strdt = std_strdt;
	}



	public String getStd_enddt() {
		return std_enddt;
	}



	public void setStd_enddt(String std_enddt) {
		this.std_enddt = std_enddt;
	}



	public int getSgbn_no() {
		return sgbn_no;
	}



	public void setSgbn_no(int sgbn_no) {
		this.sgbn_no = sgbn_no;
	}



	public String getStd_delyn() {
		return std_delyn;
	}



	public void setStd_delyn(String std_delyn) {
		this.std_delyn = std_delyn;
	}



	public String getStd_cont() {
		return std_cont;
	}



	public void setStd_cont(String std_cont) {
		this.std_cont = std_cont;
	}



	public String getUser_info() {
		return user_info;
	}



	public void setUser_info(String user_info) {
		this.user_info = user_info;
	}



	public String getStd_date() {
		return std_date;
	}



	public void setStd_date(String std_date) {
		this.std_date = std_date;
	}
	
	
}
