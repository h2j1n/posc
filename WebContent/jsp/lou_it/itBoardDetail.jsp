<%@page import="board_it.vo.ItVo"%>
<%@ page import="board_post.vo.PostBoardVO" %>
<%@ page import="board_post.vo.StcoVO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>o


   
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


Integer user_no = (Integer)session.getAttribute("userNo");



ItVo iv = (ItVo)request.getAttribute("iv");
%>






<div class="dummy"></div>

<!-- <div class="h1title"> -->
<div class="h1title">
    <h1>IT이벤트 게시판</h1>
</div>




<!-- 글 작성 버튼 -->





<div class="container">

<!-- <div class="detailboard write_button" style="display:block; text-align: right;"> -->

<!--     <button id="updatebtn" class="postbtn" style="margin-right: 0;s">수정</button> -->
<!--     <button id="delbtn" class="postbtn2">삭제</button> -->
   


   
<!-- </div> -->
</div>

<div class="container">
<div class="detailboard" style="display: block;">
    <div class="white_box2" id="whiteBox" style="width: 100%;">
        <div class="post_info">
            <div class="h4title">
                <h4><%=iv.getIt_title() %></h4>
            </div>
            <div class="post_meta">
                <img alt="조회수" src="/img/eye.png" style="width: 30px; height: 30px;">&nbsp;
                <p id="hit"><%=iv.getIt_hit() %></p>회&nbsp; | &nbsp;&nbsp;&nbsp;
                <p id="postDate"><%=iv.getIt_wrdate() %></p>
            </div>
        </div>
        <div class="post_content">
            <p id="postContent">
               <%=iv.getIt_content() %>
            </p>
        </div>
    </div>
    
    
</div>
<div class="write_button2" style="margin: 0; margin-top:20px;">
    <button onclick="location.href='/itBoardList.do'" class="postbtn3">글 목록</button>
</div>
</div>






<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>   
<script>
    var deleteBtn = $("#delbtn");
    var updateBtn = $("#updatebtn");

    // 삭제 버튼 클릭 시 이벤트
    deleteBtn.on("click", function () {
        // 확인 창 띄우기
        if (confirm("정말로 삭제하시겠습니까?")) {
           location.href="/itBoardDelete.do?it_no=<%=iv.getIt_no()%>";
        }
    });

    // 수정 버튼 클릭 시 이벤트
    updateBtn.on("click", function () {
		location.href="/itBoardUpdate.do?it_no=<%=iv.getIt_no()%>";
    
    
    });
    
</script>


<%@include file="/includes/footer.jsp" %>
