package websocket;

import java.io.IOException;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/ChatingServer/{chatRoomId}/{chatId}")
public class ChatServer {

    // 채팅방 별로 클라이언트 세션을 관리하기 위한 Map
    private static Map<String, Set<Session>> chatRooms = Collections.synchronizedMap(new HashMap<>());

    @OnOpen
    public void onOpen(@PathParam("chatRoomId") String chatRoomId, @PathParam("chatId") String chatId, Session session) {
        chatRooms.putIfAbsent(chatRoomId, Collections.synchronizedSet(new HashSet<>()));
        chatRooms.get(chatRoomId).add(session);
        session.getUserProperties().put("chatId", chatId);
        System.out.println("채팅창 연결: " + session.getId() + " in room: " + chatRoomId);

        // 새로운 사용자가 입장했음을 알리기 위한 메시지 전송
        String joinMessage = chatId + "님이 입장했습니다";
        synchronized (chatRooms.get(chatRoomId)) {
            for (Session client : chatRooms.get(chatRoomId)) {
                try {
                    client.getBasicRemote().sendText("SYSTEM|" + joinMessage);
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    @OnMessage
    public void onMessage(@PathParam("chatRoomId") String chatRoomId, String message, Session session) throws IOException {
        String chatId = (String) session.getUserProperties().get("chatId");
        System.out.println("메시지 전송: " + session.getId() + ": " + message + " in room: " + chatRoomId);
        synchronized (chatRooms.get(chatRoomId)) {
            for (Session client : chatRooms.get(chatRoomId)) {
                if (!client.equals(session)) {
                    client.getBasicRemote().sendText(chatId + "|" + message);
                }
            }
        }
    }

    @OnClose
    public void onClose(@PathParam("chatRoomId") String chatRoomId, Session session) {
        chatRooms.get(chatRoomId).remove(session);
        if (chatRooms.get(chatRoomId).isEmpty()) {
            chatRooms.remove(chatRoomId);
        }
        String chatId = (String) session.getUserProperties().get("chatId");
        String leaveMessage = chatId + "님이 퇴장했습니다";
        synchronized (chatRooms.get(chatRoomId)) {
            for (Session client : chatRooms.get(chatRoomId)) {
                try {
                    client.getBasicRemote().sendText("SYSTEM|" + leaveMessage);
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        System.out.println("채팅창 종료: " + session.getId() + " in room: " + chatRoomId);
    }

    @OnError
    public void onError(Throwable e) {
        System.out.println("에러 발생");
        e.printStackTrace();
    }
}
