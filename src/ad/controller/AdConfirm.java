package ad.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ad.service.AdServiceImpl;
import ad.service.IAdService;
import ad.vo.AdVO;


@WebServlet("/AdConfirm.do")
public class AdConfirm extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private IAdService service = AdServiceImpl.getInstance();
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 선택된 광고 번호들을 배열로 받아오기
        String[] adNos = request.getParameterValues("no");
        
        // 선택된 각 광고 번호를 for문으로 승인
        for (String adNo : adNos) {
            // 광고 번호에 해당하는 광고를 select
            AdVO ad = service.selectad(Integer.parseInt(adNo));
            ad.setAd_confirm("Y");
            service.confirmAd(ad);
        }

        // 광고 목록 페이지
        response.sendRedirect("/AdList.do");
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
