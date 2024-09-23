<%@page import="vo.LouFreeBoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

LouFreeBoardVO louFreeBoardVO = (LouFreeBoardVO)request.getAttribute("userNo");

String msg = (String) request.getAttribute("msg");
	
String deleteMsg = (String)request.getAttribute("resultMsg");


%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 상세</title>
</head>
<% 
if(deleteMsg!=null){
%>	

	<script type="text/javascript">
		alert("게시글이 삭제 되었습니다!");
	</script>
	
<% 
}

%>



<% 
if(msg != null){
	%>
	<script type="text/javascript">
	alert("수정이 완료되었습니다!");
	</script>
	<%
}
%>
<body>
	<table border="1">
		<tr>
			<td>번호:</td>
			<td><%=louFreeBoardVO.getFree_no() %></td>
		</tr>
		<tr>
			<td>제목:</td>
			<td><%=louFreeBoardVO.getFree_title() %></td>
		</tr>
		<tr>
			<td>내용:</td>
			<td><%=louFreeBoardVO.getFree_content() %></td>
		</tr>
		<tr>
			<td>작성자:</td>
			<td><%=louFreeBoardVO.getUser_no() %></td>
		</tr>
		<tr>
		<td>첨부파일</td>		
		<td>
	
		</td>		
		
		</tr>
		<tr>
			<td colspan="2">
			<a href="/LouFreeList.do">[목록]</a>
			<a href="/UpdateBoard.do?free_no=<%=louFreeBoardVO.getFree_no()%>">[게시글 수정]</a>
			<a href="/DeleteBoard.do?free_no=<%=louFreeBoardVO.getFree_no()%>">[게시글 삭제]</a>
			</td>
		</tr>
	</table>
</body>
</html>