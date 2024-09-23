<%@page import="get_study_user.vo.ApplyVO"%>


<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<style>
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

.HW_Table {
	border: 1px #a39485 solid;
	font-size: .9em;
	box-shadow: 0px 0px 14px 4px #4c3f8121;
	width: 100%;
	border-collapse: collapse;
	border-radius: 5px;
	overflow: hidden;
	text-align: center;
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

.HW_Table.td, th {
	padding: 1em .5em;
	vertical-align: middle;
}

.HW_Table.td {
	border-bottom: 1px solid rgba(0, 0, 0, .1);
	background: #fff;

}
.HW_Table td {
		padding: 30px 0;

}

.HW_Table.thead {
	font-weight: bold;
	color: #fff;
	background: #73685d;
	border-bottom: 2px solid;
}

.addApplyBtn {
	background-color: cornflowerblue;
	border: 2px solid white;
	border-radius: 15px;
	padding: 5px 15px;
}

.deleteApplyBtn {
	background-color: crimson;
	border: 2px solid white;
	border-radius: 15px;
	padding: 5px 15px;
}

.btnText {
	color: white;
}

</style>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>

<!-- 로그인 -->
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

<%
	// 회원 신청 리스트 가져오기 
//       List<ApplyVO> aplVO = (List<ApplyVO>) request.getAttribute("aplVO");

// 게시글 번호를 가져옴
/*  int aplNo = 0;
 if (aplVO != null) {
 	aplNo = aplVO.
 } */
%>

<div style="height: 150px;"></div>




<div class="container" style="min-height: 75vh;">
	<%
		List<ApplyVO> applyList = (List<ApplyVO>) request.getAttribute("aplVO");
		int getNum = 0;
	%>

	<div class="h1title" style="text-align: center;">
		<h2 class="mb-5 mt-5">👉🏻 팀원 모집 신청 리스트</h2>
	</div>

	<!-- 삭제, 추가 버튼 -->
	<div class="ad-button-container "
		style="display: flex; justify-content: flex-end;">
		<button class="ad-button approve" id="delBtn "
			style="width: 50px; height: 50px; border-radius: 20px; background-color: #fd2424ed; color: azure; margin-right: 5px;">
			<i class="fas fa-trash-alt"></i>
		</button>
		<button class="ad-button delete" id="addBtn"
			style="width: 50px; height: 50px; border-radius: 20px; background-color: #ffc920; color: azure;">
			<i class="fas fa-check" id="addBtn"></i>
		</button>
	</div>



	<div class="col-md-12 HHWflex">
		<div class="sdflex">
			<div class="side-ab quickmenu"
				style="position: absolute; width: 10%; top: 35%;">

				<div class="side-menu " style="align-content: center;">
					<ul>
						<li><a href="/getStudy.do">모집글 목록</a></li>
						<li><a href="/studyMain.do">스터디 목록</a></li>
						<li><a href="/mypagemain.do">캘린더</a></li>
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



			<div class="table_wrapper"
				style="display: contents; margin: 40px 0px;">
				<table class="HW_Table">
					<colgroup>
						<col style="width: 10%">
						<col style="width: 10%">
						<col style="width: 15%">
						<col>
						<col >
						<col style="width: 10%">
					</colgroup>

					<thead class="table_head" style="    font-size: x-large;">
						<tr style="border-bottom: 2px solid lavender;">
							<th>선택</th>
							<th>모집글</th>
							<th>회원명</th>
							<th>이메일</th>
							<th>연락처</th>
							<th>경고수</th>
						</tr>
					</thead>
					
					<tbody class="table_body" id="tbody">

						<%
							if (applyList.isEmpty() || applyList == null) {
						%>

						<th style="text-align: center; font-size: xx-large;" colspan="6"> 신청 회원이 없습니다.</th>

				
				<%
					} else{	
								
						for (int i = 0; i < applyList.size(); i++) {
							getNum = i;
				%>
				<tr style="    font-size: x-large;">
					<td class="ad-checkbox-cell">
                    <input type="checkbox" class="adCheckbox" value="<%=applyList.get(i).getAp_no()%>">
                	</td>
					<td class="gsu_no"><a
						href="/getStudyDetail.do?gsu_no=<%=applyList.get(i).getGsu_no()%>"><%=applyList.get(i).getGsu_no()%></a></td>
					<td id="user_name"><%=applyList.get(i).getUser_name()%></td>
					<td id="user_email"><%=applyList.get(i).getUser_email()%></td>
					<td id="user_tel"><%=applyList.get(i).getUser_tel()%></td>
					<td id="rep_cnt"><%=applyList.get(i).getUser_rep_cnt()%></td>

					
				</tr>

				<%
					
				}
				%>

				<%
					}
				%>
				</tbody>
				</table>
				<form id="addForm" method="post" action="/applyStudyList.do"></form>
				<form id="delForm" method="post" action="/applyStudyList.do"></form>
			</div>

		</div>
	</div>
</div>

<script> 
// 삭제 눌렀을 경우
    
    $(function(){
    	var delBtn = $("#delBtn");
    	var delForm = $("#delForm");
    	
    	delBtn.on("click", function(){
    		var chkEle = $("#tbody").find(".adCheckbox");
   			var html = "";
    		chkEle.each(function(index, ele){
    			if($(ele).is(":checked")){
	    			html += "<input type='hidden' name='delChkApNo' value='"+ele.value+"'/>";
    			}
    		});
    		delForm.html(html);
    		delForm.submit();
    	});
    });
</script>

<script>
//승인 눌렀을 경우
     
    $(function(){
    	var addBtn = $("#addBtn");
    	var addForm = $("#addForm");
    	
    	addBtn.on("click", function(){
    		var chkEle = $("#tbody").find(".adCheckbox");
   			var html = "";
    		chkEle.each(function(index, ele){
    			if($(ele).is(":checked")){
	    			html += "<input type='hidden' name='addChkApNo' value='"+ele.value+"'/>";
    			}
    		});
    		addForm.html(html);
    		addForm.submit();
    	});
    });
</script>





<%@include file="/includes/footer.jsp"%>
