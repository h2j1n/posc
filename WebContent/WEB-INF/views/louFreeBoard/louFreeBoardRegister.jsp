<%@page import="vo.MemberVO"%>
<%@page import="vo.LouFreeBoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

	String userNo = (String)session.getAttribute("user");

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
			<h3>게시판 등록</h3>
			<hr/>
			<div class="col-md-12">
				<div class="card">
				<form action="/LoutFreeBoardRegister.do" method="post" id="insertForm"  >
					<div class="card-header">
						<div class="card-title">
							<input type="text" class="form-control" name="title" id="title"/>
						</div>
					</div>
					<div class="card-body">
						<textarea rows="10" cols="50" class="form-control" name= "content" id="content"></textarea>
					</div>
						<div class="card-title">
							<input type="hidden" class="form-control" name="writer" id="writer" value="<%=userNo%>"/>
						</div>
						<div>
							<input type="file" name="context">
							<input type="file" name="context">
						</div>
					<div class="card-footer">
						<button type="submit" class="btn btn-warning" id="addBtn">등록</button>
						<button  class="btn btn-primary" id="listBtn">목록</button>
					</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	

	
	



</script>
</html>