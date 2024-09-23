<%@ page import="board_post.vo.PostBoardVO" %>
<%@ page import="board_post.vo.StcoVO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


	
<%
Integer adminId =(Integer)session.getAttribute("admNo");
Integer userId =(Integer)session.getAttribute("userNo");
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


<%
    // 게시글 객체와 댓글 리스트를 가져옴
    PostBoardVO postboardVO = (PostBoardVO) request.getAttribute("postboardVO");
    StcoVO stcoVO = (StcoVO) request.getAttribute("stcoVO");
    List<StcoVO> comments = (List<StcoVO>) request.getAttribute("comments");
    
    // 댓글 리스트가 null인 경우 처리
    if (comments == null) {
        comments = new ArrayList<>();
    }

    // 게시글 번호를 가져옴
    int postNo = 0;
    if (postboardVO != null) {
        postNo = postboardVO.getPost_no();
    }
%>


<div class="h1title">
    <h1>공지사항</h1>
</div>


<%

		if(adminId!=null){
%>			

<!-- 글 작성 버튼 -->
<div class="write_button11">
    <button id="updatebtn" class="postbtn">수정</button>
    <button id="delbtn" class="postbtn2">삭제</button>
</div>

<% 			
		}
%>




<div class="detailboard">
    <div class="white_box2" id="whiteBox">
        <div class="post_info">
            <div class="h4title">
                <h4><%= postboardVO.getPost_title() %></h4>
            </div>
            <div class="post_meta">
                <img alt="조회수" src="/img/eye.png" style="width: 30px; height: 30px;">&nbsp;
                <p id="hit"><%= postboardVO.getPost_hit() %></p>회&nbsp; | &nbsp;&nbsp;&nbsp;
                <p id="postDate"><%= postboardVO.getPost_date()%></p>
            </div>
        </div>
        <div class="post_content">
            <p id="postContent">
                <%= postboardVO.getPost_content()%>
            </p>
        </div>
    </div>
</div>




<div class="write_button2">
    <button onclick="location.href='/PostBoard/List.do'" class="postbtn3">글 목록</button>
</div>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>   

<script>
    var deleteBtn = $("#delbtn");
    var updateBtn = $("#updatebtn");

    // 삭제 버튼 클릭 시 이벤트
    deleteBtn.on("click", function () {
        // 확인 창 띄우기
        if (confirm("정말로 삭제하시겠습니까?")) {
            // 확인을 누르면 삭제 진행
            location.href = "/PostBoard/delete.do?no=<%= postboardVO.getPost_no() %>";
        }
    });

    // 수정 버튼 클릭 시 이벤트
    updateBtn.on("click", function () {
        location.href = "/PostBoard/update.do?no=<%= postboardVO.getPost_no()%>";

    });
</script>


<%@ include file="comment.jsp" %>
<%@include file="/includes/footer.jsp" %>
