package user.userRLLController;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import user.userRLLService.IMemberService;
import user.userRLLService.MemberServiceImpl;
import vo.MemberVO;


@WebServlet("/login.do")
public class LoginController extends HttpServlet {
   private static final long serialVersionUID = 1L;
   private static IMemberService service = MemberServiceImpl.getInstance();
   
   
   
    public LoginController() {
        super();
    }

   
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
      
      
      
      request.getRequestDispatcher("/jsp/member/login.jsp").forward(request, response);
      
      
   }


   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
      
      
      
      
      
      String id = request.getParameter("id");
      String pass = request.getParameter("pass");
      System.out.println(id);
      System.out.println(pass);
      
      MemberVO memberVO  = new MemberVO();
      Map<String, Object> memMap = new HashMap<String, Object>();
      memMap.put("id", id);
      memMap.put("pass", pass);
      
      //ID , PW 입력후 USER_NO 받아오기
      ///////////////////////////////////////////
      int sessionNo =service.getMemberNo(memMap); // USER_NO
      
      //////////////////////////////////////////////
      
      String sessionId = service.loginMember(memMap); //userId
      
      
      
      System.out.println(sessionId);
      System.out.println(sessionNo);
       
      
      HttpSession sessionName = request.getSession(); //세션 가져와서
      HttpSession memberNo = request.getSession();
      HttpSession errorMsg = request.getSession();
      
      
      if(sessionId!=null && 0<sessionNo) {
         
         sessionName.setAttribute("sessionName", sessionId); //userId
         
         memberNo.setAttribute("userNo",sessionNo);       //userNo
         
         response.sendRedirect("/loginMain.do");
         
         
      }else {
        errorMsg.setAttribute("errorMessage", "아이디,패스워드가 일치하지않습니다");
         request.getRequestDispatcher("/jsp/member/login.jsp").forward(request, response);
         
      }
      
      
      
      
      
      
      
      
   }

}