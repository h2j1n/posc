package ad.service;

import java.util.List;

import ad.vo.AdVO;

public interface IAdService {

	List<AdVO> confirmList();

	List<AdVO> adList();

	AdVO selectad(int no);

	boolean deleteAd(AdVO adList);
	
	boolean confirmAd(AdVO adList);

	int insertAd(AdVO adList);
	
	int insertAd_admin(AdVO adList);

	List<AdVO> getConfirmedAds();


}
