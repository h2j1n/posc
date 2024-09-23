<%@page import="ad.vo.AdVO"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="main.vo.MainNewVO"%>
<%@page import="main.vo.MainHotVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="/includes/header_unLogin.jsp" %>


<!-- 광고 슬라이더 start -->
<div class="container-fluid py-5 mb-5 hero-header">
    <div class="ad-carousel owl-carousel owl-theme">
        <%
        List<AdVO> adList = (List<AdVO>) request.getAttribute("adList");
        for (AdVO ad : adList) {
            String imagePath = request.getContextPath() + "/uploads/" + ad.getAd_file();
        %>
        <div class="ad-slide-item">
            <img src="<%= imagePath %>" alt="<%= ad.getAd_title() %>">
        </div>
        <% } %>
    </div>
</div>
<!-- 광고 슬라이더 end -->




<!-- 실시간 인기글 Start-->


<div class="container-fluid vesitable py-5">
    <div class="container py-5">
        <h1 class="mb-0">실시간 인기글</h1>
        
        <div class="owl-carousel vegetable-carousel justify-content-center">
        
<%
List<MainHotVO> hotList = (List<MainHotVO>)request.getAttribute("hotList");

for(int i=0; i<6; i++){
%>

<div class="border border-primary rounded position-relative vesitable-item" style="padding:10%; " id="<%=hotList.get(i).getGsu_no()%>" onclick="toHot(event)">

      <div class="top" style="display:flex; justify-content: space-between">
         <div class="Study_or_Pro">
         <%
            if(hotList.get(i).getGsu_gubun().equals("0")){
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
         
         
         <div class="New_or_Hot px-3 py-1 rounded position-absolute "
						style="
						
						margin-left: 180px;
						border-radius: 20px;
								    background-color: #FFB4B4;
								    font-weight: bold;
								    color: #ff0505;
								    padding-left: 15px;
								    padding-right: 15px;
								    padding-top: 3px;
								    padding-bottom: 3px;"
						
						>HOT</div>
      </div>
      <hr>
      <div class="middle" style="max-height:120px">
         <div class="end_date">
            <p class="end_date_text" style="font-weight: bold;">마감일 | <%=(hotList.get(i).getGsu_end()).substring(0,10) %></p>
         </div>
         <div class="title p-4 rounded-bottom">
            <p class="title_text text-dark fs-5 fw-bold mb-0"><%=hotList.get(i).getGsu_title() %></p>
         </div>
         <div class="skill"></div>
         <div class="skill_img"></div>
      </div>
       <hr>
       
      <div class="bottom" style="display:flex; justify-content: space-between;">
         <div class="bottom_left" style="display:flex; justify-content: space-between">
            <div class="user_img"><i class="bi bi-person-circle" style="margin-right:6px;"></i></div>
            <div class="user_id">
               <p class="user_id_text" style="font-weight: bold;"><%=hotList.get(i).getUser_id() %></p>
            </div>
         </div>
         <div class="bottom_right" style="display:flex; justify-content: space-around">
            <div class="hit">
               <img src=""><p class="hit_text" style="font-weight: bold;"><i class="bi bi-eye" style="margin-right:6px"></i><%=hotList.get(i).getGsu_hit() %></p>
            </div>
         </div>
      </div>
</div>
            
   
<%
}
%>
    
        </div>
        
    </div>
</div>

<!-- 실시간 인기글 END -->

<!-- 스터디 리스트-->
<div class="container-fluid fruite py-5">
    <div class="container py-5">
        <div class="tab-class text-center">
            <div class="row g-4">
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
int pageSize = 8; // 한 페이지에 보여질 게시물 수
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
         <div class="New_or_Hot" style="
								    border-radius: 20px;
								    background-color: #FFB4B4;
								    font-weight: bold;
								    color: #ff0505;
								    padding-left: 15px;
								    padding-right: 15px;
								    padding-top: 3px;
								    padding-bottom: 3px;"
          >HOT</div>
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
	            <img src=""><p class="hit_text" style="font-weight: bold;"><i class="bi bi-eye"style="margin-right: 4px; "></i><%= newList.get(i).getStd_hit()%></p>
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
    <% if (currentPage > 1) { %>
        <a href="/unLoginMain.do?page=<%= currentPage - 1 %>" title="이전 페이지">&lt;</a>
    <% } else { %>
        <a href="#" class="disabled">&lt;</a>
    <% } %>
    
    <% for (int pageNum = 1; pageNum <= totalPages; pageNum++) { %>
        <%
            String activeClass = (pageNum == currentPage) ? "active" : "";
        %>
        <a href="/unLoginMain.do?page=<%= pageNum %>" class="<%= activeClass %>"><%= pageNum %></a>
    <% } %>
    
    <% if (currentPage < totalPages) { %>
        <a href="/unLoginMain.do?page=<%= currentPage + 1 %>" title="다음 페이지">&gt;</a>
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
<script>

function toHot(event){
	let link = event.currentTarget.id;
	location.href = "/getStudyDetail.do?gsu_no="+link;
}

function toDetail(event){
	
// 	location.href = "/studyDetail.do?no="+this.id;
	let link = event.currentTarget.id;
	location.href = "/studyDetail.do?no="+link;
			
}

</script>
<!-- Fruits Shop End-->

<!-- 광고 스크립트 -->
<script>
$(document).ready(function(){
    $('.ad-carousel').owlCarousel({
        items: 1, // 한 번에 한 개의 광고만 보이도록 설정
        loop: true, // 무한 루프
        margin: 10,
        autoplay: true, // 자동 재생 설정
        autoplayTimeout: 2000, // 자동 재생 간격 (3초)
        autoplayHoverPause: true, // 마우스 호버 시 자동 재생 일시 정지
        responsive:{
            0:{
                items:1
            },
            600:{
                items:1
            },
            1000:{
                items:1
            }
        }
    });
});
</script>
<!-- 광고 스크립트 끝 -->


<%@include file="/includes/footer.jsp" %>
 