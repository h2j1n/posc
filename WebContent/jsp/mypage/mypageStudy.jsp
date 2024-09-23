<%@page import="mypage.vo.UserStudyNoProInfo"%>
<%@page import="mypage.vo.UserStudyProInfo"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="mypage.vo.UserStudyInfo"%>
<%@page import="main.vo.MainNewVO"%>
<%@page import="java.util.List"%>
<%@page import="vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

	<%@include file="/includes/header_Login.jsp" %>

  	<%
		MemberVO memberVO = (MemberVO) request.getAttribute("memberVO");
		List<String> skillList = (List<String>) request.getAttribute("skills");
		List<UserStudyInfo> userStudyList = (List<UserStudyInfo>) request.getAttribute("studyInfoList"); // 유저가 참여한 스터디 정보
		List<UserStudyProInfo> userStudyProList = (List<UserStudyProInfo>) request.getAttribute("studyProList"); // 유저가 신청한 후, 처리된 스터디 정보
		List<UserStudyNoProInfo> userStudyNoProList = (List<UserStudyNoProInfo>) request.getAttribute("studyNoProList"); // 유저가 신청한후, 미처리된 스터디 정보
		
		// 신청취소 성공여부
		String applyMsg = session.getAttribute("msg") == null ? ""
				: (String) session.getAttribute("msg");
		
		session.removeAttribute("msg");
  	%>
  	
  	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

  	
  	<script>
  		<%
  			if(applyMsg.equals("성공")){
  		%>
	  		Swal.fire({
    	        icon: 'success',                         // Alert 타입
        	    title: '스터디 신청정보가 삭제되었습니다.',         // Alert 제목
            	text: '',  // Alert 내용
        	});

//   			alert("스터디 신청정보가 삭제되었습니다.");
  		<%
  			} else if(applyMsg.equals("실패")){
  		%>
	  		Swal.fire({
		        icon: 'error',                         // Alert 타입
	    	    title: '정상처리되지 않았습니다.',         // Alert 제목
	        	text: '',  // Alert 내용
	    	});
//   			alert("정상처리되지 않았습니다.");
  		<%
  			}
  		%>
  	</script>
  	
  	
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
			      <p class="skill__title">기술 스택</p>
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

<!-- 신청내역 -->
<div class="container-fluid fruite py-5">
	<div class="container py-5">
		<div class="tab-class text-center">
			<div class="row g-4">
			<hr>			
				<div class="col-lg-4 text-start mb-4">
					<h3>신청내역</h3>
				</div>
			</div>
			
			<div class="tab-content">
				<div id="tab-1" class="tab-pane fade show p-0 active">
					<div class="row g-4">
						<div class="col-lg-12">
							<div class="row g-4" id="newStudyArea">

								<%if(userStudyNoProList != null && userStudyNoProList.size() != 0){
									
								%>
								<%
								int i = 0;
								while(i < userStudyNoProList.size()){
									
									// 스터디 처리정보를 가져온다.
									UserStudyNoProInfo studyNoProInfo = userStudyNoProList.get(i);
									
									// 스터디 처리정보를 출력한다.
								%>

								<div class="col-md-6 col-lg-4 col-xl-3">
									<div class="rounded position-relative fruite-item"
										style="padding: 10%; border: 1px solid #FFC452">
										<div class="top"
											style="display: flex; justify-content: center">
											<div class="end_date">
												<a href="/getStudyDetail.do?gsu_no=<%=studyNoProInfo.getGsu_no() %>" class="fs-3 text-dark" style="text-align: left"
													>
													<%= studyNoProInfo.getStd_name()%> </a>
											</div>
										</div>
										<hr>
										<div class="middle" style="max-height: 120px">
											<div class="middle_detail">
												<p>스터디 구분 | <%= studyNoProInfo.getSgbn_name()%> / <%=studyNoProInfo.getSgdt_name() %></p>	
												<p>스터디 리더 | <i class="bi bi-person-circle"></i><%=studyNoProInfo.getLeader_id() %></p>
												<p>스터디 시작일 | <%=studyNoProInfo.getStd_strdt().substring(0,10) %></p>
											</div>
											<div class="title p-4 rounded-bottom">
												<p class="title_text text-dark fs-5 fw-bold mb-0"
													style="text-align: left"></p>
											</div>
											<div class="skill"></div>
											<div class="skill_img"></div>
										</div>
										<hr>
										<div class="bottom"
											style="display: flex; justify-content: space-around;">
											<div class="bottom_left"
												style="display: flex; justify-content: space-between;">
<!-- 												<div class="user_img"> -->
<!-- 													<i class="bi bi-person-circle"></i> -->
<!-- 												</div> -->
<!-- 												<div class="user_id"> -->
<%-- 													<p class="user_id_text"><%=studyProInfo.getUser_id() %></p> --%>
<!-- 												</div> -->
												<div>
													<p>처리 결과 | <strong class="text-warning">처리중</strong></p>
													<input type="button" class="cancelBtn btn btn-danger" id ="<%=studyNoProInfo.getAp_no() %>" value="신청취소" onclick="cancelApply(event)">
												</div>
											</div>
										</div>
									</div>
								</div>
								<%
									i++;
									}
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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>


// $('.cancelBtn').on('click',function(){
	
	
	
// 	if(confirm("스터디를 삭제하시겠습니까?")){
// 		let ap_no = $('#ap_no').text();
// 	}
// });

// 신청 취소버튼 클릭시
function cancelApply(event){
	
	if(confirm("스터디를 삭제하시겠습니까?")){
		
		let ap_no = event.currentTarget.id;
		location.href="/cancelStudy.do?apNo="+ap_no;
	}
}


</script>


<!--  end 신청내역 -->


<!-- 처리내역 -->
<div class="container-fluid fruite py-5">
	<div class="container py-5">
		<div class="tab-class text-center">
			<div class="row g-4">
			<hr>			
				<div class="col-lg-4 text-start mb-4">
					<h3>처리내역</h3>
				</div>
			</div>
			
			<div class="tab-content">
				<div id="tab-1" class="tab-pane fade show p-0 active">
					<div class="row g-4">
						<div class="col-lg-12">
							<div class="row g-4" id="newStudyArea">

								<%if(userStudyProList != null && userStudyProList.size() != 0){
									
								%>
								<%
								int i = 0;
								while(i < userStudyProList.size()){
									
									// 스터디 처리정보를 가져온다.
									UserStudyProInfo studyProInfo = userStudyProList.get(i);
									
									// 스터디 처리정보를 출력한다.
								%>

								<div class="col-md-6 col-lg-4 col-xl-3">
									<div class="rounded position-relative fruite-item"
										style="padding: 10%; border: 1px solid #FFC452">
										<div class="top"
											style="display: flex; justify-content: center">
											<div class="end_date">
												<a href="/getStudyDetail.do?gsu_no=<%=studyProInfo.getGsu_no() %>" class="fs-3 text-dark" style="text-align: left">
													<%= studyProInfo.getStd_name()%> </a>
											</div>
										</div>
										<hr>
										<div class="middle" style="max-height: 120px">
											<div class="middle_detail">
												<p>스터디 구분 | <%= studyProInfo.getSgbn_name()%> / <%=studyProInfo.getSgdt_name() %></p>	
												<p>스터디 리더 | <i class="bi bi-person-circle"></i><%=studyProInfo.getLeader_id() %></p>
												<p>스터디 시작일 | <%=studyProInfo.getStd_strdt().substring(0,10) %></p>
											</div>
											<div class="title p-4 rounded-bottom">
												<p class="title_text text-dark fs-5 fw-bold mb-0"
													style="text-align: left"></p>
											</div>
											<div class="skill"></div>
											<div class="skill_img"></div>
										</div>
										<hr>
										<div class="bottom"
											style="display: flex; justify-content: space-around;">
											<div class="bottom_left"
												style="display: flex; justify-content: space-between;">
<!-- 												<div class="user_img"> -->
<!-- 													<i class="bi bi-person-circle"></i> -->
<!-- 												</div> -->
<!-- 												<div class="user_id"> -->
<%-- 													<p class="user_id_text"><%=studyProInfo.getUser_id() %></p> --%>
<!-- 												</div> -->
												<div>
												<p>스터디 신청일 | <%=studyProInfo.getAp_date().substring(0,10) %></p>
													<%
														String msg;
														String textColor;
														int res = studyProInfo.getPro_res(); 
														if(res == 1){
															msg = "승인완료";
															textColor = "text-success";
														} else{
															msg = "승인거부";
															textColor = "text-danger";
														}
													%>
													<p>처리 결과 | <strong class=<%=textColor%>><%=msg %></strong></p>
												</div>
											</div>
										</div>
									</div>
								</div>
								<%
									i++;
									}
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
<!-- end 처리내역 -->
	
	
<!-- 진행중인 모임 -->
<div class="container-fluid fruite py-5">
	<div class="container py-5">
		<div class="tab-class text-center">
			<div class="row g-4">
			<hr>			
				<div class="col-lg-4 text-start mb-4">
					<h3>진행중인 모임</h3>
				</div>
			</div>
			
			<div class="tab-content">
				<div id="tab-1" class="tab-pane fade show p-0 active">
					<div class="row g-4">
						<div class="col-lg-12">
							<div class="row g-4" id="newStudyArea">

								<%if(userStudyList != null && userStudyList.size() != 0){
									
								%>
								<%
								int i = 0;
								while(i < userStudyList.size()){
									
									// 스터디 정보를 가져온다.
									UserStudyInfo studyInfo = userStudyList.get(i);
									
									// 시작날짜를 가져온다.
									String std_strDt = studyInfo.getStd_strdt().substring(0,10);
									
									// 종료날짜를 가져온다. 
									String std_endDt = studyInfo.getStd_enddt().substring(0,10);
									
									// 자바의 날짜 형식으로 변환한다.
									DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
									LocalDate strDt = LocalDate.parse(std_strDt,formatter);
									LocalDate endDt = LocalDate.parse(std_endDt,formatter);
									
									// 오늘 날짜를 구한다.
									LocalDate today = LocalDate.now();
									
									// 오늘날짜가 시작날짜보다 크고, 종료날짜보다 작으면 
										// 데이터를 출력한다. 
									if(today.isAfter(strDt) && today.isBefore(endDt)){
										
								%>

								<div class="col-md-6 col-lg-4 col-xl-3">
									<div class="rounded position-relative fruite-item"
										style="padding: 10%; border: 1px solid #FFC452">
										<div class="top"
											style="display: flex; justify-content: center">
											<div class="end_date">
												<a href="/studyDetail.do?no=<%=studyInfo.getStd_no() %>" class="fs-3 text-dark" style="text-align: left">
													<%= studyInfo.getStd_name()%> </a>
											</div>
										</div>
										<hr>
										<div class="middle" style="max-height: 120px">
											<div class="middle_detail">
												<p>스터디 구분 | <%=studyInfo.getSgbn_name() %> / <%=studyInfo.getSgdt_name() %></p>
												<p>스터디 리더 | <i class="bi bi-person-circle"></i><%=studyInfo.getLeader_id() %></p>
												<p>스터디 시작일 | <%=studyInfo.getStd_strdt().substring(0,10) %></p>
											</div>
											<div class="title p-4 rounded-bottom">
												<p class="title_text text-dark fs-5 fw-bold mb-0"
													style="text-align: left"></p>
											</div>
											<div class="skill"></div>
											<div class="skill_img"></div>
										</div>
										<hr>
										<div class="bottom"
											style="display: flex; justify-content: space-around;">
											<div class="bottom_left"
												style="display: flex; justify-content: space-around">
												<div>
												<p>스터디 종료일 | <%=studyInfo.getStd_enddt().substring(0,10) %></p>
												<%
													String actor = "";
													int user_no = studyInfo.getUser_no();
													int leader_no = studyInfo.getLeader_no();
													
													if(user_no == leader_no) {
														actor = "리더";
													} else{
														actor = "스터디원";
													}
												%>
												<p>스터디 내 역할 | <%=actor %></p>
												</div>
											</div>
										</div>
									</div>
								</div>
								<%
										}
									i++;
									}
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
<!-- 진행중인 모임 End-->


<!-- 종료된 모임 -->
<div class="container-fluid fruite py-5">
	<div class="container py-5">
		<div class="tab-class text-center">
			<div class="row g-4">
			<hr>			
				<div class="col-lg-4 text-start mb-4">
					<h3>종료된 모임</h3>
				</div>
			</div>
			
			<div class="tab-content">
				<div id="tab-1" class="tab-pane fade show p-0 active">
					<div class="row g-4">
						<div class="col-lg-12">
							<div class="row g-4" id="newStudyArea">

								<%if(userStudyList != null && userStudyList.size() != 0){
									
								%>
								<%
								int i = 0;
								while(i < userStudyList.size()){
									
									// 스터디 정보를 가져온다.
									UserStudyInfo studyInfo = userStudyList.get(i);
									
									// 시작날짜를 가져온다.
									String std_strDt = studyInfo.getStd_strdt().substring(0,10);
									
									// 종료날짜를 가져온다. 
									String std_endDt = studyInfo.getStd_enddt().substring(0,10);
									
									// 자바의 날짜 형식으로 변환한다.
									DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
									LocalDate strDt = LocalDate.parse(std_strDt,formatter);
									LocalDate endDt = LocalDate.parse(std_endDt,formatter);
									
									// 오늘 날짜를 구한다.
									LocalDate today = LocalDate.now();
									
									// 오늘날짜가 시작날짜보다 크고, 종료날짜보다 크면 
									// 데이터를 출력한다. 
									if(today.isAfter(strDt) && today.isAfter(endDt)){
										
								%>

								<div class="col-md-6 col-lg-4 col-xl-3">
									<div class="rounded position-relative fruite-item"
										style="padding: 10%; border: 1px solid #FFC452">
										<div class="top"
											style="display: flex; justify-content: center">
											<div class="end_date">
												<a href="/studyDetail.do?no=<%=studyInfo.getStd_no() %>" class="fs-3 text-dark" style="text-align: left">
													<%= studyInfo.getStd_name()%> </a>
											</div>
										</div>
										<hr>
										<div class="middle" style="max-height: 120px">
											<div class="middle_detail">
												<p>스터디 구분 | <%=studyInfo.getSgbn_name() %> / <%=studyInfo.getSgdt_name() %></p>
												<p>스터디 리더 | <i class="bi bi-person-circle"></i><%=studyInfo.getLeader_id() %></p>
												<p>스터디 시작일 | <%=studyInfo.getStd_strdt().substring(0,10) %></p>
											</div>
											<div class="title p-4 rounded-bottom">
												<p class="title_text text-dark fs-5 fw-bold mb-0"
													style="text-align: left"></p>
											</div>
											<div class="skill"></div>
											<div class="skill_img"></div>
										</div>
										<hr>
										<div class="bottom"
											style="display: flex; justify-content: space-around;">
											<div class="bottom_left"
												style="display: flex; justify-content: space-around">
												<div>
												<p>스터디 종료일 | <%=studyInfo.getStd_enddt().substring(0,10) %></p>
												<%
													String actor = "";
													int user_no = studyInfo.getUser_no();
													int leader_no = studyInfo.getLeader_no();
													
													if(user_no == leader_no) {
														actor = "리더";
													} else{
														actor = "스터디원";
													}
												%>
												<p>스터디 내 역할 | <%=actor %></p>
												</div>
											</div>
										</div>
									</div>
								</div>
								<%
										}
									i++;
									}
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
<!-- 종료된 모임 End-->


  

<%@include file="/includes/footer.jsp" %>
