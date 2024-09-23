package ad.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ad.service.AdServiceImpl;
import ad.service.IAdService;
import ad.vo.AdVO;

@WebServlet("/AdDetail.do")
public class AdDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private IAdService service = AdServiceImpl.getInstance();
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String no = request.getParameter("no");
	    
	   
	    AdVO adVO = service.selectad(Integer.parseInt(no));
	    
	    // 데이터를 전달
	    request.setAttribute("adVO", adVO);
	    
	    request.getRequestDispatcher("/jsp/ad/adDetail.jsp").forward(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
