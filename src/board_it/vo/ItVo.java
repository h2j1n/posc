package board_it.vo;

public class ItVo {

	private int it_no;
	private String it_title;
	private String it_sdate;
	private int it_hit;
	private String it_delyn;
	private int user_no;
	private int atch_file_id;
	private String it_gu;
	private String it_type;
	private String it_link;
	private String it_enddate;
	private String it_organ;
	private String it_place;
	private String it_permit;
	private String it_edate;
	private String it_content;
	private String it_mainimg;
	private String it_wrdate;

	public ItVo() {
		super();
	}
		//작성
	
	
	public ItVo(String it_title, String it_content, String it_sdate, String it_edate, String it_gu, String it_type,
			String it_link, String it_enddate, String it_organ, String it_place, String it_mainimg) {
		super();
		this.it_title = it_title;
		this.it_content = it_content;
		this.it_sdate = it_sdate;
		this.it_edate = it_edate;
		this.it_gu = it_gu;
		this.it_type = it_type;
		this.it_link = it_link;
		this.it_enddate = it_enddate;
		this.it_organ = it_organ;
		this.it_place = it_place;
		this.it_mainimg = it_mainimg;
	}
	
	
	
		//수정
	public ItVo(int it_no, String it_title, String it_content, String it_sdate, String it_edate, String it_gu,
			String it_type, String it_link, String it_enddate, String it_organ, String it_place, String it_mainimg) {
		super();
		this.it_no = it_no;
		this.it_title = it_title;
		this.it_content = it_content;
		this.it_sdate = it_sdate;
		this.it_edate = it_edate;
		this.it_gu = it_gu;
		this.it_type = it_type;
		this.it_link = it_link;
		this.it_enddate = it_enddate;
		this.it_organ = it_organ;
		this.it_place = it_place;
		this.it_mainimg = it_mainimg;
	}

	public String getIt_wrdate() {
		return it_wrdate;
	}

	public void setIt_wrdate(String it_wrdate) {
		this.it_wrdate = it_wrdate;
	}

	public int getIt_no() {
		return it_no;
	}

	public void setIt_no(int it_no) {
		this.it_no = it_no;
	}

	public String getIt_title() {
		return it_title;
	}

	public void setIt_title(String it_title) {
		this.it_title = it_title;
	}

	public String getIt_content() {
		return it_content;
	}

	public void setIt_content(String it_content) {
		this.it_content = it_content;
	}

	public String getIt_sdate() {
		return it_sdate;
	}

	public void setIt_sdate(String it_sdate) {
		this.it_sdate = it_sdate;
	}

	public String getIt_edate() {
		return it_edate;
	}

	public void setIt_edate(String it_edate) {
		this.it_edate = it_edate;
	}

	public int getIt_hit() {
		return it_hit;
	}

	public void setIt_hit(int it_hit) {
		this.it_hit = it_hit;
	}

	public String getIt_delyn() {
		return it_delyn;
	}

	public void setIt_delyn(String it_delyn) {
		this.it_delyn = it_delyn;
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

	public String getIt_gu() {
		return it_gu;
	}

	public void setIt_gu(String it_gu) {
		this.it_gu = it_gu;
	}

	public String getIt_type() {
		return it_type;
	}

	public void setIt_type(String it_type) {
		this.it_type = it_type;
	}

	public String getIt_link() {
		return it_link;
	}

	public void setIt_link(String it_link) {
		this.it_link = it_link;
	}

	public String getIt_enddate() {
		return it_enddate;
	}

	public void setIt_enddate(String it_enddate) {
		this.it_enddate = it_enddate;
	}

	public String getIt_organ() {
		return it_organ;
	}

	public void setIt_organ(String it_organ) {
		this.it_organ = it_organ;
	}

	public String getIt_place() {
		return it_place;
	}

	public void setIt_place(String it_place) {
		this.it_place = it_place;
	}

	public String getIt_mainimg() {
		return it_mainimg;
	}

	public void setIt_mainimg(String it_mainimg) {
		this.it_mainimg = it_mainimg;
	}

	public String getIt_permit() {
		return it_permit;
	}

	public void setIt_permit(String it_permit) {
		this.it_permit = it_permit;
	}

}
