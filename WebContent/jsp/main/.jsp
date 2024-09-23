<%@page import="main.vo.MainNewVO"%>
<%@page import="main.vo.MainHotVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="/includes/header_unLogin.jsp" %>

<!-- 광고 Start -->
<div class="container-fluid py-5 mb-5 hero-header">
    <div class="container py-5">
        <div class="row g-5 align-items-center">
            <div class="col-md-12 col-lg-7">
                <h4 class="mb-3 text-secondary">100% Organic Foods</h4>
                <h1 class="mb-5 display-3 text-primary">Organic Veggies & Fruits Foods</h1>
            </div>

        </div>
    </div>
</div>
<!-- 광고 End -->


<!-- 실시간 인기글 Start-->


<div class="container-fluid vesitable py-5">
    <div class="container py-5">
        <h1 class="mb-0">실시간 인기글</h1>
        
        <div class="owl-carousel vegetable-carousel justify-content-center">
        
<%
List<MainHotVO> hotList = (List<MainHotVO>)request.getAttribute("hotList");

for(int i=0; i<6; i++){
%>

<div class="border border-primary rounded position-relative vesitable-item" style="padding:10%">

      <div class="top" style="display:flex; justify-content: space-between">
         <div class="Study_or_Pro">
         <%
            if(hotList.get(i).getGsu_gubun().equals("0")){
         %>
               스터디
         <%
            }else{
         %>
               프로젝트               
         <%
            }
         %>
         </div>
         <div class="New_or_Hot">HOT</div>
         <div class="Fill_or_Empty"><img src="/img/heart_empty.png"><img src="/img/heart_fill.png" style="display:none"></div>
      </div>
      <hr>
      <div class="middle" style="max-height:120px">
         <div class="end_date">
            <p class="end_date_text">마김일 | <%=(hotList.get(i).getGsu_end()).substring(0,10) %></p>
         </div>
         <div class="title p-4 rounded-bottom">
            <p class="title_text text-dark fs-5 fw-bold mb-0"><%=hotList.get(i).getGsu_title() %></p>
         </div>
         <div class="skill"></div>
         <div class="skill_img"></div>
      </div>
       <hr>
      <div class="bottom" style="display:flex; justify-content: space-around;">
         <div class="bottom_left" style="display:flex; justify-content: space-around">
            <div class="user_img"><i class="bi bi-person-circle"></i></div>
            <div class="user_id">
               <p class="user_id_text">userId</p>
            </div>
         </div>
         <div class="bottom_right" style="display:flex; justify-content: space-around">
            <div class="hit">
               <img src=""><p class="hit_text"><i class="bi bi-eye"></i><%=hotList.get(i).getGsu_hit() %></p>
            </div>
            <div class="comment_cnt">
               <img src=""><p class=""><i class="bi bi-chat-right-text"></i>댓글수</p>
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


<script>



</script>




<!-- 실시간 인기글 END -->




<!-- Fruits Shop Start-->
<div class="container-fluid fruite py-5">
    <div class="container py-5">
        <div class="tab-class text-center">
            <div class="row g-4">
                <div class="col-lg-4 text-start">
                    <h1>신규 모집글</h1>
                </div>
                <div class="col-lg-8 text-end">
                    <ul class="nav nav-pills d-inline-flex text-center mb-5">
                        <li class="nav-item">
                            <a class="d-flex m-2 py-2 bg-light rounded-pill active" data-bs-toggle="pill" href="#tab-1" id="whole">
                                <span class="text-dark" style="width: 130px;">전체</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="d-flex py-2 m-2 bg-light rounded-pill" data-bs-toggle="pill" href="#tab-2" id="project">
                                <span class="text-dark" style="width: 130px;">프로젝트</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="d-flex m-2 py-2 bg-light rounded-pill" data-bs-toggle="pill" href="#tab-3" id="study">
                                <span class="text-dark" style="width: 130px;">스터디</span>
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
List<MainNewVO> newProList = (List<MainNewVO>)request.getAttribute("newProList");
List<MainNewVO> newStdList = (List<MainNewVO>)request.getAttribute("newStdList");
%>
<%
for(int i=0; i<8; i++){
%>

<div class="col-md-6 col-lg-4 col-xl-3">
    <div class="rounded position-relative fruite-item" style="padding:10%; border:1px solid #FFC452">

      <div class="top" style="display:flex; justify-content: space-between">
         <div class="Study_or_Pro">
         <%
            if(newList.get(i).getGsu_gubun().equals("0")){
         %>
               스터디
         <%
            }else{
         %>
               프로젝트               
         <%
            }
         %>
         </div>
         <div class="New_or_Hot">HOT</div>
         <div class="Fill_or_Empty"><img src="/img/heart_empty.png"><img src="/img/heart_fill.png" style="display:none"></div>
      </div>
      <hr>
      <div class="middle" style="max-height:120px">
         <div class="end_date">
            <p class="end_date_text" style="text-align:left">마김일 | <%=(newList.get(i).getGsu_end()).substring(0,10) %></p>
         </div>
         <div class="title p-4 rounded-bottom">
            <p class="title_text text-dark fs-5 fw-bold mb-0" style="text-align:left"><%=newList.get(i).getGsu_title() %></p>
         </div>
         <div class="skill"></div>
         <div class="skill_img"></div>
      </div>
       <hr>
      <div class="bottom" style="display:flex; justify-content: space-around;">
         <div class="bottom_left" style="display:flex; justify-content: space-around">
            <div class="user_img"><i class="bi bi-person-circle"></i></div>
            <div class="user_id">
               <p class="user_id_text">userId</p>
            </div>
         </div>
         <div class="bottom_right" style="display:flex; justify-content: space-around">
            <div class="hit">
               <img src=""><p class="hit_text"><i class="bi bi-eye"></i><%=newList.get(i).getGsu_hit() %></p>
            </div>
            <div class="comment_cnt">
               <img src=""><p class=""><i class="bi bi-chat-right-text"></i>댓글수</p>
            </div>
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
                </div>
            </div>
        </div>
    </div>
</div>
<script>
let newStudyArea = document.querySelector('#newStudyArea');
document.querySelector('#whole').addEventListener('click', function(){
   $.ajax({
      type:"post",
      url:"/unLoginMain.do",
      dataType:"json",
      data:"key=whole",
      success:function(rst){
         console.log(rst[0].gsu_end.substr(0, 10))
         newStudyArea.innerHTML = "";
         for(let i=0; i<8; i++){
            let std_or_pro = "";
            if(rst[i].gsu_gubun=='0'){
               std_or_pro = `스터디`;
               }else{
                  std_or_pro = `프로젝트`;               
               }
         newStudyArea.insertAdjacentHTML('beforeend', 
         `<div class="col-md-6 col-lg-4 col-xl-3">
            <div class="rounded position-relative fruite-item" style="padding:10%; border:1px solid #FFC452">
               <div class="top" style="display:flex; justify-content: space-between">
                  <div class="Study_or_Pro">
                     \${std_or_pro}
                  </div>
                  <div class="New_or_Hot">HOT</div>
                  <div class="Fill_or_Empty"><img src="/img/heart_empty.png"><img src="/img/heart_fill.png" style="display:none"></div>
               </div>
               <hr>
               <div class="middle" style="max-height:120px">
                  <div class="end_date">
                     <p class="end_date_text" style="text-align:left">마감일 | \${rst[i].gsu_end.substr(0, 10)}</p>
                  </div>
                  <div class="title p-4 rounded-bottom">
                     <p class="title_text text-dark fs-5 fw-bold mb-0" style="text-align:left">\${rst[i].gsu_title}</p>
                  </div>
                  <div class="skill"></div>
                  <div class="skill_img"></div>
               </div>
                <hr>
               <div class="bottom" style="display:flex; justify-content: space-around;">
                  <div class="bottom_left" style="display:flex; justify-content: space-around">
                     <div class="user_img"><i class="bi bi-person-circle"></i></div>
                     <div class="user_id">
                        <p class="user_id_text">userId</p>
                     </div>
                  </div>
                  <div class="bottom_right" style="display:flex; justify-content: space-around">
                     <div class="hit">
                        <img src=""><p class="hit_text"><i class="bi bi-eye"></i>\${rst[i].gsu_hit}</p>
                     </div>
                     <div class="comment_cnt">
                        <img src=""><p class=""><i class="bi bi-chat-right-text"></i>댓글수</p>
                     </div>
                  </div>
               </div>
             </div>
           </div>`)
         }
      },
       error: function (x, status, error) {
         alert(error);
      }
   });
});
document.querySelector('#project').addEventListener('click', function(){
   $.ajax({
      type:"post",
      url:"/unLoginMain.do",
      dataType:"json",
      data:"key=project",
      success:function(rst){
         console.log(rst[0].gsu_end.substr(0, 10))
         newStudyArea.innerHTML = "";
         for(let i=0; i<8; i++){
            let std_or_pro = "";
            if(rst[i].gsu_gubun=='0'){
               std_or_pro = `스터디`;
               }else{
                  std_or_pro = `프로젝트`;               
               }
         newStudyArea.insertAdjacentHTML('beforeend', 
         `<div class="col-md-6 col-lg-4 col-xl-3">
            <div class="rounded position-relative fruite-item" style="padding:10%; border:1px solid #FFC452">
               <div class="top" style="display:flex; justify-content: space-between">
                  <div class="Study_or_Pro">
                     \${std_or_pro}
                  </div>
                  <div class="New_or_Hot">HOT</div>
                  <div class="Fill_or_Empty"><img src="/img/heart_empty.png"><img src="/img/heart_fill.png" style="display:none"></div>
               </div>
               <hr>
               <div class="middle" style="max-height:120px">
                  <div class="end_date">
                     <p class="end_date_text" style="text-align:left">마감일 | \${rst[i].gsu_end.substr(0, 10)}</p>
                  </div>
                  <div class="title p-4 rounded-bottom">
                     <p class="title_text text-dark fs-5 fw-bold mb-0" style="text-align:left">\${rst[i].gsu_title}</p>
                  </div>
                  <div class="skill"></div>
                  <div class="skill_img"></div>
               </div>
                <hr>
               <div class="bottom" style="display:flex; justify-content: space-around;">
                  <div class="bottom_left" style="display:flex; justify-content: space-around">
                     <div class="user_img"><i class="bi bi-person-circle"></i></div>
                     <div class="user_id">
                        <p class="user_id_text">userId</p>
                     </div>
                  </div>
                  <div class="bottom_right" style="display:flex; justify-content: space-around">
                     <div class="hit">
                        <img src=""><p class="hit_text"><i class="bi bi-eye"></i>\${rst[i].gsu_hit}</p>
                     </div>
                     <div class="comment_cnt">
                        <img src=""><p class=""><i class="bi bi-chat-right-text"></i>댓글수</p>
                     </div>
                  </div>
               </div>
             </div>
           </div>`)
         }
      },
       error: function (x, status, error) {
         alert(error);
      }
   });
});
document.querySelector('#study').addEventListener('click', function(){
   $.ajax({
      type:"post",
      url:"/unLoginMain.do",
      dataType:"json",
      data:"key=study",
      success:function(rst){
         console.log(rst[0].gsu_end.substr(0, 10))
         newStudyArea.innerHTML = "";
         for(let i=0; i<8; i++){
            let std_or_pro = "";
            if(rst[i].gsu_gubun=='0'){
               std_or_pro = `스터디`;
               }else{
                  std_or_pro = `프로젝트`;               
               }
         newStudyArea.insertAdjacentHTML('beforeend', 
         `<div class="col-md-6 col-lg-4 col-xl-3">
            <div class="rounded position-relative fruite-item" style="padding:10%; border:1px solid #FFC452">
               <div class="top" style="display:flex; justify-content: space-between">
                  <div class="Study_or_Pro">
                     \${std_or_pro}
                  </div>
                  <div class="New_or_Hot">HOT</div>
                  <div class="Fill_or_Empty"><img src="/img/heart_empty.png"><img src="/img/heart_fill.png" style="display:none"></div>
               </div>
               <hr>
               <div class="middle" style="max-height:120px">
                  <div class="end_date">
                     <p class="end_date_text" style="text-align:left">마감일 | \${rst[i].gsu_end.substr(0, 10)}</p>
                  </div>
                  <div class="title p-4 rounded-bottom">
                     <p class="title_text text-dark fs-5 fw-bold mb-0" style="text-align:left">\${rst[i].gsu_title}</p>
                  </div>
                  <div class="skill"></div>
                  <div class="skill_img"></div>
               </div>
                <hr>
               <div class="bottom" style="display:flex; justify-content: space-around;">
                  <div class="bottom_left" style="display:flex; justify-content: space-around">
                     <div class="user_img"><i class="bi bi-person-circle"></i></div>
                     <div class="user_id">
                        <p class="user_id_text">userId</p>
                     </div>
                  </div>
                  <div class="bottom_right" style="display:flex; justify-content: space-around">
                     <div class="hit">
                        <img src=""><p class="hit_text"><i class="bi bi-eye"></i>\${rst[i].gsu_hit}</p>
                     </div>
                     <div class="comment_cnt">
                        <img src=""><p class=""><i class="bi bi-chat-right-text"></i>댓글수</p>
                     </div>
                  </div>
               </div>
             </div>
           </div>`)
         }
      },
       error: function (x, status, error) {
         alert(error);
      }
   });
});
</script>
<!-- Fruits Shop End-->

<%@include file="/includes/footer.jsp" %>
 