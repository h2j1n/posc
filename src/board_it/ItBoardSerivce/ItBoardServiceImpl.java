package board_it.ItBoardSerivce;

import java.util.List;

import board_it.ItBoardDao.IItBoardDao;
import board_it.ItBoardDao.ItBoardDaoImpl;
import board_it.vo.ItVo;

public class ItBoardServiceImpl implements IItBoardService {
	
	private static ItBoardServiceImpl instance = null;
	private static IItBoardDao dao = ItBoardDaoImpl.getInstance();

	private ItBoardServiceImpl() {
	}

	public static ItBoardServiceImpl getInstance() {
		if (instance == null) {
			instance = new ItBoardServiceImpl();
		}
		return instance;
	}

	@Override
	public int registerBoard(ItVo iv) {
		return dao.registerBoard(iv);
	}

	@Override
	public List<ItVo> getListBoard() {
		return dao.getListBoard();
	}

	@Override
	public ItVo detailItBoard(int parseInt) {
		return dao.detailItBoard(parseInt);
	}


	@Override
	public int updateBoard(ItVo iv) {
		// TODO Auto-generated method stub
		return dao.updateBoard(iv);	
		
}

	@Override
	public int deleteBoard(int parseInt) {
		// TODO Auto-generated method stub
		return dao.deleteBoard(parseInt);
	}
	

}
