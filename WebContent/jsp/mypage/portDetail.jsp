<%@page import="mypage.vo.PortfolioVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
Integer adminId =(Integer)session.getAttribute("admNo");
Integer userId =(Integer)session.getAttribute("userNo");
		if(userId!=null ||adminId!=null){
%>			
<%@include file="/includes/header_Login.jsp"%>
<% 			
		}else{
%>

<%@include file="/includes/header_unLogin.jsp"%>
<% 			
		}
%>	 

<%
	PortfolioVO portVO = 
		(PortfolioVO) request.getAttribute("portVO");
%>

<div class="h1title">
    <h1>포트폴리오</h1>
</div>

<!-- 글 작성 버튼 -->
<div class="write_button">
    <button id="updatebtn" class="postbtn">수정</button>
    <button id="delbtn" class="postbtn2">삭제</button>
</div>   

<div class="detailboard">
    <div class="white_box2" id="whiteBox">
        <div class="post_info">
            <div class="h4title">
                <h4><%= portVO.getPort_title() %></h4>
            </div>
            <div class="post_meta">
                <img alt="조회수" src="/img/eye.png" style="width: 30px; height: 30px;">&nbsp;
                <p id="hit"><%= portVO.getPort_hit() %></p>회&nbsp; | &nbsp;&nbsp;&nbsp;
                <p id="postDate"><%= portVO.getPort_date()%></p>
            </div>
        </div>
        <div class="post_content">
            <p id="postContent">
                <%= portVO.getPort_content()%>
            </p>
        </div>
    </div>
</div>


<div class="write_button2">
    <button onclick="location.href='/mypagePort.do'" class="postbtn3">포트폴리오</button>
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
            location.href = "/portRemove.do?portNo=<%= portVO.getPort_no() %>";
        }
    });

    // 수정 버튼 클릭 시 이벤트
    updateBtn.on("click", function () {
        location.href = "/portModify.do?portNo=<%= portVO.getPort_no()%>";
    });
</script>




<%@include file="/includes/footer.jsp" %>