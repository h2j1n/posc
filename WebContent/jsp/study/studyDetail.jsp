<%@page import="study.vo.StudyLeaderVO"%>
<%@page import="study.vo.StudyVO"%>
<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    StudyVO stdVO = (StudyVO) request.getAttribute("stdVO");
    StudyLeaderVO slVO = (StudyLeaderVO) request.getAttribute("slVO");
    String user_id = (String) request.getAttribute("user_id");
    
    int stdNo = 0;
    if (stdVO != null) {
        stdNo = stdVO.getStd_no();
    }

    Integer adminId = (Integer) session.getAttribute("admNo");
    Integer userId = (Integer) session.getAttribute("userNo");
    String userNM = (String) session.getAttribute("sessionName");
    
    String userInfo = (String)stdVO.getUser_info(); // 스터디 멤버 정보
    String sessionId = (String)session.getAttribute("userId"); // 세션에 등록된 ID
    
    if(userId!=null ||adminId!=null){
		if(userId!=null){
%>			
			
<%@include file="/includes/header_Login.jsp"%>
<% 			
		}else if(adminId!=null){
			
%>
<%@include file="/includes/header_Admin.jsp"%>
<% 
		}
		
	}else{
%>
<%@include file="/includes/header_unLogin.jsp"%>
<% 			
	}
%>	




<style>
.bn{
    border: none;
    text-align: center;
    color: white;
    width: 80px;
    padding: 10px;
    margin-right: 10px;
}
#upBtn{
    background-color : #008000;
    border-radius: 10px;
    font-weight: bold;
}
#deBtn{
    background-color : #ff8080;
    border-radius: 10px;
    font-weight: bold;
}
#liBtn{
    background-color : #979797;
    color: white;
    font-weight: bold;
    margin-right: 10px;
}
#toChatting{
    background-color : #F4FA58;
}
#chatbtn {
        background-color: #FFB800;
        color: black;
        padding: 10px 20px;
        border: none;
        border-radius: 20px;
        cursor: pointer;
        font-size: 16px;
        font-weight: bold;
        font-family: 'Inter', sans-serif;
        transition: background-color 0.3s ease;
    }
    #chatbtn:hover {
        background-color: #EDAD08;
    }
</style>
<%
if(stdVO != null){
%>
<div class="dummy" style="margin-top:200px"></div>
<div class="container" style="display:flex; justify-content: center;" >
    <div class="row" style="width:80%;">
        <div class="col-md-12">
        <%
        if(userNM != null && userNM.equals(slVO.getUser_id())){
        %>
            <div class="asd" style="display:flex; justify-content:flex-end; ">
                <button id="upBtn" class="bn" onclick="upd()">수 정</button>
                <button id="deBtn" class="bn" onclick="del()">삭 제</button>
            </div>
        <%
        }
        %>
            <div>
                <hr>
                <div class="h1title">
                    <h1><%= stdVO.getStd_name() %></h1>
                </div>
                <hr>
                <div class="detailboard1">
                <!-- 글 작성 버튼 -->
                <div class="write_button10">
                </div>
                    <div class="white_box3" id="whiteBox">
                        <div class="post_info">
                            <table class="hw_table">
                                <tr>
                                    <th class="HWcol">모집구분</th>
                                    <td>스터디</td>
                                </tr>
                                <tr>
                                    <th class="HWcol">진행기간</th>
                                    <td><%= (stdVO.getStd_strdt().substring(0, 10)) %> ~ <%= (stdVO.getStd_enddt().substring(0, 10)) %></td>
                                </tr>
                                <tr>
                                    <th class="HWcol">기술 스택</th>
                                    <%
                                        int code = stdVO.getSgbn_no();
                                    	String skills = "";
                                    	if(code==1)skills = "프론트엔드";
                                    	if(code==2)skills = "백엔드";
                                    	if(code==3)skills = "풀스택";
                                    	if(code==4)skills = "게임";
                                    %>
                                    <td><%= skills %></td>
                                </tr>
                                <tr>
                                    <th class="HWcol">스터디 리더</th>
                                    <td><%= slVO != null ? slVO.getUser_id() : "" %></td>
                                </tr>
                                <tr>
                                    <th class="HWcol">스터디 멤버</th>
                                    <td>
                                    <%
                                    	String info = "";
                                    	if(stdVO.getUser_info()!=null){
	                                    	info = stdVO.getUser_info(); 
                                    	}
                                    %>
                                    <%=info %>
                                    </td>
                                </tr>
                                <tr>
                                    <th class="HWcol">스터디명</th>
                                    <td><%= stdVO.getStd_name() %></td>
                                </tr>

                            </table>
                        </div>
                    </div>
                    
                    <div class="post_content white_box3 mt-5" id="whiteBox">
                        <hr>
                        <p id="postContent" style="font-size: x-large;">
                            <% 
                            String cont = "";
                            if(stdVO.getStd_cont()!=null){
                            	cont = stdVO.getStd_cont();
                            }else{
                            	cont = "null";
                            }
                            %>
                            <%=cont %>
                            </p>
                            </div>
                            <br>
                            <div class="bottom">
                            <div style="display:flex; justify-content:flex-end; ">
                            <p id="postDate">작성일 | <%= stdVO.getStd_date() %></p>
                            </div>
                            <div style="display:flex; justify-content: flex-end;">
                            <%
                            if(user_id != null){
                            %>
                            <button id="liBtn" onclick="location.href='/studyMain.do'" class="bn">글 목록</button>
                            <%
                            }else{
                            %>
                            <button id="liBtn" onclick="location.href='/studyMain.do'" class="btn">글 목록</button>
                            <%
                            }
                            %>
                            <%
                            if (userNM != null && userInfo != null) {
                                if (userInfo.contains(userNM.trim())) {
                        %>
                                    <button id="chatbtn" onclick="chatWinOpen();">💬 CHAT  </button>
                                
                        <%
                                }
                            }
                        %>
                        
                    </div>
                </div>
            </div>
        </div>

    </div>
</div></div>
<%
}else{
%>
    <script>
        alert('데이터를 불러오지 못했습니다.');
        location.href = '/unLoginMain.do';
    </script>
<%
}
%>
<script>
    var userNM = "<%= userNM %>";
    var chatRoomId = "<%= stdNo %>"
       function chatWinOpen() {
        window.open("/jsp/chat/ChatWindow.jsp?chatId=" + userNM + "&chatRoomId=" + chatRoomId, "", "width=440,height=720");
    }
    
    function upd(){
    	location.href = '/updateStudyDetail.do?no='+<%=stdNo%>;
    }
    function del(){
    	if(confirm('정말로 삭제하시겠습니까?')){
    		location.href = '/deleteStudyDetail.do?no='+<%=stdNo%>;
    	}
    }
    
</script>
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>   
    <%@include file="/includes/footer.jsp" %>