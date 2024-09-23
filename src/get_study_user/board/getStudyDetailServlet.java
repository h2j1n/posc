package get_study_user.board;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import get_study_user.service.ApplyStudyListServiceImpl;
import get_study_user.service.GetStudyListServiceImpl;
import get_study_user.service.IApplyStudyListService;
import get_study_user.service.IGetStudyListService;
import get_study_user.vo.ApplyVO;
import get_study_user.vo.GetStudyListVO;
import get_study_user.vo.GetStudyUserVO;
import get_study_user.vo.ProcessVO;
import get_study_user.vo.StudyMemberVO;

@WebServlet("/getStudyDetail.do")
public class getStudyDetailServlet extends HttpServlet {

	private IGetStudyListService service = GetStudyListServiceImpl.getInstance();
	private IApplyStudyListService aplService = ApplyStudyListServiceImpl.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//세션 아이디 가져옴
		HttpSession session = req.getSession();
		Integer userId = (Integer) session.getAttribute("userNo");
		
		
		//모집글 번호 가져옴
		String gsuNo = req.getParameter("gsu_no");
		service.addHit(Integer.parseInt(gsuNo));
		
	
		GetStudyUserVO gsuVO = service.selectDetailBoard(Integer.parseInt(gsuNo));
		List<StudyMemberVO> stdMemVO = service.selectStudyMemList(Integer.parseInt(gsuNo));
		
		System.out.println("gsuNO : "+gsuNo);
		System.out.println("gsuNO : "+stdMemVO);
		

		req.setAttribute("stdMemVO", stdMemVO);
		req.setAttribute("gsuVO", gsuVO);	
		req.getRequestDispatcher("jsp/study/getStudyDetail.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		Integer userId = (Integer) session.getAttribute("userNo");
		
		String std_name = req.getParameter("stdname");
        String gsuNo = req.getParameter("gsuNo");

    
        ApplyVO aplVO = new ApplyVO();
        
        String std_no = service.studyList(std_name);
        
        aplVO.setGsu_no(Integer.parseInt(gsuNo));
        aplVO.setUser_no(userId);
        aplVO.setStd_no(Integer.parseInt(std_no));
        
        int status = service.applyMember(aplVO);
        
        if(status>0) { //성공
        	System.out.println("성공");
        	
		}else {	//실패
			System.out.println("실패");
		}
	
	}
}
