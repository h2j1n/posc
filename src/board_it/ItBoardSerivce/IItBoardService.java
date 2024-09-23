package board_it.ItBoardSerivce;

import java.util.List;

import board_it.vo.ItVo;

public interface IItBoardService {

	int registerBoard(ItVo iv);

	List<ItVo> getListBoard();

	ItVo detailItBoard(int parseInt);

	int updateBoard(ItVo iv);

	int deleteBoard(int parseInt);

}
