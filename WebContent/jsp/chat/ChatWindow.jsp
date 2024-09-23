<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chat Window</title>
<script>
var urlParams = new URLSearchParams(window.location.search);
var chatId = urlParams.get('chatId');
var chatRoomId = urlParams.get('chatRoomId');
var chatAddr = "<%= application.getInitParameter("CHAT_ADDR") %>";
var webSocket = new WebSocket(chatAddr + "/ChatingServer/" + chatRoomId + "/" + chatId);

var chatWindow, chatMessage;

// 채팅창이 열리면 대화창, 메시지 입력창, 아이디 표시란으로 사용할 DOM 객체 저장
window.onload = function() {
    chatWindow = document.getElementById("chatWindow");
    chatMessage = document.getElementById("chatMessage");
    document.getElementById("chatId").value = chatId;
};

// 메시지 전송
function sendMessage() {
    var currentTime = new Date();
    var hours = currentTime.getHours();
    var minutes = currentTime.getMinutes();
    var meridiem = hours >= 12 ? "PM" : "AM";
    hours = hours % 12;
    hours = hours ? hours : 12;
    minutes = minutes < 10 ? "0" + minutes : minutes;
    var currentTimeFormatted = meridiem + " " + hours + ":" + minutes;

    chatWindow.innerHTML += "<div class='chat chat-my'><div class='current-time'>" + currentTimeFormatted + "</div><div class='myMsg'>" + chatMessage.value + "</div></div>";
    webSocket.send(chatMessage.value); // 서버로 전송
    chatMessage.value = ""; // 메시지 입력창 내용 지우기
    chatWindow.scrollTop = chatWindow.scrollHeight; // 대화창 스크롤
}

function disconnect() {
    webSocket.close();
}

// 엔터 키 입력 처리
function enterKey() {
    if (window.event.keyCode == 13) { // 13 = Enter 키의 코드값
        sendMessage();
    }
}

// 웹소켓 서버에 연결되었을 때 실행
webSocket.onopen = function(event) {
    chatWindow.innerHTML += "<div class='connect-message'>채팅방에 연결되었습니다.</div>";
};

// 웹소켓이 닫혔을 때 실행
webSocket.onclose = function(event) {
    chatWindow.innerHTML += "<div class='connect-message'>채팅방이 종료되었습니다.<br></div>";
}

webSocket.onerror = function(event) {
    alert(event.data);
    chatWindow.innerHTML += "<div class='connect-message'>채팅 중 에러가 발생하였습니다.<br></div>";
}

// 메시지를 받았을 때 실행
webSocket.onmessage = function(event) {
    var currentTime = new Date();
    var hours = currentTime.getHours();
    var minutes = currentTime.getMinutes();
    var meridiem = hours >= 12 ? "PM" : "AM";
    hours = hours % 12;
    hours = hours ? hours : 12;
    minutes = minutes < 10 ? "0" + minutes : minutes;
    var currentTimeFormatted = meridiem + " " + hours + ":" + minutes;
    var message = event.data.split("|");
    var sender = message[0];
    var content = message[1];
    if (sender === "SYSTEM") {
        chatWindow.innerHTML += "<div class='connect-message'>" + content + "</div>";
    } else {
        if (content != "") {
            if (content.match("/")) {
                if (content.match(("/" + chatId))) {
                    var temp = content.replace(("/" + chatId), "[🔒]");
                    chatWindow.innerHTML += "<div class='chat chat-other'><div class='otherMsg'><span class='sender'>" + sender + "</span>" + temp + "</div><div class='current-time2'>" + currentTimeFormatted + "</div></div>";
                }
            } else {
                chatWindow.innerHTML += "<div class='chat chat-other'><div class='otherMsg'><span class='sender'>" + sender + "</span>" + content + "</div><div class='current-time2'>" + currentTimeFormatted + "</div></div>";
            }
        }
        adjustSenderPosition();
    }
    chatWindow.scrollTop = chatWindow.scrollHeight;
};

// 보낸 사람(sender)의 위치 조정
function adjustSenderPosition() {
    var senders = document.getElementsByClassName("sender");
    var otherMsgs = document.getElementsByClassName("otherMsg");
    for (var i = 0; i < senders.length; i++) {
        var senderHeight = senders[i].offsetHeight;
        otherMsgs[i].style.paddingTop = senderHeight + "px";
        otherMsgs[i].style.removeProperty('padding-top');
    }
}

</script>
<style>
body {
    background-color: #f2f2f2;
    font-family: Arial, sans-serif;
}

#chatWindow {
    border: 1px solid #ccc;
    background-color: #fff;
    width: 400px;
    height: 560px;
    overflow: auto;
    padding: 5px;
    border-radius: 10px; 
    text-align:center;
}
.current-time {
	padding-top:20px;
    font-size: 10px; 
    color: #bebebe; 
}
.current-time2 {
	padding-top:35px;
    font-size: 10px; 
    color: #bebebe;
}


.connect-message {
    text-align: center;
    font-size: 14px;
    color: #777;
    margin-top: 10px;
    margin-bottom: 10px;
}

#chatWindow::-webkit-scrollbar {
    display: none;
}

#chatWindow {
    -ms-overflow-style: none;  
    scrollbar-width: none; 
}

#chatMessage {
    margin-top: 10px;
    width: 360px;
    height: 30px;
    font-size: 14px;
    border: 1px solid #ccc;
    border-radius: 10px; 
}

#sendBtn {
    margin-top: 10px;
    height: 30px;
    border: none;
    border-radius: 5px;
    background-color: #4CAF50;
    color: white;
    cursor: pointer;
}

#closeBtn {
    margin-bottom: 3px;
    border: none;
    background-color: #f44336;
    color: white;
    cursor: pointer;
}

#chatId {
    width: 158px;
    height: 24px;
    border: 1px solid #AAA;
    background-color: #EEE;
    border-radius: 5px; 
    padding: 5px; 
}

.chat {
    display: flex;
    align-items: center;
}

.chat.chat-my {

    justify-content: flex-end;
}

.chat.chat-other {
    justify-content: flex-start;
}

.myMsg, .otherMsg {
    font-size: 14px !important;
}
.myMsg {
    background-color: #BCE55C; 
    border-radius: 15px; 
    padding: 8px; 
    margin-bottom: 5px; 
    max-width: 60%;
    text-align: right;
    
}

.otherMsg {
    background-color: #E7E7E7;
    border-radius: 15px; 
    padding: 8px; 
    margin-top: 25px; 
    margin-bottom: 5px;
    position: relative;
    max-width: 60%;
    text-align: left;
}

.sender {
    font-weight: bold;
    position: absolute; 
    top: -20px; 
    left: 5px; 
}

</style>
</head>
<body>
	<button id="closeBtn" onclick="disconnect();" style="width: 100px; height: 30px; border-radius: 15px; margin-left: 310px;">채팅 종료</button>

    <div id="chatWindow"></div>
    
    <div>
        <input type="text" id="chatMessage" placeholder="채팅을 입력하세요" onkeyup="enterKey();"  style="text-indent: 10px;">
        <button id="sendBtn" onclick="sendMessage();">전송</button>
    </div>
</body>
</html>
    
