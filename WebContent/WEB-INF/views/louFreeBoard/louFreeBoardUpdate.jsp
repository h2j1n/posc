<%@page import="vo.MemberVO"%>
<%@page import="vo.LouFreeBoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
	LouFreeBoardVO boardVO = (LouFreeBoardVO)request.getAttribute("boardVo");
	String msg = (String) request.getAttribute("msg");

	
	
	
	if(msg != null){
		%>
		<script type="text/javascript">
		alert("수정이 실패하였습니다!");
		</script>
		<%
	}
%>


<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/dist/css/bootstrap.min.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-12">　</div>
		</div>
		<div class="row">
			<h3>게시글 수정</h3>
			<hr>
			<div class="col-md-12">
				<div class="card">
					<form action="/UpdateBoard.do" method="post" id="insertForm" >
						<input type="hidden" class="form-control" name="writer" id="writer" value="<%=boardVO.getUser_no()%>"/>
						<input type="hidden" class="form-control" name="freeNo" id="freeNo" value="<%=boardVO.getFree_no()%>"/>
						<div class="card-header">
							<div class="card-title">
								<input type="text" class="form-control" name="title" id="title" value="<%=boardVO.getFree_title()%>"/>
							</div>
						</div>
						<div class="card-body">
							<textarea rows="10" cols="50" class="form-control" name= "content" id="content" ><%=boardVO.getFree_content() %></textarea>
						</div>
							<div class="card-title">
							</div>
							<div>
								<input type="file" name="context">
								<input type="file" name="context">
							</div>
						<div class="card-footer">
							<button type="button" class="btn btn-warning" id="updateBtn" >수정</button>
							<button class="btn btn-primary" id="listBtn">목록</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
<script type="text/javascript">
	$(function(){
		var insertForm = $("#insertForm");
		$('#updateBtn').click(function(){
			let title = $('#title').val();
			let content = $('#content').val();
	
			
			if(title == null || title == ""){
				alert("제목을 입력해주세요!");
				return false;
			}
			
			if(content == null || content == ""){
				alert("내용을 입력해주세요!");
				return false;
			}
			
			insertForm.submit();
			
	// 		$.ajax({
	// 			url: '/UpdateBoard.do',
	// 			type: 'post',
	// 			data: data,
	// 			success:function(rst){
	// 				if(rst === "success"){
	// 					alert("수정완료");
	<%-- 					location.href="/LoutFreeBoardDetail.do?free_no=<%=boardVO.getFree_no()%>"; --%>
	// 				}else{
	// 					alert(" 실패");
	// 				}
	// 			},
	// 			error:function(xhr){
	// 				alert(xhr.status);
	// 			}
	// 		});
		});
	});
</script>
</body>
</html>