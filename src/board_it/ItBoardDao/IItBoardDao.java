package board_it.ItBoardDao;

import java.util.List;

import board_it.vo.ItVo;

public interface IItBoardDao {

	int registerBoard(ItVo iv);

	List<ItVo> getListBoard();

	ItVo detailItBoard(int parseInt);

	int updateBoard(ItVo iv);

	int deleteBoard(int parseInt);

}
