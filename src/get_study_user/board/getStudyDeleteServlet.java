package get_study_user.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import get_study_user.service.GetStudyListServiceImpl;
import get_study_user.service.IGetStudyListService;


@WebServlet("/getStudyDelete.do")
public class getStudyDeleteServlet extends HttpServlet {

	private IGetStudyListService service = GetStudyListServiceImpl.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String no = req.getParameter("gsu_no");
		int status = service.deleteGetStudy(Integer.parseInt(no));
		if(status>0) {	//삭제 성공 -> 데이터를 가용했으니까
			resp.sendRedirect("/getStudy.do");
		}else {//삭제 싫패
			resp.sendRedirect("/getStudydetail.do?gsu_no="+no);
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
	}

	
}
