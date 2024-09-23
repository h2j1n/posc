package ad.vo;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

public class AtchFileVO {
	
	private long atchFileId = -1;	// 첨부파일 ID
	private LocalDateTime creatDt;	// 생성일시
	private String useAt; 	// 사용 여부
	
	List<AtchFileDetailVO> atchFileDetailKist;	//상세 첨부파일 목록
	
	
	
	
	
	public List<AtchFileDetailVO> getAtchFileDetailKist() {
		return atchFileDetailKist;
	}
	public void setAtchFileDetailKist(List<AtchFileDetailVO> atchFileDetailKist) {
		this.atchFileDetailKist = atchFileDetailKist;
	}
	public long getAtchFileId() {
		return atchFileId;
	}
	public void setAtchFileId(long atchFileId) {
		this.atchFileId = atchFileId;
	}
	public LocalDateTime getCreatDt() {
		return creatDt;
	}
	public void setCreatDt(LocalDateTime creatDt) {
		this.creatDt = creatDt;
	}
	public String getUseAt() {
		return useAt;
	}
	public void setUseAt(String useAt) {
		this.useAt = useAt;
	}
	
	

}
