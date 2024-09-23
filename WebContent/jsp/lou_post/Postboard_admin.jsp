<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="board_post.vo.PostBoardVO" %>
<%@ page import="java.util.List" %>
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

<div class="h1title">
    <h1>공지사항</h1>
</div>
<div>
<div class="action-bar">
    <!-- 검색창 추가 -->
    <div class="search-box">
        <form action="<%= request.getContextPath() %>/PostBoard/Search.do" method="get">
            <input type="text" name="searchKeyword" placeholder="제목 또는 내용을 입력하세요" required>
            <button type="submit">
                <i class="fas fa-search"></i>
            </button>
        </form>
    </div>

    <% if(adminId != null) { %>
        <!-- 글 작성 버튼 -->
        <div class="write_button">
            <button id="addBtn" class="postbtn">작성</button>
        </div>
    <% } %>
</div>

<div class="white_box">
    <div class="table_wrapper">
        <table class="table_layout pc">
            <colgroup>
                <col style="width: 10%">
                <col>
                <col style="width: 15%">
                <col style="width: 10%">
            </colgroup>

            <thead class="table_head">
                <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th>등록일</th>
                    <th>조회수</th>
                </tr>
            </thead>
            <tbody class="table_body">
                <%
				int pageSize = 10; // 한 페이지에 보여지는 게시글 수
				int startingNumber = ((int) request.getAttribute("currentPage") - 1) * pageSize + 1; // 시작 번호 계산
				%>
				
				<%
				List<PostBoardVO> postboardList = (List<PostBoardVO>) request.getAttribute("postboardList");
				if (postboardList == null || postboardList.isEmpty()) {
				%>
				    <tr>
				        <td colspan="5">조회하신 게시글이 존재하지 않습니다.</td>
				    </tr>
				<%
				} else {
				    int number = startingNumber; // 시작 번호
				    for (PostBoardVO postboardVO : postboardList) {
				%>
				    <tr>
				        <td class="num"><%= number++ %></td>
				        <td class="subject link_view">
				            <a href="<%= request.getContextPath() %>/PostBoard/Detail.do?no=<%= postboardVO.getPost_no()%>">
				                <%= postboardVO.getPost_title() %>
				            </a>
				        </td>
				        <!-- 등록일과 조회수 출력 -->
				        <td class="date"><%= postboardVO.getPost_date() %></td>
				        <td class="view"><%= postboardVO.getPost_hit() %></td>
				    </tr>
				<%
				    }
				}
				%>
            </tbody>
        </table>
    </div>
</div>
</div>

<!-- Page -->
<div class="pagination">
    <%
    int totalPages = (int) request.getAttribute("totalPages");
    %>
    <!-- 이전 페이지로 이동 -->
    <% if ((int) request.getAttribute("currentPage") > 1) { %>
        <a href="<%= request.getContextPath()%>/PostBoard/List.do?page=<%= (int) request.getAttribute("currentPage") - 1 %>" title="이전 페이지">
           <i class="fa-solid fa-chevron-left"></i>
        </a>
    <% } else { %>
        <a href="#" class="disabled"><i class="fa-solid fa-chevron-left"></i></a>
    <% } %>

    <!-- 페이지 번호 표시 -->
    <% for (int pageNum = 1; pageNum <= totalPages; pageNum++) { %>
        <% if (pageNum == (int) request.getAttribute("currentPage")) { %>
            <a href="#" class="page-active"><%= pageNum %></a>
        <% } else { %>
            <a href="<%= request.getContextPath()%>/PostBoard/List.do?page=<%= pageNum %>"><%= pageNum %></a>
        <% } %>
    <% } %>

    <!-- 다음 페이지로 이동 -->
    <% if ((int) request.getAttribute("currentPage") < totalPages) { %>
        <a href="<%= request.getContextPath()%>/PostBoard/List.do?page=<%= (int) request.getAttribute("currentPage") + 1 %>" title="다음 페이지">
            <i class="fa-solid fa-chevron-right"></i>
        </a>
    <% } else { %>
        <a href="#" class="disabled"> <i class="fa-solid fa-chevron-right"></i></a>
    <% } %>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
    var addBtn=$("#addBtn");
    
    addBtn.on("click", function(){
        location.href = "/PostBoard/Insert.do"; // get방식의 요청(등록페이지로 이동)
});
});
</script>

<%@include file="/includes/footer.jsp" %>
