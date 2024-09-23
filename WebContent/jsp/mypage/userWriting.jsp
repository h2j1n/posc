<%@page import="get_study_user.vo.GetStudyListVO"%>
<%@page import="get_study_user.dao.GetStudyListDAOImpl"%>
<%@page import="get_study_user.vo.GetStudyUserVO"%>
<%@page import="vo.LouFreeBoardVO"%>
<%@page import="board_it.vo.ItBoardVO"%>
<%@page import="java.util.List"%>
<%@page import="vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="/includes/header_Login.jsp" %>

<%
	MemberVO memberVO = (MemberVO) request.getAttribute("memberVO");
	List<String> skillList = (List<String>) request.getAttribute("skills");
	List<ItBoardVO> itBoardList = (List<ItBoardVO>) request.getAttribute("itBoardList");
	List<LouFreeBoardVO> louFreeBoardList = (List<LouFreeBoardVO>) request.getAttribute("louFreeBoardList");
	List<GetStudyUserVO> getStudyUserList = (List<GetStudyUserVO>) request.getAttribute("getStudyUserList");
%>

<div id="header_mg"></div>
  	
<div id = "mypage_cont">
	<div id = "">
  		<div id = "mypage_default">
				<section id="home">
			<!--     TODO : 사진 이미지 -->
				  <img src="/img/mypage/man.png" alt="기본사람">
				  <div id="home__defaultInfo">
					  <div class="home__name"><%=memberVO.getUser_name() %></div>
					  <a href="#" class="home__degree"><%=memberVO.getUser_grade()  %> </a>
					  <button class="home__chat">채팅</button>
				  </div>
				</section>
				    
				<section id="menu">
				  <a href="/mypagemain.do" class="menu__item me-3 fw-bold">정보</a>
			      <a href="/mypageStudy.do" class="menu__item me-3 fw-bold">스터디</a>
			      <a href="/userWriting.do" class="menu__item me-3 fw-bold">글</a>
			      <a href="/mypagePort.do" class="menu__item fw-bold">포트폴리오</a>
			    </section>
		    </div>
		    <div id="mypage_change">
			    <section id="skill">
			      <p class="skill__title mb-3">기술 스택</p>
			      <div class="skill__list">
				      	<%
				      		for(String skill : skillList){
				      	%>
				      		<span class="skill__name"><%=skill %></span>
				      	<%
				      		}
				      	%>
			      </div>
			    </section>
		</div>
	</div>
</div>


<div class="h1title mt-5">
	<div> 
		<hr>
    <h1>작성한 게시글 정보</h1>
	</div>
</div>
<!-- <div class="action-bar"> -->
<!--     검색창 추가 -->
<!--     <div class="search-box"> -->
<%--         <form action="<%= request.getContextPath() %>/PostBoard/Search.do" method="get"> --%>
<!--             <input type="text" name="searchKeyword" placeholder="제목 또는 내용을 입력하세요" required> -->
<!--             <button type="submit"> -->
<!--                 <i class="fas fa-search"></i> -->
<!--             </button> -->
<!--         </form> -->
<!--     </div> -->
<!-- </div> -->

<div class="white_box">
    <div class="table_wrapper">
        <table class="table_layout pc">
            <colgroup>
                <col style="width: 10%">
                <col style="width: 40%">
                <col>
                <col style="width: 10%">
            </colgroup>

            <thead class="table_head">
                <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th>내용</th>
                    <th>아이디</th>
                </tr>
            </thead>
            <tbody class="table_body">

				
				<%
				int itIndex = 0;
				int freeIndex = 0;
				int getStdIndex = 0;
				
				int cnt = 0;
				
				// 총 게시글 수를 구한다.
				if(itBoardList != null && itBoardList.size() != 0){
					cnt += itBoardList.size();
				}
				if(louFreeBoardList != null && louFreeBoardList.size() != 0){
					cnt += louFreeBoardList.size();
				}
				if(getStudyUserList != null && getStudyUserList.size() != 0){
					cnt += louFreeBoardList.size();
				}
				
				int number = 1; // 시작 번호
				int i = 0;
				while(itBoardList != null && i < itBoardList.size()){
					ItBoardVO itBoardVO = itBoardList.get(i);
				%>
				    <tr>
				        <td class="num"><%= number++ %></td>
						<% %>
				        <td class="subject link_view">
				            <a href="<%= request.getContextPath() %>/PostBoard/Detail.do?no=<%=itBoardVO.getIt_no() %>">
				                <%= itBoardVO.getIt_title() %>
				            </a>
				        </td>
				        <!-- 등록일과 조회수 출력 -->
				        <td class="content"><%= itBoardVO.getIt_content().substring(0,3) + "..." %></td>
				        <td class="user_id"><%= memberVO.getUser_id() %></td>
				    </tr>
				<%
					i++;
				    }
				%>
				
				<%
				i = 0;
				while(louFreeBoardList != null && i < louFreeBoardList.size()){
					LouFreeBoardVO freeBoardVO = louFreeBoardList.get(i);
				%>
				<tr>
				        <td class="num"><%= number++ %></td>
						<% %>
				        <td class="subject link_view">
				            <a href="<%= request.getContextPath() %>/LoutFreeBoardDetail.do?free_no=<%=freeBoardVO.getFree_no() %>">
				                <%= freeBoardVO.getFree_title() %>
				            </a>
				        </td>
				        <!-- 등록일과 조회수 출력 -->
				        <td class="content"><%= freeBoardVO.getFree_content().substring(0,3) + "..." %></td>
				        <td class="user_id"><%= memberVO.getUser_id() %></td>
				    </tr>
				 <%
					i++;
				    }
				%>
				
				<%
				i = 0;
				while(getStudyUserList != null && i < getStudyUserList.size()){
					GetStudyUserVO getStudyListVO = getStudyUserList.get(i);
				%>
				<tr>
				        <td class="num"><%= number++ %></td>
						<% %>
				        <td class="subject link_view">
				            <a href="<%= request.getContextPath() %>/getStudyDetail.do?gsu_no=<%=getStudyListVO.getGsu_no() %>">
				                <%= getStudyListVO.getGsu_title() %>
				            </a>
				        </td>
				        <!-- 등록일과 조회수 출력 -->
				        <td class="content"><%= getStudyListVO.getGsu_content().substring(0,3) + "..." %></td>
				        <td class="user_id"><%= memberVO.getUser_id() %></td>
				    </tr>
				 <%
					i++;
				    }
				%>
            </tbody>
        </table>
    </div>
</div>


<%@include file="/includes/footer.jsp" %>