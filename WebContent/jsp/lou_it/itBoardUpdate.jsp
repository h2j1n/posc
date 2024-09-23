<%@page import="board_it.vo.ItVo"%>
<%@page import="get_study_user.vo.SkillVO"%>
<%@page import="main.vo.MainHotVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>    
<%@include file="/includes/header_Login.jsp" %>
<%

ItVo iv = (ItVo)request.getAttribute("iv");


Integer user_no = (Integer)session.getAttribute("userNo");





%>


        <div class="container-fluid page-header py-5">
            <h1 class="text-center text-white display-6">행사 신청</h1>
            <ol class="breadcrumb justify-content-center mb-0">
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
                                <h1 class="text-primary">👉🏻행사 기본 정보를 입력해주세요</h1>
                            </div>
                        </div>
                        <div class="col-lg-12">
                           
                        </div>
				<div class="col-lg-6">
					<form action="/itBoardUpdate.do" method="post" id="getStudyInsertForm">

						<p>행사명</p>
						<input type="hidden" class="w-100 form-control border-0 py-3 mb-4 bg-white" placeholder="행사명을 입력해주세요" id="eventName" name="it_no"
						value="<%=iv.getIt_no()%>">
						<input type="text" class="w-100 form-control border-0 py-3 mb-4 bg-white" placeholder="행사명을 입력해주세요" id="eventName" name="eventTitle"
						value="<%=iv.getIt_title()%>">
						
						
						<p>행사 유형</p>
						<select class="w-100 form-control border-0 py-3 mb-4 bg-white" id="eventType" name="eventType" >
							<option value ="" selected>클릭 선택</option>
							<option value="online" <%=iv.getIt_type().equals("online") ? "selected" : ""%>>온라인</option>
							<option value="offline" <%=iv.getIt_type().equals("offline") ? "selected" : ""%>>오프라인</option>
							<option value="on,offline"  <%=iv.getIt_type().equals("on,offline") ? "selected" : ""%>>온/오프라인 동시</option>
						</select>
						
						
						<p style="text-align:left">시작 종료일</p>
		
						
						<div style="display: flex;">
						<input type="date" class="w-100 form-control border-0 py-3 mb-4 bg-white" id="eventDate1" name="eventDate1" style="margin-right:10px" value="<%= iv.getIt_sdate().substring(0, 10) %>">
						
							<input type="date" class="w-100 form-control border-0 py-3 mb-4 bg-white"  id="eventDate2" name="eventDate2" value="<%= iv.getIt_edate().substring(0, 10) %>">
						</div>
						
						<p>주최 기관</p>
						<input type="text" class="w-100 form-control border-0 py-3 mb-4 bg-white" placeholder="주최 기간 또는 단체를 입력해주세요" id="eventOrgan" name="eventOrgan" value="<%=iv.getIt_organ()%>">
						
						
				</div>




				<div class="col-lg-6">
				
						<p>행사구분</p>
						<select class="w-100 form-control border-0 py-3 mb-4 bg-white" id="eventGbu" name="eventGbu" >
							<option value="" selected>클릭 선택</option>	
							<option value="Hackaton" <%=iv.getIt_gu().equals("Hackaton") ? "selected" : "" %>>해커톤</option>	
							<option value="conference" <%=iv.getIt_gu().equals("conference") ? "selected" : "" %>>컨퍼런스</option>
							<option value="Contest" <%=iv.getIt_gu().equals("Contest") ? "selected" : "" %>>공모전</option>
							<option value="BootCamp" <%=iv.getIt_gu().equals("BootCamp") ? "selected" : "" %>>부트캠프</option>
						</select> 
						
						
						<p>행사링크</p>
						<input type="text" class="w-100 form-control border-0 py-3 mb-4 bg-white" placeholder="행사링크를 첨부해주세요" id="evnetLink" name="eventLink" value="<%=iv.getIt_link()%>">
					
					
					
						<p>행사 장소</p>
						<input type="text" class="w-100 form-control border-0 py-3 mb-4" placeholder="ex)zoom 온라인 등" id="evnetPlace" name="evnetPlace" value="<%=iv.getIt_place() %>">
						
						
						<p>모집 마감일</p>
						<input type="date" class="w-100 form-control border-0 py-3 mb-4" placeholder="모집 마감일" id="endDate" name="endDate" value="<%=iv.getIt_enddate()%>">
					
				</div>
                 <textarea class="form-control summernote1" rows="5" id="mainImg" name="mainImg"><%=iv.getIt_mainimg() %></textarea>

				<div class="introduce" >
				<p class="mb-4 text-center mx-auto" style="max-width: 700px;">👉🏻소개를 입력해주세요</p>
                <label for="content" style="font-size: 20px;"></label>
	            <textarea class="form-control summernote" rows="5" id="content1" name="content1" ><%=iv.getIt_content()%></textarea>
				
				</div>
                       
                       
                       
                        <button class="w-100 btn form-control border-secondary py-3 bg-white text-primary " type="submit" id="addBtn">수정</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- Contact End -->
   
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>    
<script type="text/javascript">
 
 $.noConflict();
 $(".summernote1").summernote({
	  height:100,
	  width:200,
	  
	  
	    //에디터 한글 설정
	    lang:"ko-KR",
	    placeholder: '메인화면에 출력 될 사진을 첨부해주세요',
	    //에디터의 커서 이동
	    focus:true,
	    toolbar:[
	    	
	    ['insert',['picture']]
	    ]
	 
	 
	 
 })
 
 
 
 
 
 $(".summernote").summernote({

    //에디터의 높이
    height:503,
    //에디터 한글 설정
    lang:"ko-KR",
    placeholder: '내용을 입력해주세요',
    //에디터의 커서 이동
    focus:true,
    toolbar:[
       //글꼴지정
       ['fontname',['fontname']],

       //글자 크기 설정
       ['fontsize',['fontsize']],
       
       //굵기, 기움임꼴, 밑줄, 취소선 서식 지우기
       ['style',['bold','italic','underline','strikethough','clear']],
       
       //글자색
       ['color',['forecolor','color']],
       //표만들기
       ['table',['table']],
       //글머리 기호,번호매기기,문단정렬
       ['pare',['ul','ol','paragraph']],
       //줄간격
       ['height',['height']],
       //그림첨부,링크만들기,동영상첨부
       ['insert',['picture','link','video']],
       //코드 보기,확대해서 보기,도움말
       ['view',['codeview','fullscreen','help']]
       
       ],
       //추가한 글꼴
       fontName:['Arial','Arial Black','Comic Sans MS','맑은 고딕','궁서','굴림체','돋음체','바탕체'],
       //추가한 폰트사이즈
       fontSizes:['8','9','10','11','12','13','14','15','20','30','40']
 })
 
 
 
 
 
 
 
 	 $(function(){
 		var addBtn = $("#addBtn");
 		
 		addBtn.on("click",function(){
 			var eventName =$('#eventName').val();				//행사명
			var eventGbu = $('#eventGbu').val(); 				//구분
			var eventType = $('#eventType').val(); 					//유형	
			var evnetLink = $('#evnetLink').val(); 				//링크
			var sDate = $('#eventDate1').val(); 		//개최일시
			var eDate = $('#eventDate2').val(); 		//종료일시
			var eventOrgan = $('#eventOrgan').val(); 		//주최기관
			var endDate = $('#endDate').val(); 				//마감일자
			var evnetPlace = $('#evnetPlace').val(); 				//장소
			var mainImg = $('#mainImg').val(); 				//메인이미지
			var content = $('#content1').val(); 				//내용
			
			
 			
			if (eventName == null || eventName == "") {
				alert("행사명 미입력");
				return false;
			}
			if (eventGbu == null || eventGbu == "") {
				alert("구분 미선택");
				return false;
			}
			if (eventType == null || eventType == "") {
				alert("행사유형 미선택");
				return false;
			}
			if (evnetLink == null || evnetLink == "") {
				alert("링크 미입력");
				return false;
			}
			if (sDate == null || sDate == "") {
				alert("개최일시");
				return false;
			}
			if (eDate == null || eDate == "") {
				alert("종료일시");
				return false;
			}
			
			if (eventOrgan == null || eventOrgan == "") {
				alert("주최기관");
				return false;
			}
			
			if (endDate == null || endDate == "") {
				alert("마감일자 미선택");
				return false;
			}
			
			if (evnetPlace == null || evnetPlace == "") {
				alert("장소 미입력");
				return false;
			}
			if (mainImg == null || mainImg == "") {
				alert("메인이미지를 삽입해주세요");
				return false;
			}
			if (content == null || content == "") {
				alert("내용 미입력");
				return false;
			}
			
			alert("이 정보로 행사 신청을 하시겠습니까?");
			
			
			insertForm.submit();
			location.href="/itBoardDetail.do?it_no="+<%=iv.getIt_no()%>;
			
 		})
 	}); 
 		
 
 
 
 </script>
   

<%@include file="/includes/footer.jsp" %>



