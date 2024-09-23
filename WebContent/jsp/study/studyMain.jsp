<%@page import="ad.vo.AdVO"%>
<%@page import="main.vo.MainNewVO"%>
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

<!-- 스터디 리스트-->
<div class="container-fluid fruite py-5">
    <div class="container py-5">
        <div class="tab-class text-center">
            <div class="row g-4"  style="margin-top:100px;">
                <div class="col-lg-4 text-start">
                    <h1>스터디</h1>
                    
                </div>
                <div class="col-lg-8 text-end">
                    <ul class="nav nav-pills d-inline-flex text-center mb-5">
                        <li class="nav-item">
                            <a class="d-flex m-2 py-2 bg-light rounded-pill active" data-bs-toggle="pill" href="#tab-1" id="whole">
                            </a>
                        </li>
                    </ul>
                    <%
                    if(userId!=null){
                    %>
                    <button type="button" onclick="insert()" 
                    style="border: none; background-color: #ffb524; border-radius: 10%; text-align: center; padding:10px; width: 100px;">등록하기</button>
                    <%
                    }
                    %>
                </div>
            </div>
            <div class="tab-content">
                <div id="tab-1" class="tab-pane fade show p-0 active">
                    <div class="row g-4">
                        <div class="col-lg-12">
                            <div class="row g-4" id="newStudyArea">

<%
List<MainNewVO> newList = (List<MainNewVO>)request.getAttribute("newList");

//paging 변수
int totalPages = (int) request.getAttribute("totalPages");
int pageSize = 12; // 한 페이지에 보여질 게시물 수
int currentPage = (int) request.getAttribute("currentPage");
%>
<%
for(int i=0; i<newList.size(); i++){
%>

<div id="<%=newList.get(i).getStd_no()%>" class="col-md-6 col-lg-4 col-xl-3" onclick="toDetail(event)">
    <div class="rounded position-relative fruite-item" style="padding:10%; border:2px solid #FFC452; border-radius: 20px">

      <div class="top" style="display:flex; justify-content: space-between">
         <div class="Study_or_Pro">
         <%
            if(newList.get(i).getGsu_gubun()==0){
         %>
                   <div class="New_or_Hot" style="
                  
								    border-radius: 20px;
								    background-color: #E9E7E7;
								    font-weight: bold;
								    color: #646464;
								    padding-left: 15px;
								    padding-right: 15px;
								    padding-top: 3px;
								    padding-bottom: 3px;"
          >📚 STUDY</div>           
         <%
            }else{
         %>
                  <div class="New_or_Hot" style="
								    border-radius: 20px;
								    background-color: #E9E7E7;
								    font-weight: bold;
								    color: #646464;
								    padding-left: 15px;
								    padding-right: 15px;
								    padding-top: 3px;
								    padding-bottom: 3px;"
          >💻  PROJECT</div>                  
         <%
            }
         %>
         </div>
         
         
      </div>
      <hr>
      <div class="middle" style="max-height:120px">
         <div class="end_date">
            <p class="end_date_text" style="text-align:left; font-weight: bold;">마감일 | <%=(newList.get(i).getStd_enddt().substring(0,10)) %></p>
         </div>
         <div class="title p-4 rounded-bottom">
            <p class="title_text text-dark fs-5 fw-bold mb-0" style="text-align:left"><%=newList.get(i).getStd_name() %></p>
         </div>
         <div class="skill"></div>
         <div class="skill_img"></div>
      </div>
       <hr>
      <div class="bottom" style="display:flex; justify-content: space-between; align-items: center;">
	    <div class="bottom_left" style="display:flex; align-items:center;">
	        <div class="user_img" style="display:flex; align-items:center; margin-top: 5px; margin-right: 4px"><i class="bi bi-person-circle"></i></div>
	        <div class="user_id" style="display:flex; align-items:center; margin-top: 21px; font-weight: bold;">
	            <p class="user_id_text"><%= newList.get(i).getUser_id() %></p>
	        </div>
	    </div>
	    <div class="bottom_right" style="display:flex; align-items:center;">
	        <div class="hit">
	            <img src=""><p class="hit_text" style="font-weight: bold;"><i class="bi bi-eye"style="margin-right: 4px; "></i><%= newList.get(i).getStd_hit() %></p>
	        </div>
	    </div>
	</div>

                                        
    </div>
</div>
<%
}
%>
                                
<!-- Page -->

<div class="pagination">
<!-- 이전 페이지로 이동 -->
    <% if (currentPage > 1) { %>
        <a href="/studyMain.do?page=<%= currentPage - 1 %>" title="이전 페이지">
            &lt;
        </a>
    <% } else { %>
        <a href="#" class="disabled">&lt;</a>
    <% } %>

<!-- 페이지 번호 표시 -->
    <% for (int pageNum = 1; pageNum <= totalPages; pageNum++) { %>
        <% if (pageNum == currentPage) { %>
            <a href="#" class="active"><%= pageNum %></a>
        <% } else { %>
            <a href="/studyMain.do?page=<%= pageNum %>"><%= pageNum %></a>
        <% } %>
    <% } %>

<!-- 다음 페이지로 이동 -->
    <% if (currentPage < totalPages) { %>
        <a href="/studyMain.do?page=<%= currentPage + 1 %>" title="다음 페이지">
            &gt;
        </a>
    <% } else { %>
        <a href="#" class="disabled">&gt;</a>
    <% } %>
</div>


                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Fruits Shop End-->
<script>
let newStudyArea = document.querySelector('#newStudyArea');

document.querySelector('#whole').addEventListener('click', function(){
   <%
      String whole = "whole";
      request.setAttribute("key", whole);
   %>
   
});
document.querySelector('#project').addEventListener('click', function(){
   <%
      String project = "project";
      request.setAttribute("key", project);   
   %>
});
document.querySelector('#study').addEventListener('click', function(){
   <%
      String study = "study";
      request.setAttribute("key", study);   
   %>
});

function insert(){
	location.href = "/insertStudy.do";
}


</script>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
<script>
function toDetail(event){
	
// 	location.href = "/studyDetail.do?no="+this.id;
	let link = event.currentTarget.id;
	location.href = "/studyDetail.do?no="+link;
			
}

</script>

<%@include file="/includes/footer.jsp" %>