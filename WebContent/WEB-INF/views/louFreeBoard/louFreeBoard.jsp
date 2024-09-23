<%@page import="com.sun.org.apache.bcel.internal.generic.LUSHR"%>
<%@page import="vo.LouFreeBoardVO"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%

	List<LouFreeBoardVO> boardList = (List<LouFreeBoardVO>)request.getAttribute("LouFreeBoardList");
	String userNo = (String)session.getAttribute("memberNo");



%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-sclae=1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>JSP AJAX</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="js/bootstrap.js"></script>

</head>
<body>
	<br>
	<div class="container">
		<div class="form-group row pull-right">
			<div class="col-xs-8">
				<input class="form-control" type="text" size="20">
			</div>
			<div class="col-xs-2">
				<button class="btn btn-primary" type="button">검색</button>
			</div>
			<div class="col-xs-2">
				<button class="btn btn-primary" type="button" id="registerBtn">게시글 작성</button>
			
			</div>
		</div>
		<table class="table" style="text-align : center; border: 1px solid #dddddd" >
		<thead>
			<tr>
				<th style="background-color:#fafafa; text-align:center;">번호</th>
				<th style="background-color:#fafafa; text-align:center;">제목</th>
				<th style="background-color:#fafafa; text-align:center;">내용</th>
				<th style="background-color:#fafafa; text-align:center;">작성일</th>
				<th style="background-color:#fafafa; text-align:center;">조회수</th>
			</tr>
		</thead>
		<%
		if(boardList.size() ==0){
			
				
				
		%>		
				
<%			
			}else{
				for(LouFreeBoardVO lfbv : boardList){
					
					
				
				
				
%>		
		<tbody>
			<tr>
				
				<th><%=lfbv.getFree_no() %></th>						
				<th><a href="/LoutFreeBoardDetail.do?free_no=<%=lfbv.getFree_no()%>"><%=lfbv.getFree_title() %></a></th>						
				<th><a><%=lfbv.getFree_content() %></a></th>						
				<th><%=lfbv.getFree_date() %></th>						
				<th><%=lfbv.getFree_hit() %></th>						
			</tr>
		</tbody>
				
				
		<% 		
			}
			}
		
		%>
		
		</table>
	</div>
<script type="text/javascript">
	$(function(){
		$('#registerBtn').click(function(){
			location.href="/LoutFreeBoardRegister.do?user_no=<%=userNo%>";
			
			
		});
		
		
		
		
	});




</script>






</body>
</html>