<%@page import="study.vo.StudyLeaderVO"%>
<%@page import="study.vo.StudyVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%
	StudyVO stdVO = (StudyVO) request.getAttribute("stdVO");
	StudyLeaderVO slVO = (StudyLeaderVO) request.getAttribute("slVO");
	String user_id = (String)request.getAttribute("user_id");
	
	// 게시글 번호를 가져옴
	int stdNo = 0;
	if (stdVO != null) {
		stdNo = stdVO.getStd_no();
	}

    Integer adminId = (Integer) session.getAttribute("admNo");
    Integer userId = (Integer) session.getAttribute("userNo");
    String userNM = (String) session.getAttribute("sessionName");
    
    String sessionId = (String)session.getAttribute("userId"); // 세션에 등록된 ID
    
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

<!-- Modal Search Start -->
<div class="modal fade" id="searchModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-fullscreen">
        <div class="modal-content rounded-0">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Search by keyword</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body d-flex align-items-center">
                <div class="input-group w-75 mx-auto d-flex">
                    <input type="search" class="form-control p-3" placeholder="keywords" aria-describedby="search-icon-1">
                    <span id="search-icon-1" class="input-group-text p-3"><i class="fa fa-search"></i></span>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Modal Search End -->

<!-- Single Page Header start -->
<div class="container-fluid page-header py-5">
    <h1 class="text-center text-white display-6">신규 스터디 개설</h1>
</div>
<!-- Single Page Header End -->

<!-- Contact Start -->
<div class="container-fluid contact py-5">
    <div class="container py-5">
        <div class="p-5 bg-light rounded">
            <div class="row g-4">
                <div class="col-12">
                    <div class="text-center mx-auto" style="max-width: 700px;" >
                        <h1 class="text-primary">신청 양식 작성</h1>
                        <p class="mb-4">👉🏻기본 정보를 입력해주세요</p>
                    </div>
                </div>
                <div class="col-lg-12"></div>
                <div class="col-lg-6">
                    <%
                        String[] stack = {"프론트엔드", "백엔드", "풀스택", "게임"};
                    %>
                    <form action="/insertStudy.do" method="post" id="studyUpdateForm">
                        <p>스터디명</p>
                        <input type="text" class="w-100 form-control border-0 py-3 mb-4 bg-white" placeholder="스터디명" id="stdName" name="stdName" required>
                        <p>스터디 시작일</p>
                        <input type="date" class="w-100 form-control border-0 py-3 mb-4" placeholder="스터디 시작일" id="strDate" name="strDate" required>
                        <p>기술 분류</p>
                        <select class="w-100 form-control border-0 py-3 mb-4 bg-white" id="skillSelect" name="skillSelect" >
                            <option value = "">눌러서 선택</option>
                            <%
                            for (int i=0; i<stack.length; i++) {
                            %>
                                <option value="<%=i+1 %>"><%=stack[i] %></option>
                            <%
                            }
                            %>
                        </select>
                </div>
                <div class="col-lg-6">
                    <p>스터디 리더</p>
                    <input type="number" class="w-100 form-control border-0 py-3 mb-4" placeholder="<%=userNM %>" id="member" readonly>
                    <p>스터디 종료일</p>
                    <input type="date" class="w-100 form-control border-0 py-3 mb-4" placeholder="스터디 종료일" id="endDate" name="endDate" required>
                    <p>기술 스택</p>
                    <input type="text" class="w-100 form-control border-0 py-3 mb-4 bg-white" id="skills" name="skills" required>
                </div>
                <p class="mb-4 text-center mx-auto" style="max-width: 700px;">👉🏻내용을 입력해주세요</p>
                <textarea class="w-100 form-control border-0 mb-4" rows="5" cols="10" placeholder="스터디 내용" id="stdCont" name= "stdCont" required></textarea>
                <button class="w-100 btn form-control border-secondary py-3 bg-white text-primary " type="submit" id="addBtn">등록</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Contact End -->
<script>
let selectBox = document.querySelector('#skillSelect');
let skills = document.querySelector('#skills');
let skillVal = 
selectBox.addEventListener('change', function(){
	  let selectValue = selectBox.options[selectBox.selectedIndex].innerText;
	  skills.textContent = selectValue;
	  skills.value = selectBox.options[selectBox.selectedIndex].value;
	});
	
document.querySelector('#addBtn').addEventListener('click', function(){
    <%
    request.setAttribute("user_id", Integer.toString(userId));
    %>
    document.querySelector('#studyInsertForm').submit();
});
</script>


<%@include file="/includes/footer.jsp" %>