package ad.service;

import java.util.List;

import ad.dao.AdDaoImpl;
import ad.dao.IAdDao;
import ad.vo.AdVO;

public class AdServiceImpl implements IAdService{
	
	private static AdServiceImpl instance = null;
	private AdServiceImpl() {}
	
	public static IAdService getInstance() {
		if(instance == null) {
			instance = new AdServiceImpl();
		}
		return instance;
		}
		
	private IAdDao dao = AdDaoImpl.getInstance();
	
	
	
	
	@Override
	public List<AdVO> confirmList() {
		return dao.confirmList();
	}
	
	@Override
	public List<AdVO> adList() {
		return dao.adList();
	}
	
	
	@Override
	public AdVO selectad(int no) {
		return dao.selectad(no);
	}

	@Override
	public boolean deleteAd(AdVO adList) {
		return dao.deleteAd(adList);
	}

	@Override
	public boolean confirmAd(AdVO adList) {
		return dao.confirmAd(adList);
	}

	@Override
	public int insertAd(AdVO adList) {
		return dao.insertAd(adList);
	}
	
	@Override
	public int insertAd_admin(AdVO adList) {
		return dao.insertAd_admin(adList);
	}

	@Override
	public List<AdVO> getConfirmedAds() {
		return dao.getConfirmedAds();
	}

}
