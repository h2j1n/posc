<%@page import="get_study_user.dao.SkillDAOImpl"%>
<%@page import="get_study_user.vo.SkillVO"%>
<%@page import="java.util.List"%>
<%@page import="vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@include file="/includes/header_Login.jsp" %>

<%
	MemberVO memberVO = (MemberVO) request.getAttribute("memberVO");
	List<SkillVO> skillList =(List<SkillVO>)request.getAttribute("skills");
	List<String> userSkills = (List<String>)request.getAttribute("userSkills");
 %>
  	
<div id="header_mg"></div>
<div id="header_mgModify"></div>

<!-- 비밀번호 확인 모달 -->
<div class="pwCheck_modal" style="z-index:9999;">
      <div class="pwCheck_popup">
        <h3 class="pwTitle">비밀번호 확인</h3>
	    <div class="col-sm-12">
	      <input type="password" class="form-control" id="pwchk" name="pwchk" required>
	    </div>
	    <p class="pwStatus text-danger"></p>
        <br />
        <input type="submit" class="pwCheck_btn" value="비밀번호 확인">
        <button type="button" class="pwCheck_closeBtn">닫기</button>
      </div>
</div>
<!-- end 비밀번호 확인 모달 -->

<!-- 비밀번호 변경 모달 -->
<div class="pwChange_modal" style="z-index:9999;">
      <div class="pwChange_popup">
        <h3 class="pwChangeTitle">비밀번호 변경</h3>
        <p class="pwInput">새로운 비밀번호</p>
	    <div class="col-sm-12 ">
	      <input type="password" class="form-control" id="newPw" name="pwchange"  required>
	    </div>
	    <p class="pwInput">비밀번호 재확인</p>
	    <div class="col-sm-12">
	      <input type="password" class="form-control" id="newPwChk" name="pwchangeChk"  required>
	    </div>
	    <p class="newPwStatus text-danger"></p>
        <br />
        <input type="submit" class="pwChange_btn" value="비밀번호 변경">
        <button type="button" class="pwChange_closeBtn">닫기</button>
      </div>
</div>
<!-- end 비밀번호 변경 모달 -->

<div class="upCont">
	<div class='upCont_popup'>
		<div class="col-sm-8 mt-5 text-left container">
	<h4 class="text-center">회원정보 수정</h4>
	  <hr>
	  <form class="form-horizontal" method="post"  action="/userModify.do" id="formTest">
	  	<div class="d-flex justify-content-center">
	  	<div>
	    <div class="form-group mt-4">
	    	<div class="d-flex">
		      <label for="name" class="control-label">이름<span class="rq"> *</span></label>
		      <span class="sp"></span>
		      <div class="col-sm-4">
		        <input type="text" class="form-control mx-3" id="name" name="name" value=<%=memberVO.getUser_name() %> required>
		      </div>
	       </div>
	    </div>
	    
	    <div class="form-group mt-4">
	    	<div class="d-flex">
		      <label for="bir" class="control-label">생년월일*</label>
		      <div class="col-sm-4">
		        <input type="date" class="form-control mx-3" id="bir" name="birth" value=<%=memberVO.getUser_bir() %>>
		      </div>
	      </div>
	    </div>
	    
	    <div class="form-group mt-4">
	    	<div class="d-flex">
		      <label for="hp" class="control-label">연락처<span class="rq"> *</span></label>
		      <div class="col-sm-4">
		        <input type="text" class="form-control mx-3" id="hp" name="tel" placeholder="010-0000-0000" value=<%=memberVO.getUser_tel() %> required
		        >
		      </div>
	      </div>
	    </div>
	    
	    <div class="form-group mt-4">
	    	<div class="d-flex">
		      <label for="add1" class="control-label">우편번호<span class="rq"> *</span></label>
		      <div class="">
		        <input type="text" class="form-control mx-3" id="postAddr" name="zip" value=<%=memberVO.getUser_zip() %> required>
		      </div>
		      <div class="mx-4" style="text-align: left;">
		        <button type="button" id="addrBtn" class="btn btn-info btn-sm p-2">주소검색</button>
		      </div>
		    </div>
	    </div>
	    
	    <div class="form-group mt-4">
	    	<div class="d-flex">
		      <label for="addr1" class="control-label">주소<span class="rq"> *</span></label>
		      <div class="">
		        <input type="text" class="form-control mx-3" id="addr1" name="add1" value="<%=memberVO.getUser_add1() %>" readonly>
		      </div>
	      	</div>
	    </div>
	    
	    <div class="form-group mt-4">
	    	<div class="d-flex">
		      <label for="addr2" class="control-label">상세주소<span class="rq"> *</span></label>
		      <div class="col-sm-6">
		        <input type="text" class="form-control mx-3" id="addr2" name="add2" value="<%=memberVO.getUser_add2() %>" required>
		      </div>
	        </div>
	    </div>
	    
	    <div class="form-group mt-4">
	    	<div class="d-flex">
		      <label for="mail" class="control-label">이메일*</label>
		      <div class="">
		        <input type="email" class="form-control mx-3" id="email" value="<%=memberVO.getUser_email() %>" name="email">
		      </div>
	      </div>
	    </div>
	   
	   	<div class="form-group mt-4">
	   		<div class="d-flex">	
			<label for="favorite" class="control-label me-3">기술스택 *</label>
				<select id="box" onchange="sel()">
			    <option value="" selected="selected">클릭 선택</option>
			    <% for(SkillVO sv : skillList){ %>		
			    <option value="<%=sv.getSgdt_No()%>"><%=sv.getSgdt_Name() %></option>
			    <% } %>
			</select>
			</div>
		</div>

	    <input type="hidden" id="selectedValuesInput" name="selectedValues">
	    <div id="selectedValuesOutput" class="mt-3" style="margin-top: 10px;"></div>

	    <div class="d-flex">
		    <div class="form-group">
		      <div class="col-sm-offset-2 ">
		        <button class="btn btn-default" id="joinBtn">수정하기</button>
		        <span id="joinspan"></span>
		      </div>
		    </div>
		  	<button class="btn btn-default" id="upPwBtn">비밀번호 변경</button>
	  	</div>
	  	</div>
	  	</div>
	  </form>
</div>	
	</div>
</div>  	



<script>

	// 비밀번호 변경 버튼을 클릭할 때
	let upPwBtn = document.querySelector('#upPwBtn');
	upPwBtn.addEventListener('click',function(event){
		
		event.preventDefault();
		
		// 비밀번호를 재확인 모달창을 호출한다.
		let pwChkModal = document.querySelector('.pwCheck_modal')
		pwChkModal.classList.add('on');
		
		// 이전 정보를 제거한다.
		let pwStatus = document.querySelector('.pwStatus');
		pwStatus.innerHTML = "";
		document.querySelector('#pwchk').value = "";
		
		
		// 닫기버튼을 클릭할 때, 비밀번호 확인 모달창을 닫는다.
		let pwChkCloseBtn = document.querySelector('.pwCheck_closeBtn');
		pwChkCloseBtn.addEventListener('click', function(){
			pwChkModal.classList.remove('on');	
		});
		
		// 비밀번호 확인 모달창을 클릭할 때
		let pwCheckBtn = document.querySelector('.pwCheck_btn');
		pwCheckBtn.addEventListener('click', function(){
			
			// 비동기로 비밀번호를 확인한다.
			let user_pw = document.querySelector('#pwchk');
			let pwVal = user_pw.value;
			
			
			fetch("/userPwChk.do", {
				method : 'POST',
				body : new URLSearchParams({
					user_pw : pwVal
				})
			})
			.then(response => response.json())
			.then(jsonData => {
				
				
				let pwStatus = document.querySelector('.pwStatus');
				
				if(jsonData == "성공"){ // 비밀번호 확인 성공시
					
					// 비밀번호 확인 성공 메시지룰 출력한다.
					document.querySelector('#pwchk').value = "";
					
					// 비밀번호 변경 모달창을 호출한다.
					let pwChModal = document.querySelector('.pwChange_modal');
					pwChModal.classList.add('on');
					
					// 이전정보를 삭제한다.
					document.querySelector('#newPw').value = "";
					document.querySelector('#newPwChk').value = "";
					document.querySelector('.newPwStatus').innerHTML = "";
					
					// 비밀번호 변경버튼을 클릭시
					let pwChBtn = document.querySelector('.pwChange_btn');
					pwChBtn.addEventListener('click', function(){
						
						// 새로운 비밀번호와 비밀번호 확인값을 비교한다.
						let newPw = document.querySelector('#newPw').value;
						let newChkPw = document.querySelector('#newPwChk').value;
						
						// 비교한 값이 같다면 비밀번호를 변경한다.
						if(newPw == newChkPw){
							
							let form = document.createElement('form');
							form.setAttribute('method', 'post');
							form.setAttribute('action', '/userPwChange.do');
							document.charset = "UTF-8";
							
							let hiddenField = document.createElement('input');
							hiddenField.setAttribute('type', 'hidden');
							hiddenField.setAttribute('name', 'newPw');
							hiddenField.setAttribute('value', newChkPw);
							form.appendChild(hiddenField);
							
							document.body.appendChild(form);
							form.submit();
							
						} else{ // 비교한 값이 다르다면 실패 메시지를 호출한다.
							document.querySelector('.newPwStatus').innerHTML = "값이 다릅니다!"
						}
					});
					
					
					// 닫기 버튼을 클릭시 모달창을 닫는다.
					let pwChCloseBtn = document.querySelector('.pwChange_closeBtn');
					pwChCloseBtn.addEventListener('click', function(){
						pwChModal.classList.remove('on');
					});
						
				} else{ // 비밀번호 확인 실패시
					
					// 비밀번호 확인 실패 메시지를 표시한다.
					pwStatus.innerHTML = "비밀번호 확인 실패!";
				}
				
			})
			.catch(error => console.log('Error : ', error));
			
		});
		
		
		// 새로운 비밀번호를 입력받는다.
		// 비밀번호 확인
	});
	</script>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	// 기존 유저의 스킬정보를 가져온다.
	
	let selectedValuesInputs = document.getElementById('selectedValuesInput');
   	let selectedValuess; 
	<% 
		for(String skill : userSkills){
		
	%>
		addSelection("<%=skill%>");
		
		selectedValuess = selectedValuesInputs.value.split(',').filter(Boolean); // 기존에 선택된 값들을 배열로 가져오기
		selectedValuess.push("<%=skill%>");
		selectedValuesInputs.value = selectedValuess.join(','); // 쉼표를 구분자로 선택된 값들을 문자열로 저장    
	<%
		}
	%>
	
	
	// [회원정보 수정로직]
	function sel() {
            let box = document.getElementById('box');
            let text = box.options[box.selectedIndex].innerText;

            // 선택된 값들을 화면에 표시
            addSelection(text);

            // 선택된 값들을 input 요소에 저장하여 서버로 전송
            let selectedValuesInput = document.getElementById('selectedValuesInput');
            let selectedValues = selectedValuesInput.value.split(',').filter(Boolean); // 기존에 선택된 값들을 배열로 가져오기
            selectedValues.push(text); // 새로 선택된 값을 배열에 추가
            selectedValuesInput.value = selectedValues.join(','); // 쉼표를 구분자로 선택된 값들을 문자열로 저장
        }

        function addSelection(text) {
            let container = document.getElementById('selectedValuesOutput');
            
            let div = document.createElement('div');
            div.style.display = 'flex';
            div.style.justifyContent = 'space-between';
            div.style.alignItems = 'center';
            div.style.border = '1px solid silver';
            div.style.width = '200px';
            div.style.height = '30px';
            div.style.marginBottom = '20px'; // 각 선택 항목 사이의 간격을 조정하기 위해 추가
            div.classList.add('form-control');
            div.classList.add('py-4');
            
            div.innerHTML =
                `<div>\${text}</div>` +
                `<div><button type='button' class='btn btn-danger' style='border-radius:100%;' onclick='del(event)'>x</button></div>`;
            
            container.appendChild(div);
        }

        function del(event) {
            let button = event.target;
            let parentDiv = button.parentElement.parentElement;
            let valueToRemove = parentDiv.firstChild.innerText.trim(); // 삭제할 값
            parentDiv.remove();
            let selectedValuesInput = document.getElementById('selectedValuesInput');
            let selectedValues = selectedValuesInput.value.split(',').filter(Boolean); // 기존에 선택된 값들을 배열로 가져오기
            
            let indexToRemove = selectedValues.indexOf(valueToRemove); // 삭제할 값의 인덱스 찾기
            if (indexToRemove !== -1) {
                selectedValues.splice(indexToRemove, 1); // 배열에서 삭제할 값 제거
                selectedValuesInput.value = selectedValues.join(',').trim(); // 변경된 값을 다시 input 요소에 저장 (쉼표와 함께)
            }
        };
        
        
        // 주소검색
        $('#addrBtn').on('click',function(){
        	
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	           
	             

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('postAddr').value = data.zonecode;
	                document.querySelector("#addr1").value = data.roadAddress;
//	                 document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
	                
	                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
	            
	            }
	        }).open();

		});
	

</script>

  

<%@include file="/includes/footer.jsp" %>
