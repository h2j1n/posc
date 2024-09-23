package chatting.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import chatting.service.IchatService;
import chatting.service.chatServiceImpl;
import chatting.vo.ChattingDetailVO;

@WebServlet("/chat.do")
public class Chat extends HttpServlet {
	
	private static IchatService service = chatServiceImpl.getInstance();
	
	private static final long serialVersionUID = 1L;
       
    public Chat() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		request.getRequestDispatcher("jsp/chatting/chat.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		String writer = request.getParameter("writer");
		String content = request.getParameter("content");
		
		ChattingDetailVO chatDetailVO = new ChattingDetailVO();
		
//		int cnt = service.chattingList();
		
	}

}
