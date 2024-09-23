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

@WebServlet("/AdList.do")
public class AdList extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private IAdService service = AdServiceImpl.getInstance();
       
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        
        
        
    	List<AdVO> confirmList = service.confirmList();
        List<AdVO> adList = service.adList();

        request.setAttribute("confirmList", confirmList);
        request.setAttribute("adList", adList);
        
        
        
        
        
        
        
        
        
        request.getRequestDispatcher("/jsp/ad/adList.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        doGet(request, response);
    }
}
