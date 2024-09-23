package study.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ad.vo.AdVO;
import main.service.IMainNewService;
import main.service.MainNewServiceImpl;
import main.vo.MainHotVO;
import main.vo.MainNewVO;

@WebServlet("/studyMain.do")
public class studyMain extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private IMainNewService serviceNew = MainNewServiceImpl.getInstance();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String key = (String)request.getAttribute("key");
	      
	      if(key==null) key = "whole";
	      
	      int page = 1;      //기본 페이지
	      int pageSize = 12;   //한 페이지당 게시물 수
	      
	      if(request.getParameter("page")!=null) {
	         page = Integer.parseInt(request.getParameter("page"));
	      }
	      
	      if(key.equals("whole")) {
	         List<MainNewVO> newList = serviceNew.getNewTotalListByPage(page, pageSize);
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
  
  
		request.getRequestDispatcher("jsp/study/studyMain.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
