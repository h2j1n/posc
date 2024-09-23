<%@page import="javax.sound.sampled.Port"%>
<%@page import="main.vo.MainHotVO"%>
<%@page import="mypage.vo.PortfolioVO"%>
<%@page import="java.util.List"%>
<%@page import="vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="/includes/header_Login.jsp" %>

<%
	MemberVO memberVO = (MemberVO) request.getAttribute("memberVO");
	List<String> skillList = (List<String>) request.getAttribute("skills");
	List<PortfolioVO> portList = (List<PortfolioVO>) request.getAttribute("portList");
%>
  	
<div id="header_mg"></div>

<div id = "mypage_cont">
	<div id = "">
		<div id = "mypage_default">
	<section id="home">
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
      <a href="#" class="menu__item fw-bold">포트폴리오</a>
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

<!-- Fruits Shop Start-->
<div class="container-fluid fruite py-5">
	<div class="container py-5">
		<div class="tab-class text-center">
					<button class="addPortBtn btn btn-success" style="margin-left:85%; background-color:#81c408; padding:10px 20px">포트폴리오 추가</button>
			<div class="row g-4">
			<hr>			
				<div class="col-lg-4 text-start mb-4">
					<h1>포트폴리오</h1>
				</div>
			</div>
			<div class="tab-content">
				<div id="tab-1" class="tab-pane fade show p-0 active">
					<div class="row g-4">
						<div class="col-lg-12">
							<div class="row g-4" id="newStudyArea">

								<%

								if (portList == null || portList.size() == 0) {
								%>

								<p>포트폴리오가 존재하지 않습니다.</p>

								<%
									} else {

								for (int i = 0; i < portList.size(); i++) {
									PortfolioVO portVO  = portList.get(i);
								%>

								<div class="col-md-6 col-lg-4 col-xl-3">
									<div class="rounded position-relative fruite-item"
										style="padding: 10%; border: 1px solid #FFC452">
										<div class="top"
											style="display: flex; justify-content: center">
											<div class="end_date">
												<a href="/portDetail.do?portNo=<%=portVO.getPort_no()%>" class="fs-3 text-dark" style="text-align: left">
													<%=portVO.getPort_title()%> </a>
											</div>
										</div>
										<hr>
										<div class="middle" style="max-height: 120px">
											<%=portVO.getPort_content().substring(0, 7) + "..." %>
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
												<div class="user_img">
													<i class="bi bi-person-circle"></i>
												</div>
												<div class="user_id">
													<p class="user_id_text"><%=memberVO.getUser_id() %></p>
												</div>
											</div>
										</div>
									</div>
								</div>
								<%
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

<!-- Fruits Shop End-->

<<script type="text/javascript">

	// 포트폴리오 추가 버튼 클릭시, 포트폴리오 추가화면으로 이동한다.
	let addBtn = document.querySelector('.addPortBtn');
	addBtn.addEventListener('click',function(){
		location.href="/portAdd.do";
	});
</script>



<%@include file="/includes/footer.jsp" %>