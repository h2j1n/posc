<%@page import="com.itextpdf.text.log.SysoCounter"%>
<%@page import="main.vo.MainHotVO"%>
<%@page import="get_study_user.vo.GetStudyUserVO"%>
<%@page import="vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page info="copyright by MIS"%>



<%
	Integer adminId = (Integer) session.getAttribute("admNo");
Integer userId = (Integer) session.getAttribute("userNo");
if (userId != null || adminId != null) {
	if (userId != null) {
%>

<%@include file="/includes/header_Login.jsp"%>
<%
	} else if (adminId != null) {
%>
<%@include file="/includes/header_Admin.jsp"%>
<%
	}

} else {
%>
<%@include file="/includes/header_unLogin.jsp"%>
<%
	}
%>


<style>
.dummy {
	width: 100%;
	height: 150px
}

.addGetStudyBtn {
	border-radius: 10px;
	display: flex;
	background-color: #ffb524;
	padding: 10px 40px;
	font-size: x-large;
	color: white;
	border: 5px solid orange;
}
</style>



<div class="dummy"></div>

<!-- 실시간 인기글 Start-->


<div class="container-fluid vesitable py-5">

	<div class="container py-5">
		<div style="display: flex; justify-content: flex-end;">

			<%
				if (userId != null || adminId != null) {
			%>
			<button class="addGetStudyBtn" onclick="location.href = '/team.do' ">팀원모집</button>
			<%
				}
			%>
		</div>

		<h1 class="mb-0">🚩 신규 인기글</h1>

		<div class="owl-carousel vegetable-carousel justify-content-center">

			<%
				List<MainHotVO> hotList = (List<MainHotVO>) request.getAttribute("hotList");

			for (int i = 0; i < 6; i++) {
			%>

			<div class="border border-primary rounded position-relative vesitable-item"
				style="padding: 10%">

				<a href="/getStudyDetail.do?gsu_no=<%=hotList.get(i).getGsu_no()%>" class="HW_a">
					<div class="top" style="display: flex; justify-content: space-between">
						<div class="Study_or_Pro">
							<%
								if (hotList.get(i).getGsu_gubun().equals("0")) {
							%>
							<div class="New_or_Hot" style="border-radius: 20px; background-color: #E9E7E7; font-weight: bold; color: #646464; padding-left: 15px; padding-right: 15px; padding-top: 3px; padding-bottom: 3px;">📚STUDY</div>
							<%
								} else {
							%>
							<div class="New_or_Hot" style="border-radius: 20px; background-color: #E9E7E7; font-weight: bold; color: #646464; padding-left: 15px; padding-right: 15px; padding-top: 3px; padding-bottom: 3px;">💻PROJECT</div>

							<%
								}
							%>
						</div>
						<div class="New_or_Hot px-3 py-1 rounded" style="top: 15px; left: 450px;     background-color: #ffb524;
    color: white;">NEW</div>
					</div>
					<hr>
					<div class="middle" style="max-height: 120px">
						<div class="end_date">
							<p class="end_date_text">
								마감일 |
								<%=(hotList.get(i).getGsu_end()).substring(0, 10)%>
							</p>
						</div>
						<div class="title p-4 rounded-bottom">
							<p class="title_text text-dark fs-5 fw-bold mb-0"><%=hotList.get(i).getGsu_title()%></p>
						</div>
						<div class="skill"></div>
						<div class="skill_img"></div>
					</div>
					<hr>
					<div class="bottom"
						style="display: flex; justify-content: space-around;">
						<div class="bottom_left"
							style="display: flex; justify-content: space-around">
							<div class="user_img">
								<i class="bi bi-person-circle"></i>
							</div>
							<div class="user_id">

								<p class="user_id_text"><%=hotList.get(i).getUser_id() %></p>
							</div>
						</div>
						<div class="bottom_right"
							style="display: flex; justify-content: space-around">
							<div class="hit">
								<img src="">
								<p class="hit_text">
									<i class="bi bi-eye"></i><%=hotList.get(i).getGsu_hit()%></p>
							</div>
						</div>
					</div>
				</a>


			</div>
				<%
					}
				%>

		</div>
	</div>
</div>







<!-- 실시간 인기글 END -->





<!-- Fruits Shop Start-->
<div class="container-fluid fruite py-5">
	<div class="container py-5">
		<div class="tab-class text-center">
			<div class="row g-4">
				<div class="col-lg-4 text-start mb-5">
					<h1>🚩 전체 모집글</h1>
				</div>
				
			</div>
			<div class="tab-content">
				<div id="tab-1" class="tab-pane fade show p-0 active">
					<div class="row g-4">
						<div class="col-lg-12">
							<div class="row g-4" id="newStudyArea">

								<%
									//paging 변수

								List<GetStudyUserVO> allStudyList = (List<GetStudyUserVO>) request.getAttribute("getStudyList");

								if (allStudyList == null || allStudyList.size() == 0) {
								%>

								<p>조회하신 모집글이 존재하지 않습니다.</p>

								<%
									} else {

								//작성자 아이디 가져올것.
								for (int i = 0; i < allStudyList.size(); i++) {
									GetStudyUserVO gsuVO = allStudyList.get(i);
								%>

								<div class="col-md-6 col-lg-4 col-xl-3">
									<div class="rounded position-relative fruite-item" style="padding: 10%; border: 3px solid #81C408">
									<a href="/getStudyDetail.do?gsu_no=<%=gsuVO.getGsu_no()%>" class="HW_a"> 
										<div class="top" style="display: flex; justify-content: space-between">
											<div class="Study_or_Pro">
											
<!-- 											닫는태그 -->
											

													<%
													 	if (gsuVO.getGsu_gubun() == 0) {
													 %>
															<div class="New_or_Hot" style="border-radius: 20px; background-color: #E9E7E7; font-weight: bold; color: #646464; padding-left: 12px; padding-right: 12px; padding-top: 3px; padding-bottom: 3px;">📚STUDY</div>
													<%
													 	} else {
													 %>
														<div class="New_or_Hot" style="border-radius: 20px; background-color: #E9E7E7; font-weight: bold; color: #646464; padding-left: 12px; padding-right: 12px; padding-top: 3px; padding-bottom: 3px;">💻PROJECT</div>
													<%
													 	}
													 %>
												 
											</div>

											<%
												Date date = new Date();
												SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd");
												String strDate = simpleDate.format(date);
											%>

											<%
												if (strDate.equals(gsuVO.getGsu_start().substring(0, 10))) { //오늘 날짜가 작성 날짜가 같을 경우
											%>
													<div class="New_or_Hot rounded text-white" style="padding: 0 5px;     background-color: #ffb524;
    color: white; line-height: 30px;">NEW</div>
											<%
												}
											%>
											<%
												if (strDate.equals(gsuVO.getGsu_end().substring(0, 10))) { //오늘 마감일 경우
											%>
													<div class="New_or_Hot rounded text-white" style="padding: 0 5px; background-color: #d63384; line-height: 30px;">오늘마감</div>
											<%
												}
											%>

<!-- 											<div class="Fill_or_Empty"> -->
<!-- 												<img src="/img/heart_empty.png"> -->
<!-- 												<img src="/img/heart_fill.png" style="display: none"> -->
<!-- 											</div> -->
										</div>
										<hr>
										<div class="middle"
											style="max-height: 120px; align-content: center;">
											<div class="end_date">
												<p class="end_date_text" style="text-align: left">
												<h6>
													마감일 |
													<%=gsuVO.getGsu_end().substring(0, 10)%></h6>
												</p>
											</div>
											<div class="title p-4 rounded-bottom">
												<p class="title_text text-dark fs-5 fw-bold mb-0"
													style="text-align: left"><%=gsuVO.getGsu_title()%></p>
											</div>
											<div class="skill"></div>
											<div class="skill_img"></div>
										</div>
										<hr>
										<div class="bottom"
											style="display: flex; justify-content: space-around; align-items: baseline;">
											<div class="bottom_left"
												style="display: flex; justify-content: space-around">
												<div class="user_id">
													<h6 class="bi bi-person-circle"><%=gsuVO.getGsu_user_id()%></h6>
												</div>
											</div>
											<div class="bottom_right"
												style="display: flex; justify-content: space-around">
												<div class="hit">
													<p class="hit_text">
													<h6 class="bi bi-eye">
														조회수:
														<%=gsuVO.getGsu_hit()%></h6>
													</p>
												</div>
											</div>
										</div>
										

									</a>

									</div>
								</div>
								<%
									}
								%>

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

<!-- Fruits Shop End-->







<%@include file="/includes/footer.jsp"%>

