<%@page import="study.vo.StudyVO"%>
<%@page import="java.util.List"%>
<%@page import="get_study_user.vo.SkillVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="/includes/header_Login.jsp"%>

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
    <h1 class="text-center text-white display-6">스터디 정보 수정</h1>
</div>
<!-- Single Page Header End -->

<!-- Contact Start -->
<div class="container-fluid contact py-5">
    <div class="container py-5">
        <div class="p-5 bg-light rounded">
            <div class="row g-4">
                <div class="col-12">
                    <div class="text-center mx-auto" style="max-width: 700px;" >
                        <h1 class="text-primary">수정 양식 작성</h1>
                        <p class="mb-4">👉🏻기본 정보를 입력해주세요</p>
                    </div>
                </div>
                <div class="col-lg-12"></div>
                <div class="col-lg-6">
                    <%
                        StudyVO stdVO = (StudyVO)request.getAttribute("stdVO");   
                        String[] stack = {"프론트엔드", "백엔드", "풀스택", "게임"};
                    %>
                    <form action="/updateStudyDetail.do?no=<%=stdVO.getStd_no() %>" method="post" id="studyUpdateForm">
                        <p>스터디명</p>
                        <input type="text" class="w-100 form-control border-0 py-3 mb-4 bg-white" placeholder="<%=stdVO.getStd_name() %>" id="stdName" name="stdName">
                        <p>스터디 시작일</p>
                        <input type="date" class="w-100 form-control border-0 py-3 mb-4" placeholder="<%=stdVO.getStd_strdt() %>" id="strDate" name="strDate" >
                        <p>기술 분류</p>
                        <select class="w-100 form-control border-0 py-3 mb-4 bg-white" id="skillSelect" name="skillSelect">
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
                    <p>인원</p>
                    <input type="number" class="w-100 form-control border-0 py-3 mb-4" placeholder="<%=stdVO.getUser_info() %>" id="member" readonly>
                    <p>스터디 종료일</p>
                    <input type="date" class="w-100 form-control border-0 py-3 mb-4" placeholder="<%=stdVO.getStd_enddt() %>" id="endDate" name="endDate" >
                    <p>기술 스택</p>
                    <input type="text" class="w-100 form-control border-0 py-3 mb-4 bg-white" placeholder="<%=stack[(int)stdVO.getSgbn_no()-1] %>" id="skills" name="skills" >
                </div>
                <p class="mb-4 text-center mx-auto" style="max-width: 700px;">👉🏻내용을 입력해주세요</p>
                <textarea class="w-100 form-control border-0 mb-4" rows="5" cols="10" placeholder="<%=stdVO.getStd_cont() %>" id="stdCont" name= "stdCont"></textarea>
                <button class="w-100 btn form-control border-secondary py-3 bg-white text-primary " type="submit" id="addBtn">등록</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Contact End -->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
let selectBox = document.querySelector('#skillSelect');
let skills = document.querySelector('#skills');
let skillVal = 
selectBox.addEventListener('change', function(){
	  let selectValue = selectBox.options[selectBox.selectedIndex].innerText;
	  skills.textContent = selectValue;
	  skills.value = selectBox.options[selectBox.selectedIndex].value;
	});

document.querySelector('#addBtn').addEventListener('click', function(){
    let stdName = document.querySelector('#stdName');
    let strDate = document.querySelector('#strDate');
    let endDate = document.querySelector('#endDate'); 
    let skillVal = document.querySelector('#skills');  
    let stdCont = document.querySelector('#stdCont');   
    
    if(stdName.value == null || stdName.value === ""){
        stdName.value = document.querySelector('#stdName').placeholder;
    }
    if(strDate.value == null || strDate.value === ""){
        strDate.value = document.querySelector('#strDate').placeholder;
    }
    if(endDate.value == null || endDate.value === ""){
        endDate.value = document.querySelector('#endDate').placeholder;
    }
    if(skillVal.value == null || skillVal.value === ""){
    	skillVal.value = document.querySelector('#skills').value;
    }
    if(stdCont.value == null || stdCont.value === ""){
        stdCont.value = document.querySelector('#stdCont').placeholder;
    }
    
    document.querySelector('#studyUpdateForm').submit();
});

</script>

<%@include file="/includes/footer.jsp" %>
