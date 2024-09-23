<%@page import="mypage.vo.ScheduleVO"%>
<%@page import="java.util.List"%>
<%@page import="vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

	<%@include file="/includes/header_Login.jsp" %>

  	<%
		MemberVO memberVO = (MemberVO) request.getAttribute("memberVO");
		List<String> skillList = (List<String>) request.getAttribute("skills");
		List<ScheduleVO> scheduleList = (List<ScheduleVO>) request.getAttribute("scheduleVO");
		
		// insert / update / delete 성공여부 메시지
		String msg = session.getAttribute("msg") == null ? "" 
					: (String)session.getAttribute("msg");
		
		session.removeAttribute("msg");
  	%>
  	
  	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
  	<!-- 일정성공여부 메시지-->
  	<script >
  	<%
		if(msg.equals("성공")){
	%>
			Swal.fire({
		        icon: 'success',                         // Alert 타입
			    title: '정상 처리 되었습니다',         // Alert 제목
		    	text: '',  // Alert 내용
			});
	<%
		} else if(msg.equals("실패")){
	%>
			Swal.fire({
		        icon: 'error',                         // Alert 타입
			    title: '정상 처리 되지 않았습니다.',         // Alert 제목
		    	text: '',  // Alert 내용
			});
// 			alert("정상적으로 처리되지 않았습니다.");
	<%
		}
	%>
	</script>
	<!-- end 일정성공여부 메시지-->
	
  	<!-- [일정등록 모달] -->
  	<form action="/scheduleInsert.do" method="post">
      <div class="modal" style="z-index:9999;">
        <div class="modal_popup">
          <h3>일정추가</h3>
          <label for="scd_title" class="my-3">일정내용:</label>
          <input type="text" id="scd_title" name="scd_title" class="mx-1" /> <br />
          <label for="datetime" class="my-3"
            >일정시작:
            <input type="date" name="strDate" class="mx-1">
            <input type="time" name="strTime">
          </label>
          <br />
          <label for="datetime" class="my-3"
            >일정종료:
            <input type="date" name="endDate" class='mx-1'>
            <input type="time" name="endTime">
          </label>
          <br />
          <div class="my-3"></div>
          <input type="submit" class="add_btn" value="일정추가">
          <button type="button" class="close_btn">닫기</button>
        </div>
      </div>
  	</form>
  	<!--end [일정등록 모달] -->
  	
  	<!-- [상세일정 모달] -->
    <div class="detail_modal" style="z-index:9999;">
      <div class="dtModal_popup">
        <h3 class="detailTitle mb-4">상세일정</h3>
        <div class="scheduleInfo">
			  
        </div>
        <br />
        <button type="button" class="dtUpdate_btn">수정</button>
        <button type="button" class="dtDelete_btn">삭제</button>
        <button type="button" class="dtClose_btn">닫기</button>
      </div>
    </div>
  	<!--end [상세일정 모달] -->
  	
  	
  	<!-- [일정수정 모달] -->
  	<form action="/scheduleUpdate.do" method="post">
      <div class="update_modal" style="z-index:9999;">
        <div class="upModal_popup">
          <h3>일정수정</h3>
          <input type="hidden" id="upScd_no" name="upScd_no">
          <label for="scd_title" class="my-3">일정내용:</label>
          <input type="text" id="scd_title" name="scd_title" class="mx-1"/>
          <br />
          <label for="datetime" class="my-3"
            >일정시작:
            <input type="date" name="strDate" class="strDate mx-1">
            <input type="time" name="strTime" class="strTime">
          </label>
          <br />
          <label for="datetime" class="my-3"
            >일정종료:
            <input type="date" name="endDate" class="endDate mx-1">
            <input type="time" name="endTime" class="endTime">
          </label>
          <br />
          <div class="my-3"></div>
          <input type="submit" class="update_btn" value="일정수정">
          <button type="button" class="upClose_btn">닫기</button>
        </div>
      </div>
  	</form>
  	<!-- end [일정수정 모달] -->
  	
  	<div id="header_mg"></div>
  	
  	<div id = "mypage_cont">
  		<div id = "">
	  		<div id = "mypage_default">
				<section id="home">
			<!--     O : 사진 이미지 -->
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
	    <section id="calender__info">
	      	<button type="button" class="scAdd_btn">일정추가</button>
	      <div id ="calender_container">
	      	<div id="calendar"></div>
	      </div>
	    </section>
	
  <!-- 캘린더 -->
  <script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.11/index.global.min.js"></script>
  <script>
  	let dtScd_no = [];
  	var calendar;
    document.addEventListener("DOMContentLoaded", function () {
      var calendarEl = document.getElementById("calendar");
      calendar = new FullCalendar.Calendar(calendarEl, {
        initialView: "dayGridMonth",
        events: [
        <%for(ScheduleVO scheduleVO : scheduleList) 
        {
        	// O : 서브스트링 x -> 공백기준 파싱후 비교
        	// 날짜가 다르면  날짜만 스타드에 표시한다.
        	// 날짜가 같으면 전체 시간을 스타트에 표시한다. 
        %>
        
          {
            title: "<%=scheduleVO.getScd_title()%>",
            start: "<%=scheduleVO.getScd_start()%>",
            end: "<%=scheduleVO.getScd_end()%>",
          },
        
        <%
        }
        %>
        ],
        dateClick: function(info) {
        	
	       	 // 상세모달창을 활성화한다.
	         let dtModal = document.querySelector(".detail_modal");
	         dtModal.classList.add("on");
	
	         document.querySelector('.detailTitle').innerHTML = '<h3>' + info.dateStr + '</h3>';
	            
	         // 사용자의 상세 일정정보를 가져온 후, 나머지 처리(수정, 삭제)를 하는 함수
	         getDetailSchedule(info);
	         
            
            // 닫기버튼 클릭시 상세일정 모달을 비활성화한다.
            let dtModalClose = document.querySelector('.dtClose_btn'); 
            dtModalClose.addEventListener('click', function(){
                dtModal.classList.remove('on');
            });
          }
      });

      calendar.render();
    });
    
    // [일정추가 이벤트]
    const modal = document.querySelector(".modal");
    const modalOpen = document.querySelector(".scAdd_btn");
    const modalClose = document.querySelector(".close_btn");

    //일정추가 버튼을 클릭했을 때 일정추가 모달팝업이 열린다.
    modalOpen.addEventListener("click", function () {
      modal.classList.add("on"); //'on' class 추가
    });
    
    //닫기 버튼을 눌렀을 때 모달팝업이 닫힌다.
    modalClose.addEventListener("click", function () {
      modal.classList.remove("on"); //'on' class 제거
    });
 	// end [일정추가 이벤트]  
 	
 	
 	// [일정상세 이벤트]
 	// 상세일정 정보를 비동기처리로 가져오는 함수.
 	function getDetailSchedule(info) {
 		let date = info.dateStr;
     	let user_no = "<%=memberVO.getUser_no()%>";

        fetch("scheduleDetail.do", {
        	method : 'POST',
        	body: new URLSearchParams({
        		date : date,
        		user_no : user_no
        	})
        })
        .then(response => response.json())
        .then(jsonData => {
        	console.log(jsonData);
        	
        	// 상세일정 데이터를 받아온 경우
        		// 상세일정 모달에 출력한다.
        	let scheduleInfo = document.querySelector('.scheduleInfo');
        	scheduleInfo.innerHTML = generateDetailSchedule(jsonData);
        	
        	
        	// 일정을 클릭할 때 상세데이터를 가져온다.
        	let td;
        	let tbIndex;	
         	$('.dtScdTb tbody tr').click(function(e){
         		let tr = $(this);
         		td = tr.children(); // 테이블 row정보를 가져옴.
         		tbIndex = e.target.parentNode.rowIndex;// 테이블 row 인덱스 정보
         	});
         	
         	
        	// [일정 수정 이벤트]
            let dtUpdateBtn = document.querySelector('.dtUpdate_btn');
	        dtUpdateBtn.addEventListener('click', function(){
	            	
		       // 수정 모달을 활성화한다.
		       let upModal = document.querySelector('.update_modal');
		       upModal.classList.add('on');
		       
		       
		       // 일정을 수정한다.(row정보, 테이블 위치)
		       modifySchedule(td, tbIndex);

		       
		       // 닫기버튼 클릭시 일정수정 모달을 비활성화한다.
		       let upCloseBtn = document.querySelector('.upClose_btn');
		       upCloseBtn.addEventListener('click', function(){
		         upModal.classList.remove('on');
		       });
	      	});
	        
	        
            // [일정 삭제 이벤트]
            $(".dtDelete_btn").off("click").on("click",function(e){
				
            	// 선택한 일정이 없을 경우 리턴한다. O : 더미데이터 처리
            	if(td == null){
            		return;
            	}
//             	console.log(td.eq(0).text());

            	
            	if(confirm(td.eq(0).text() +' 일정을 삭제하시겠습니까?')){
            		
            		// 일정정보를 삭제한다.
            		deleteSchedule(dtScd_no[tbIndex-1]);
            	} 
			});
            

	         
			// end then()         	
        })
        .catch(error => console.log('Error : ', error));
 	}
 	
 	// 상세일정이 있을 때, 테이블을 생성하는 함수.
 	function generateDetailSchedule(jsonData){
 		
 		if(jsonData.length < 1){
 			return '<p>일정이 없습니다.</p>'
 		}
 		
 		// 이전에 조회한 상세일정번호를 삭제한다.
 		dtScd_no = [];
 		
 		let table = '<table border = "1" class = "table table-bordered dtScdTb">';
 		table += '<thead>'
 		table += '<tr class="text-center"><th>일정정보</th><th>시작시간</th><th>종료시간</th></tr>';
 		table += '</thead>'
 		table += '<tbody>'
 		for (var i = 0; i < jsonData.length; i++) {
 	       table += '<tr>';
 	       table += '<td>' + jsonData[i].scd_title + '</td>';
 	       table += '<td>' + jsonData[i].scd_start + '</td>';
 	       table += '<td>' + jsonData[i].scd_end + '</td>';
 	       table += '</tr>';
 	       dtScd_no.push(jsonData[i].scd_no);
 	   }
 	   table += '</tbody>'
 	   table += '</table>';
 	   
 	   return table; 
 	}
    // end [일정상세 이벤트]
    
    
    // [일정수정 이벤트]
    // 일정을 수정하는 함수
    function modifySchedule(td,tbIndex){
    		// 일정을 선택하지 않았을 경우
	       if(td == null){
	    	   document.querySelector('.update_modal #scd_title').value = "";
		       document.querySelector('.update_modal .strDate').value = "";
		       document.querySelector('.update_modal .strTime').value = "";
		       document.querySelector('.update_modal .endDate').value = "";
		       document.querySelector('.update_modal .endTime').value = "";
	       } else { // 일정을 선택했을 경우
	    	   
	    		// 클릭한 상세일정 정보를 가져온다.
		       		// 날짜정보를 파싱
		       let strDateTime = td.eq(1).text().split(" ");
		       let endDateTime = td.eq(2).text().split(" ");
		       
		       		// 수정정보창에 출력한다.
		       document.querySelector('.update_modal #scd_title').value = td.eq(0).text();
		       document.querySelector('.update_modal .strDate').value = strDateTime[0];
		       document.querySelector('.update_modal .strTime').value = strDateTime[1];
		       document.querySelector('.update_modal .endDate').value = endDateTime[0];
		       document.querySelector('.update_modal .endTime').value = endDateTime[1];
		       
		       
		       // 테이블 인덱스정보에 일치하는 일정번호를 폼에 저장한다.
		       document.querySelector('.update_modal #upScd_no').value = dtScd_no[tbIndex-1];
	       }
    }
    
    // end [일정수정 이벤트]
    
    
    // [일정삭제 이벤트]
    // 일정을 삭제하는 함수
    function deleteSchedule(scd_no){
    	
    	let form = document.createElement('form');
		form.setAttribute('method', 'post');
		form.setAttribute('action', '/scheduleDelete.do');
		document.charset = "UTF-8";
		
		let hiddenField = document.createElement('input');
		hiddenField.setAttribute('type', 'hidden');
		hiddenField.setAttribute('name', 'scd_no');
		hiddenField.setAttribute('value', scd_no);
		form.appendChild(hiddenField);
		
		document.body.appendChild(form);
		form.submit();
    }
    // end [일정삭제 이벤트]
    
    </script>

<%@include file="/includes/footer.jsp" %>
