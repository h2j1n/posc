package study.vo;

public class PlanStudyVO {
	private int std_no;
	private String std_name;
	private String std_strdt;
	private String std_enddt;
	private String std_delyn;
	private int user_no;
	private int sgbn_no;
	private String std_cont;
	private String std_date;
	
	
	
	public PlanStudyVO(int std_no, int user_no) {
		super();
		this.std_no = std_no;
		this.user_no = user_no;
	}
	public PlanStudyVO(String std_name, String std_strdt, String std_enddt, int user_no, int sgbn_no, String std_cont) {
		super();
		this.std_name = std_name;
		this.std_strdt = std_strdt;
		this.std_enddt = std_enddt;
		this.user_no = user_no;
		this.sgbn_no = sgbn_no;
		this.std_cont = std_cont;
	}
	public PlanStudyVO(int std_no, String std_name, String std_strdt, String std_enddt, String std_delyn, int user_no,
			int sgbn_no, String std_cont, String std_date) {
		super();
		this.std_no = std_no;
		this.std_name = std_name;
		this.std_strdt = std_strdt;
		this.std_enddt = std_enddt;
		this.std_delyn = std_delyn;
		this.user_no = user_no;
		this.sgbn_no = sgbn_no;
		this.std_cont = std_cont;
		this.std_date = std_date;
	}
	public PlanStudyVO() {
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
	public String getStd_delyn() {
		return std_delyn;
	}
	public void setStd_delyn(String std_delyn) {
		this.std_delyn = std_delyn;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public int getSgbn_no() {
		return sgbn_no;
	}
	public void setSgbn_no(int sgbn_no) {
		this.sgbn_no = sgbn_no;
	}
	public String getStd_cont() {
		return std_cont;
	}
	public void setStd_cont(String std_cont) {
		this.std_cont = std_cont;
	}
	public String getStd_date() {
		return std_date;
	}
	public void setStd_date(String std_date) {
		this.std_date = std_date;
	}
	
	
	
}
