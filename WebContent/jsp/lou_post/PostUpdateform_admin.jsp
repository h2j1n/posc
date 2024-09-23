<%@page import="board_post.vo.PostBoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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

<!--summernote를 위한 부트스트랩 코드입니다 -->
<link href="/css/bootform2.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>

<%
    PostBoardVO boardVO = (PostBoardVO) request.getAttribute("postboardVO");
%>

<div>
    <div class= "h1title">
        <h1>공지사항 게시글 수정</h1>
    </div>
    <!-- 글 작성 버튼 -->
    <div class = "post_button">
        <button onclick="location.href='/PostBoard/List.do'" class="postbtn3">글 목록</button>
        <button type="submit" id="addBtn" class="postbtn">수정</button>
    </div>

    <form action="/PostBoard/update.do" method="POST" id="updateBoard">
        <input type="hidden" name="no" value="<%=boardVO.getPost_no() %>" /> 
        <div class = formtitle>
            <label for="title"></label><br>
            <input type="text" id="title" name="title" value="<%=boardVO.getPost_title() %>" placeholder="제목을 입력해주세요" required><br>
        </div>
        <label for="content" style="font-size: 20px;"></label>
        <textarea class="form-control summernote" rows="5" id="content" name="content"><%=boardVO.getPost_content() %></textarea>
    </form>
</div>




<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>   
    <!-- Summernote 초기화 스크립트 -->
    
    <script type="text/javascript">
   	  $.noConflict();
      $(".summernote").summernote({

         //에디터의 높이
         height:503,
         //에디터 한글 설정
         lang:"ko-KR",
         placeholder: '내용을 입력해주세요',
         //에디터의 커서 이동
         focus:true,
         toolbar:[
            //글꼴지정
            ['fontname',['fontname']],

            //글자 크기 설정
            ['fontsize',['fontsize']],
            
            //굵기, 기움임꼴, 밑줄, 취소선 서식 지우기
            ['style',['bold','italic','underline','strikethough','clear']],
            
            //글자색
            ['color',['forecolor','color']],
            //표만들기
            ['table',['table']],
            //글머리 기호,번호매기기,문단정렬
            ['pare',['ul','ol','paragraph']],
            //줄간격
            ['height',['height']],
            //그림첨부,링크만들기,동영상첨부
            ['insert',['picture','link','video']],
            //코드 보기,확대해서 보기,도움말
            ['view',['codeview','fullscreen','help']]
            
            ],
            //추가한 글꼴
            fontName:['Arial','Arial Black','Comic Sans MS','맑은 고딕','궁서','굴림체','돋음체','바탕체'],
            //추가한 폰트사이즈
            fontSizes:['8','9','10','11','12','13','14','15','20','30','40']
      })
   
      </script>
      
      <script>

      $(function(){
          var listbtn = $("#listbtn");
          var addBtn = $("#addBtn");
          var updateBoard = $("#updateBoard");

            // 등록 버튼 클릭 시 이벤트
            addBtn.on("click", function(){
                var title = $("#title").val();
                var content = $("#content").val();

                if(title == null || title==""){
                    alert("제목을 입력해주세요!");
                    return false;
                }
                if(content == null || content==""){
                    alert("내용을 입력해주세요!");
                    return false;
                }

                updateBoard.submit();   // 서버로 전송
            });
            });
        


      </script>
<%@include file="/includes/footer.jsp" %>
