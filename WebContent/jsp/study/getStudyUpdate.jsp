<%@page import="get_study_user.vo.SkillVO"%>
<%@page import="get_study_user.vo.GetStudyListVO"%>
<%@page import="get_study_user.vo.GetStudyUserVO"%>
<%@page import="main.vo.MainHotVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page info="copyright by MIS"%>    
    
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


<style>
.dummy{
	margin-top: 130px;
}
</style>

<div class="dummy"></div>

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
            <h1 class="text-center text-white display-6">팀원 모집</h1>
            <ol class="breadcrumb justify-content-center mb-0">
                <li class="breadcrumb-item active text-white"><a href="#">스터디</a></li>
                <li class="breadcrumb-item active text-white"><a href="/getStudy.do">스터디모집</a></li>
                <li class="breadcrumb-item active text-white">팀원 모집</li>
            </ol>
        </div>
        <!-- Single Page Header End -->


        <!-- Contact Start -->
        <div class="container-fluid contact py-5">
            <div class="container py-5">
                <div class="p-5 bg-light rounded">
                    <div class="row g-4">
                        <div class="col-12">
                            <div class="text-center mx-auto" style="max-width: 700px;" >
                                <h1 class="text-primary">모집글 변경</h1>
                                <p class="mb-4">👉🏻기본 정보를 입력해주세요</p>
                            </div>
                        </div>
                        <div class="col-lg-12">
                           
                         <%
   						GetStudyUserVO gsuVO = (GetStudyUserVO) request.getAttribute("gsuVO");
   						%> 
    
                           
                        </div>
				<div class="col-lg-6">
					<form action="/getStudyUpdate.do" method="post" id="getStudyUpdateForm">
					
						<input type="hidden" value="<%=gsuVO.getGsu_no() %>" name="gsu_no">
						
						
						<p>모집구분</p>
						<select class="w-100 form-control border-0 py-3 mb-4 bg-white" id="addType" name="addType" value="<%=gsuVO.getGsu_gubun() %>">
							<option value="study">스터디</option>
							<option value="project">프로젝트</option>
						</select> 
						
						<p>진행기간</p>
						<input type="text" class="w-100 form-control border-0 py-3 mb-4 bg-white" placeholder="ex)6개월" id="date" name="date" value="<%=gsuVO.getGsu_period() %>">

						<%
                           List<SkillVO> skillsList = (List<SkillVO>) request.getAttribute("skillsList"); 
						
                        %>
                        
						<p>기술 스택</p>
						<select class="w-100 form-control border-0 py-3 mb-4 bg-white" id="skillSelect" name="skillSelect" value="<%=gsuVO.getGsu_skills()%>">
							<% 
							for (int i =0; i<skillsList.size(); i++) {
							%>
							<option value="<%=skillsList.get(i).getSgdt_Name() %>"><%=skillsList.get(i).getSgdt_Name() %></option>
							<%
								}
							%>
							
						</select>

					
				</div>


				<div class="col-lg-6">
					
						<p>모집인원</p>
						<input type="number" class="w-100 form-control border-0 py-3 mb-4" placeholder="모집인원" id="recruitment" name="recruitment" value = "<%=gsuVO.getGsu_memcnt() %>">
						
						<p>모집 마감일</p>
						<input type="date" class="w-100 form-control border-0 py-3 mb-4" placeholder="모집 마감일" id="endDate" name="endDate" value = "<%=gsuVO.getGsu_end().substring(0, 10) %>" >
					
						 <p>스터디 선택 (수정불가)</p>
						<input class="w-100 form-control border-0 py-3 mb-4 " style="background-color: #80808038;" id="studySelect" name="studySelect" value = "<%=gsuVO.getGsu_stdname()%>" readonly="readonly"/>							
					 
						
				</div>
				<p class="mb-4 text-center mx-auto" style="max-width: 700px;">👉🏻소개를 입력해주세요</p>
                        <textarea class="w-100 form-control border-0 mb-4"  style="white-space:pre;" rows="3" cols="10" placeholder="제목 작성" id="title" name= "title" ><%=gsuVO.getGsu_title() %></textarea>
                        <textarea class="w-100 form-control border-0 mb-4"  style="white-space:pre;" rows="40" cols="10" placeholder="상세글 작성" id="content" name= "content" ><%=gsuVO.getGsu_content() %></textarea>
                       
                       
                        <button class="w-100 btn form-control border-secondary py-3 bg-white text-primary " id="updateBtn">변경</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- Contact End -->
   
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
 <script type="text/javascript">
 
 	 $(function(){
 		var updateBtn = $("#updateBtn");
 		
 		updateBtn.on("click",function(){
 			
			var addType = $('#addType').val(); 				//모집구분
			var date = $('#date').val(); 					//진행기간	
			var skillSelect = $('#skillSelect').val(); 		//기술스택
			var recruitment = $('#recruitment').val(); 		//모집인원
			var wayProcedding = $('#wayProcedding').val(); 	//진행방식
			var content = $('#content').val(); 				//상세내용
			var endDate = $('#endDate').val(); 				//마감일자
			var title = $('#title').val(); 				//마감일자
			var studySelect = $("#studySelect");
			
			var updateForm = $("#getStudyUpdateForm");
			
			
 			
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
			
			alert("수정 완료");
			
			
			updateForm.submit();
			
 		})
 	}); 
 		
 
 
 </script>
   

<%@include file="/includes/footer.jsp" %>

