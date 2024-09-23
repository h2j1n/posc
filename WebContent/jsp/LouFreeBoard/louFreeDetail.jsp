<%@page import="board_free.vo.FrcoVO"%>
<%@page import="vo.LouFreeBoardVO"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String userId1 = (String)session.getAttribute("sessionName");
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
   LouFreeBoardVO lou = (LouFreeBoardVO)request.getAttribute("freeBoard");  //상세게시글정보 
   
   String msg = (String) request.getAttribute("resultMsg");  //수정 완료 알러트
   
   
   
%>
<style>
.dummy{
	margin-top: 130px;
}
.louFree .comment_container {
	max-width: none;
}
.louFree .comment_form {
	margin: 0;
}
.louFree form {
	max-width: none;
}
.louFree .comment_form textarea {
	width: 100%;
}

.louFree form button {
	margin: 0;
}


</style>

<%
    // 게시글 객체와 댓글 리스트를 가져옴
//     LouFreeBoardVO freeboardVO = (LouFreeBoardVO) request.getAttribute("freeboardVO");
    FrcoVO frcoVO = (FrcoVO) request.getAttribute("frcoVO");
    List<FrcoVO> comments = (List<FrcoVO>) request.getAttribute("comments");
    
    // 댓글 리스트가 null인 경우 처리
    if (comments == null) {
        comments = new ArrayList<>();
    }

    // 게시글 번호를 가져옴
    int freeNo = 0;
    if (lou != null) {
        freeNo = lou.getFree_no();
    }
    
 // 확인을 위해 freeNo 값을 출력
    out.println("freeNo: " + freeNo);
 
 // 확인을 위해 freeboardVO 값을 출력
    out.println("freeboardVO: " + lou);
%>


<div class="dummy"></div>

<!-- <div class="h1title"> -->
<div class="h1title">
    <h1>자유게시판 라운지</h1>
</div>




<!-- 글 작성 버튼 -->





<div class="container">

<div class="detailboard write_button" style="display:block; text-align: right;">
 <% if (lou != null && userId != null && userId.equals(lou.getUser_no())) { %>

    <button id="updatebtn" class="postbtn" style="margin-right: 0;s">수정</button>
    <button id="delbtn" class="postbtn2">삭제</button>
	
<% 			
		}
%>


	
</div>
</div>

<div class="container">
<div class="detailboard" style="display: block;">
    <div class="white_box2" id="whiteBox" style="width: 100%;">
        <div class="post_info">
            <div class="h4title">
                <h4><%=lou.getFree_title() %></h4>
            </div>
            <div class="post_meta">
                <img alt="조회수" src="/img/eye.png" style="width: 30px; height: 30px;">&nbsp;
                <p id="hit"><%=lou.getFree_hit()%></p>회&nbsp; | &nbsp;&nbsp;&nbsp;
                <p id="postDate"><%=lou.getFree_date() %></p>
            </div>
        </div>
        <div class="post_content">
            <p id="postContent">
                <%=lou.getFree_content() %>
            </p>
        </div>
    </div>
    
    
</div>
<div class="write_button2" style="margin: 0; margin-top:20px;">
    <button onclick="location.href='/LouFreeList.do'" class="postbtn3">글 목록</button>
</div>
</div>










<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>   

<script type="text/javascript">
    var deleteBtn = $("#delbtn");
    var updateBtn = $("#updatebtn");


    updateBtn.on("click", function () {
        location.href ="/UpdateBoard.do?free_no=<%=lou.getFree_no()%>";
	});
    deleteBtn.on("click", function () {
        if (confirm("정말로 삭제하시겠습니까?")) {
            // 확인을 누르면 삭제 진행
        }
        location.href ="/DeleteBoard.do?free_no=<%=lou.getFree_no()%>";
	});

	
	
	

    
</script>

<% 
if(msg != null){
	%>
	<script type="text/javascript">
	alert("수정이 완료되었습니다!");
	</script>
	<%
}
%>
<div class="container louFree">
<%@ include file="comment.jsp" %>
</div>
<%@include file="/includes/footer.jsp" %>
