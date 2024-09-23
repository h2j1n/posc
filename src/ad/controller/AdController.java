package ad.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ad.vo.AdVO;
import ad.service.AdServiceImpl;
import ad.service.IAdService;

@WebServlet("/AdController")
public class AdController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    
    private IAdService service = AdServiceImpl.getInstance();
    

    protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        List<AdVO> adList = service.getConfirmedAds(); // 광고 리스트 가져오기
        request.setAttribute("adList", adList); // request에 광고 리스트를 attribute로 설정
        
        // JSP 페이지로 포워드
        RequestDispatcher dispatcher = request.getRequestDispatcher("/main_unLogin.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // doPost 메서드는 필요에 따라 구현
    }

}
