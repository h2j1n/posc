<%@page import="get_study_user.vo.SkillVO"%>
<%@page import="get_study_user.vo.GetStudyListVO"%>
<%@page import="main.vo.MainHotVO"%>
<%@page import="java.util.List"%>
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
            <h1 class="text-center text-white display-6">팀원 모집하기</h1>
        </div>
        <!-- Single Page Header End -->


        <!-- Contact Start -->
        <div class="container-fluid contact py-5">
            <div class="container py-5">
                <div class="p-5 bg-light rounded">
                    <div class="row g-4">
                        <div class="col-12">
                            <div class="text-center mx-auto" style="max-width: 700px;" >
                                <h1 class="text-primary">모집글 작성</h1>
                                <p class="mb-4">👉🏻기본 정보를 입력해주세요</p>
                            </div>
                        </div>
                        <div class="col-lg-12">
                           
                        </div>
				<div class="col-lg-6">
					<form action="/team.do" method="post" id="getStudyInsertForm">

						<p>모집구분</p>
						<select class="w-100 form-control border-0 py-3 mb-4 bg-white" id="addType" name="addType" >
							<option value="">스터디/프로젝트</option>	
							<option value="study">스터디</option>
							<option value="project">프로젝트</option>
						</select> 
						
						<p>진행기간</p>
						<input type="text" class="w-100 form-control border-0 py-3 mb-4 bg-white" placeholder="ex)6개월" id="date" name="date">

						<%
                           List<SkillVO> skillList = (List<SkillVO>) request.getAttribute("skillList"); 
                        %>
                        
						<p>기술 스택</p>
						<select class="w-100 form-control border-0 py-3 mb-4 bg-white" id="skillSelect" name="skillSelect">
							<option value = "">눌러서 선택</option>
							<% 
							for (SkillVO sk : skillList) {
							%>
							<option value="<%=sk.getSgdt_Name() %>"><%=sk.getSgdt_Name() %></option>
							<%
								}
							%>
							
						</select>

					
				</div>


				<div class="col-lg-6">
					
						<p>모집인원</p>
						<input type="number" class="w-100 form-control border-0 py-3 mb-4" placeholder="모집인원" id="recruitment" name="recruitment">
						
						
						<p>모집 마감일</p>
						<input type="date" class="w-100 form-control border-0 py-3 mb-4" placeholder="모집 마감일" id="endDate" name="endDate" >
					
						 <p>스터디 선택</p>
						<select class="w-100 form-control border-0 py-3 mb-4 bg-white"  id="studySelect" name="studySelect">							
					 	<option value = "">눌러서 선택</option>
					 	<%
                           List<GetStudyListVO> studyList = (List<GetStudyListVO>) request.getAttribute("getStudyList"); 
                        %> 
						<%
								for (GetStudyListVO sl : studyList) {
							%>
							<option value="<%=sl.getStd_name() %>"><%=sl.getStd_name() %></option>
							<%
								}
							%>
							
						</select> 
						
				</div>

				
				<p class="mb-4 text-center mx-auto" style="max-width: 700px;">👉🏻소개를 입력해주세요</p>
                        <textarea class="w-100 form-control border-0 mb-4" rows="5" cols="10" placeholder="제목 작성" id="title" name= "title"></textarea>
                        <textarea class="w-100 form-control border-0 mb-4" rows="5" cols="10" placeholder="상세글 작성" id="content" name= "content"></textarea>
                       
                       
                        <button class="w-100 btn form-control border-secondary py-3 bg-white text-primary " type="submit" id="addBtn">등록</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- Contact End -->
   
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
 <script type="text/javascript">
 
 	 $(function(){
 		var addBtn = $("#addBtn");
 		
 		addBtn.on("click",function(){
 			
			var addType = $('#addType').val(); 				//모집구분
			var date = $('#date').val(); 					//진행기간	
			var skillSelect = $('#skillSelect').val(); 		//기술스택
			var recruitment = $('#recruitment').val(); 		//모집인원
			var wayProcedding = $('#wayProcedding').val(); 	//진행방식
			var content = $('#content').val(); 				//상세내용
			var endDate = $('#endDate').val(); 				//마감일자
			var title = $('#title').val(); 				//마감일자
			var insertForm = $("#getStudyInsertForm");
			var studySelect = $("#studySelect");
			
			
 			
			if (addType == null || addType == "") {
				alert("모집구분 미선택");
				return false;
			}
			if (date == null || date == "") {
				alert("진행기간 미선택");
				return false;
			}
			if (skillSelect == null || skillSelect == "") {
				alert("기술스택 미선택");
				return false;
			}
			if (recruitment == null || recruitment == "") {
				alert("모집인원 미입력");
				return false;
			}
			
			if (content == null || content == "") {
				alert("상세내용 미입력");
				return false;
			}
			if (endDate == null || endDate == "") {
				alert("마감일자 미선택");
				return false;
			}
			if (endDate == null || endDate == "") {
				alert("스터디 미선택");
				return false;
			}
			
			alert("입력 완료");
			
			
			insertForm.submit();
			
 		})
 	}); 
 		
 
 
 </script>
   

<%@include file="/includes/footer.jsp" %>

