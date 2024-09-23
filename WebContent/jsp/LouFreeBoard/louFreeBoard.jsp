<%@page import="java.util.Comparator"%>
<%@page import="com.itextpdf.text.log.SysoCounter"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.Collection"%>
<%@page import="java.util.List"%>
<%@page import="vo.LouFreeBoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<style>
.HHWflex {
	display: flex;
}

.detailboard1 {
	font-family: Arial, sans-serif;
	background-color: #f8f9fa;
	margin: 0;
	padding: 0;
	/* display: flex; */
	justify-content: center;
	align-items: center;
}

.white_box3 {
	background-color: #fff;
	padding: 40px 60px;
	/* width: calc(60% - 40px); */
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	border-radius: 40px;
	display: flex;
	flex-direction: column;
	align-items: center;
	position: relative;
	overflow: hidden;
}

.dummy {
	width: 100%;
	height: 130px
}

.side-menu ul {
	border: 3px solid;
	border-radius: 10%;
	padding-left: 0;
	margin-bottom: 0;
	text-align: center;
	background-color: white;
}

.side-menu ul li {
	border-bottom: 1px solid;
	list-style: none;
	font-size: x-large;
	padding: 3%;
}

.side-menu ul li:last-of-type {
	border-bottom: none;
}

.write_button10 {
	display: flex;
	align-items: center;
	text-align: center;
	width: 6%;
	height:80%;
}

.white_box_chu {
	background-color: #fff;
	margin: 30px auto 20px;
	padding-top: 20px;
	width: 60%;
	padding-bottom: 60px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	border-radius: 40px;
}
</style>



<%
Integer adminId = (Integer) session.getAttribute("admNo");
Integer userId = (Integer) session.getAttribute("userNo");
if (userId != null || adminId != null) {
%>
<%@include file="/includes/header_Login.jsp"%>
<%
	} else {
%>

<%@include file="/includes/header_unLogin.jsp"%>
<%
	}
%>







<div class="h1title">
	<h1>자유 라운지</h1>
</div>




<!-- 글 작성 버튼 -->


<div class="container">

	



	<div class="row">
		
		<div style="display: flex; justify-content: space-between; width: 100vw; ">
			<div class="search-box" style="width:30%; margin-left: 136px;">
				<form action="/SearchBoard.do" method="get">
					<input type="text" name="keyword" placeholder="제목 또는 내용을 입력하세요 " required>
					<button type="submit">
						<i class="fas fa-search"></i>
					</button>
				</form>
			</div>
			<button class="write_button10 postbtn col-1 d-flex justify-content-center" id="addBtn"
				style="display: flex; margin-right: 145px;">작 성</button>
		</div>


		<div class="white_box_chu" style="width: 80%">
			<div class="table_wrapper">
				<table class="table_layout pc">
					<colgroup>
						<col style="width: 10%">
						<col>
						<col style="width: 15%">
						<col style="width: 10%">
						<col style="width: 15%">
					</colgroup>

					<thead class="table_head">
						<tr>
							<th>번호</th>
							<th>제목</th>
		
							<th>등록일</th>
							<th>조회수</th>
							<th>작성자</th>
						</tr>
					</thead>
					<tbody class="table_body">
						<%
						int pageSize = 10; //한페이지 총 게시믈 수
						int startNumber = ((int) request.getAttribute("currentPage")-1)*pageSize+1;
						%>
						<%
						List<LouFreeBoardVO> boardList = (List<LouFreeBoardVO>) request.getAttribute("freeList");

						if (boardList == null || boardList.isEmpty()) {
						%>
						<tr>
							<td colspan="5">조회하신 게시글이 존재하지 않습니다.</td>
						</tr>
						<%
						} else {
						}
						int no = startNumber;
						for (LouFreeBoardVO louFreeBoardVO : boardList) {
						%>
						<tr>
							<%-- 					<td class="num"><%=lou.getFree_no() %></td> --%>
							
							<%
							String Title = louFreeBoardVO.getFree_title();
							String subTitle = Title.substring(0, Math.min(Title.length(), 13));
							%>
							
							<td class="num"><%=no++%></td>
							<td class="subject link_view"><a href="/LoutFreeBoardDetail.do?free_no=<%=louFreeBoardVO.getFree_no()%>"><%=subTitle%></a>
							</td>

							
							<td class="date"><%=louFreeBoardVO.getFree_date()%></td>
							<td class="view"><%=louFreeBoardVO.getFree_hit()%></td>
							<%
							if(louFreeBoardVO.getUser_id().equals("admin")){
							%>

							<td class="writer"><%=louFreeBoardVO.getUser_id()%>(관리자)</td>

							<%
							} else {
							%>

							<td class="writer"><%=louFreeBoardVO.getUser_id()%></td>


							<%
								}
							%>

						</tr>

						<%
							}
						%>
					</tbody>
				</table>
			</div>

		</div>





	</div>




	<!-- page -->
	<div class="pagination">
		<%
		int totalPages = (int) request.getAttribute("totalPages");
		if (1 < (int) request.getAttribute("currentPage")) {
		%>
		<a
			href="/LouFreeList.do?page=<%=(int) request.getAttribute("currentPage") - 1%>"
			title="이전 페이지"> &lt; </a>
		<%
			} else {
		%>
		<a href="#" class="disabled">&lt;</a>
		<%
			}
		%>

		<%
			for (int pageNum = 1; pageNum < totalPages; pageNum++) {
			if (pageNum == (int) request.getAttribute("currentPage")) {
		%>
		<a href="#" class="page-active"><%=pageNum%></a>


		<%
			} else {
		%>

		<a
			href="<%=request.getContextPath()%>/LouFreeList.do?page=<%=pageNum%>"><%=pageNum%></a>


		<%
			}
		}
		%>
		<%
			if ((int) request.getAttribute("currentPage") < totalPages) {
		%>
		<a
			href="/LouFreeList.do?page=<%=(int) request.getAttribute("currentPage") + 1%>"
			title="다음 페이지"> &gt; </a>
		<%
			} else {
		%>
		<a href="#" class="disabled">&gt;</a>
		<%
			}
		%>



	</div>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script type="text/javascript">
		
	<%if (userId != null || adminId != null) {%>
		$('#addBtn').click(function() {
			location.href = "/LoutFreeBoardRegister.do";

		});
	<%} else {%>
		$('#addBtn').click(function() {
			alert('작성권한이 없습니다 회원가입 후 다시 시도해주시길 바랍니다!');
		});
	<%}%>
		
	</script>

	<%@include file="/includes/footer.jsp"%>