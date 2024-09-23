<%@page import="get_study_user.vo.GetStudyUserVO"%>
<%@page import="get_study_user.vo.StudyMemberVO"%>
<%@page import="get_study_user.vo.ApplyVO"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />


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

<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<style>
.HHWflex {
   
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
   text-align: right;
   margin-top: 0;
   margin-right: 0;
   margin-bottom: 20px;
}

.HWcol {
   padding: 3px;
   display: flex;
   justify-content: flex-start;
   margin-right: 20px;
}

.sdflex {
   display: flex;
}

.side-menu.sticky {
   position: sticky;
   top: 10px;
}

.aside {
  position: sticky;
  top: 0;
}

.write_button10 .mine-btn {
	border: none;
    padding: 12px;
    font-size: 25px;
}
</style>

<div class="dummy"></div>

<div class="container mb-5 mt-5">
   <div class="row">
            <%
               GetStudyUserVO gsuVO = (GetStudyUserVO) request.getAttribute("gsuVO");
               List<StudyMemberVO> stdMemVO = (List<StudyMemberVO>) request.getAttribute("stdMemVO");
               
               %>

      <div class="col-md-12 HHWflex">
         <div class="sdflex" >
            <div class="side-ab quickmenu" style="position: absolute; width: 10%; top: 35%;">
            
               <div class="side-menu "
                  style="align-content: center;  ">
                  <ul>
                     <li><a href="/getStudy.do">모집글 목록</a></li>
                     <li><a href="/studyMain.do">스터디 목록</a></li>
<%--                      <li><a href="/studyDetail.do?no=<%=stdMemVO.get(0).getStd_no() %>">스터디상세보기</a></li> --%>
                     <li><a href="/mypagemain.do">캘린더</a></li>
                     <% if (gsuVO != null && userId != null && userId.equals(gsuVO.getUser_no())) { %>
                     <li><a href="/applyStudyList.do?gsu_no=<%=gsuVO.getGsu_no() %>">관리</a></li>
                     <% 
                        } 
                     %>
                  </ul>
               </div>
            </div>
            <div style="width: 20%"></div>


            <script>
            var currentPosition = parseInt($(".quickmenu").css("top"));
               $(window).scroll(function() {
                  var position = $(window).scrollTop();
                  $(".quickmenu").stop().animate({
                     "top" : position + currentPosition + "px"
                  }, 1000);
               });
            </script>

            <div style="width: 80%; margin: 0 20px;">

               <div class="h1title">
                  <hr class="mt-5 mb-5" style="border: 3px;">
                  <h1><%=gsuVO.getGsu_title()%></h1>
                  <hr class="mb-5 mt-5">
                  
               </div>

               <div class="">
                  <!-- 글 작성 버튼 -->
                  <div class="write_button10">
                     <%
                     if (userId != null) {
                        if (userId == gsuVO.getUser_no()) {
                     %>
                     <button id="updateBtn" class="postbtn mine-btn" style="border-radius: 20px; background-color: #ffb51c; color: azure;"><i class="fa-solid fa-pen-to-square"></i></button>
                     <button id="deleteBtn" class="postbtn2 mine-btn" style="border-radius: 20px; background-color: #fd2424ed; color: azure; "> <i class="fas fa-trash-alt"></i></button>
                     <%
                        } else if (!stdMemVO.contains(userId)) {   //processVO에도 명단이 없어야함.
                     %>
                     <button id="applyBtn" class="postbtn3">신청</button>
                     <%
                        }
                     }
                     %>

                  </div>
                  <div class="white_box3" id="whiteBox">
                     <div class="post_info">

                        <table class="hw_table">
                           <tr>
                              <th class="HWcol">모집구분</th>
                              <td><%=gsuVO.getGsu_gubun()%></td>
                           </tr>
                           <tr>
                              <th class="HWcol">진행기간</th>
                              <td><%=gsuVO.getGsu_period()%></td>
                           </tr>
                           <tr>
                              <th class="HWcol">모집 마감일</th>
                              <td><%=gsuVO.getGsu_end()%></td>
                           </tr>
                           <tr>
                              <th class="HWcol">기술 스택</th>
                              <td><%=gsuVO.getGsu_skills()%></td>
                           </tr>
                           <tr>
                              <th class="HWcol">모집 인원</th>
                              <td><%=gsuVO.getGsu_memcnt()%></td>
                           </tr>
                           <tr>
                              <th class="HWcol">스터디명</th>
                              <td><%=gsuVO.getGsu_stdname()%></td>
                           </tr>

                        </table>

                     </div>
                  </div>

                  <div class="post_content white_box3 mt-5" id="whiteBox">
                     <p>상세글<hr></p>
                     
                     <pre id="postContent" style="font-size: x-large; width: 100%"><%=gsuVO.getGsu_content()%></pre>
                  </div>
                  <br>
                  <div style="display: flex; justify-content: flex-end;"
                     style="display: flex; justify-content: flex-end;">
                     <img alt="조회수" src="/img/eye.png"
                        style="width: 30px; height: 30px;">
                     <p id="hit"><%=gsuVO.getGsu_hit() %>회
                     </p>
                     <p id="postDate">
                        		작성일자:<%=gsuVO.getGsu_start().substring(0, 10)%></p>
                  </div>
               </div>
            </div>

         </div>
      </div>
   </div>
</div>
</div>


<script type="text/javascript">
$(function(){
   var updateBtn = $("#updateBtn");
   var deleteBtn = $("#deleteBtn");
   var applyBtn = $("#applyBtn");
   
   //삭제 버튼 클릭시 잉벤트
   deleteBtn.on('click',function(){
      
      if(confirm("정말로 삭제하시겠습니까?"))
         location.href = "/getStudyDelete.do?gsu_no=<%=gsuVO.getGsu_no()%>";  
                  });
   
   //수정 버튼 클릭시 잉벤트
   updateBtn.on('click',function(){
      location.href="/getStudyUpdate.do?gsu_no=<%=gsuVO.getGsu_no()%>";
                  });
   
   //신청 버튼 클릭시 잉벤트
   applyBtn.on('click',function(){
      
       $.ajax({
          type:"post",
          url:"/getStudyDetail.do",
          dataType:"text",
          data:{
             "stdname":   "<%=gsuVO.getGsu_stdname()%>",
             "gsuNo": "<%=gsuVO.getGsu_no()%>"

          },
          success:function(res){
             console.log(res);
              alert('신청 완료');
          },
          error:function(request, status, error){
             console.log(error);
              alert('신청 실패');  
          }
       });
       
       
   });
});

</script>


<%@ include file="/includes/footer.jsp"%>