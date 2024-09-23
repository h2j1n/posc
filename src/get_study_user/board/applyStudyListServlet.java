package get_study_user.board;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import get_study_user.service.ApplyStudyListServiceImpl;
import get_study_user.service.GetStudyListServiceImpl;
import get_study_user.service.IApplyStudyListService;
import get_study_user.service.IGetStudyListService;
import get_study_user.service.IProcessService;
import get_study_user.service.ProcessServiceImpl;
import get_study_user.vo.ApplyVO;
import get_study_user.vo.GetStudyUserVO;
import get_study_user.vo.ProcessVO;
import get_study_user.vo.StudyMemberVO;

@WebServlet("/applyStudyList.do")
public class applyStudyListServlet extends HttpServlet{

	private IApplyStudyListService aplService = ApplyStudyListServiceImpl.getInstance();
	private IGetStudyListService gsuService = GetStudyListServiceImpl.getInstance();
	private IProcessService proService = ProcessServiceImpl.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String gsu_no = req.getParameter("gsu_no"); 
		
		GetStudyUserVO gsuVO = gsuService.selectDetailBoard(Integer.parseInt(gsu_no));
		System.out.println("gsuVO출력");
		System.out.println(gsuVO.getGsu_stdname());
		
		
		String std_no = gsuService.studyList(gsuVO.getGsu_stdname());	//std_no 가져옴 
		System.out.println("applyStudyList에서 std_no가져왔는데ㅣ.."+std_no);
		
		List<ApplyVO> aplVO = aplService.getApply(Integer.parseInt(std_no));
		
		for(int i= 0 ; i<aplVO.size(); i++) {
			System.out.println(aplVO.get(i).getUser_name());
			
		}
		System.out.println("doGet끝.");
		
		req.setAttribute("gsuVO", gsuVO);
		req.setAttribute("aplVO", aplVO);
		req.getRequestDispatcher("/jsp/study/applyStudyList.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("doPost로 들어옴");
		
		String[] apNos;
		
		if(req.getParameterValues("delChkApNo") != null){
			//삭제할 번호가 들어왔을 경우
			apNos = req.getParameterValues("delChkApNo");
			System.out.println("삭제 번호 불러옴.");
			for(int i = 0; i < apNos.length; i++) {
				System.out.println("###### " + apNos[i]);
				
//			삭제일 경우 -> apply에서 삭제			
			
				aplService.deleteStudyMem(apNos[i]);
			
			}
			
		}else {
			//승인한 번호가 들어왔을 경우
			apNos = req.getParameterValues("addChkApNo");
			System.out.println("승인 번호 불러옴.");
			
			for(int i = 0; i < apNos.length; i++) {
				System.out.println("###### " + apNos[i]);
				
//			승인일 경우 -> studyMem에 추가
//						apply에서 삭제
	
				int status = proService.insertStudyMem(apNos[i]);
				
				
				//성공
				aplService.deleteStudyMem(apNos[i]);
				String gsu_no="";
					
					
				//gsu_no를 가져와야함
				gsu_no=aplService.getGsuNo(apNos[i]);
				System.out.println(gsu_no);
				
				resp.sendRedirect("/getStudy.do?gsu_no="+gsu_no);
					
				
				
		}
		
		
		
		
	}
	
	
	

	}
}
