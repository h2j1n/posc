package main.controller.studyList;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ad.service.AdServiceImpl;
import ad.service.IAdService;
import ad.vo.AdVO;
import main.service.IMainHotService;
import main.service.IMainNewService;
import main.service.MainHotServiceImpl;
import main.service.MainNewServiceImpl;
import main.vo.MainHotVO;
import main.vo.MainNewVO;


@WebServlet("/loginMain.do")
public class LoginMain extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private IMainHotService serviceHot = MainHotServiceImpl.getInstance();
    private IMainNewService serviceNew = MainNewServiceImpl.getInstance();
    private IAdService service = AdServiceImpl.getInstance();
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String key = (String)request.getAttribute("key");
	    HttpSession session = request.getSession();
	    Integer adminId = (Integer) session.getAttribute("admNo");
	    if(adminId!=null) {
	    	request.setAttribute("adminId", Integer.toString(adminId));
	    }
	      if(key==null) key = "whole";
	      
	      int page = 1;      //기본 페이지
	      int pageSize = 8;   //한 페이지당 게시물 수
	      
	      if(request.getParameter("page")!=null) {
	         page = Integer.parseInt(request.getParameter("page"));
	      }
	      
	      List<MainHotVO> hotList = serviceHot.getHotList();
	      request.setAttribute("hotList", hotList);
	      
	      if(key.equals("whole")) {
	         List<MainNewVO> newList = serviceNew.getNewTotalListByPage(page, pageSize);
	         request.setAttribute("newList", newList);
	      }
	      if(key.equals("project")) {
	         List<MainNewVO> newList = serviceNew.getNewProListByPage(page, pageSize);
	         request.setAttribute("newList", newList);
	      }
	      if(key.equals("study")) {
	         List<MainNewVO> newList = serviceNew.getNewStdListByPage(page, pageSize);
	         request.setAttribute("newList", newList);
	      }
	      
	      List<MainNewVO> newList = serviceNew.getNewList();   //페이징할 전체 데이터
	      
//	      List<MainNewVO> newTotalListByPaging = serviceNew.getNewTotalListByPage(page, pageSize);
//	      List<MainNewVO> newProListByPaging = serviceNew.getNewProListByPage(page, pageSize);
//	      List<MainNewVO> newStdListByPaging = serviceNew.getNewStdListByPage(page, pageSize);
	      
	      
	      int listSize = newList.size();                  //게시물 수
	      
	      int totalPages = (int)Math.ceil((double) listSize / pageSize );
	      
	      request.setAttribute("totalPages", totalPages);
	      request.setAttribute("currentPage", page);
	      
	      
	      
//	      광고페이지 광고 불러오기 
	      List<AdVO> adList = service.getConfirmedAds(); // 광고 리스트 가져오기
	        request.setAttribute("adList", adList); 
	      
	      
	      request.getRequestDispatcher("jsp/main/main_Login.jsp").forward(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
