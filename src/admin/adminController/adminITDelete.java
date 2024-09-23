package admin.adminController;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ad.vo.AdVO;
import admin.adminLoginService.AdminServiceImpl;
import admin.adminLoginService.IAdminService;
import board_it.vo.ItBoardVO;
import board_it.vo.ItVo;

@WebServlet("/adminITDelete.do")
public class adminITDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private IAdminService service = AdminServiceImpl.getInstance();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String[] no = request.getParameterValues("no");
        
        // 선택된 각 광고 번호를 for문으로 삭제
        for (String target : no) {
            // 광고 번호에 해당하는 광고를 select
            ItVo itVO = service.selectIT(Integer.parseInt(target));
            itVO.setIt_delyn("Y");
            service.deleteIT(itVO);
        }

        // 광고 목록 페이지
        response.sendRedirect("/adminManageIT.do");
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
