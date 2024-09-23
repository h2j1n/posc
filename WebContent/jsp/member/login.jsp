<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%   
      String memberNo = (String)session.getAttribute("memberNo");
      String sessionName = (String)session.getAttribute("sessionName");
      
      
      
  	String msg = session.getAttribute("errorMessage") == null ? "" 
			: (String)session.getAttribute("errorMessage");

  	
  	String msg1 = session.getAttribute("msg1") == null ? "" 
			: (String)session.getAttribute("msg1");
  	
  	
      session.removeAttribute("errorMessage");
      session.removeAttribute("msg1");
      
%>

<%@include file="/includes/header_unLogin.jsp" %>

<%
    if(msg1 != null && !msg1.isEmpty()) {
%>
    <script>
        alert('<%= msg1 %>');
    </script>
  	
<% 
msg1 = null;
    } %>




<%
    if(msg != null && !msg.isEmpty()) {
%>
    <script>
        alert('<%= msg %>');
    </script>
  	
<% 
	msg = null;
    } %>


<div class="container-fluid">
	<div class="row">
		<div class="col-md-12 mt-5 mb-5 text-center">	
			<h1>POSS</h1>
		</div>
	</div>
	<div class="row">
		<div class="col-md-3"></div>
		<div class="col-md-6">
			<div class="card">
				<div class="card-header text-center">
					<h3>POSS LOGIN</h3>
				</div>
				<div class="card-body">
					<form name="form1" method="post" action="/login.do">
						<div class="mb-3">
							<label for="type" class="form-label">권한</label>
							<select class="form-select" aria-label="Default select example" name="type">
								<option selected value="">권한을 선택해주세요.</option>
								<option value="user">사용자</option>
								<option value="admin">관리자</option>
							</select>
						</div>
						<div class="mb-3">
							<label for="id" class="form-label">아이디</label> 
							<input type="email" class="form-control" id="id" name="id" placeholder="ID"/>					
						</div>
						<div class="mb-3">
							<label for="exampleFormControlInput1" class="form-label">비밀번호</label> 
							<input type="password" class="form-control" id="mem_pw" name="pass" placeholder="PW">
						</div>
						
						<p>
						    <font color="gray" onclick="javascript:location.href='/FindId.do'">아이디찾기</font>
						    /
						    <font onclick="javascript:location.href='/FindPw.do'">비밀번호 찾기</font>
						</p>

						<button type="button" class="btn btn-dark" id="loginBtn" >로그인</button>
						<button type="button" class="btn btn-primary" onclick="javascript:location.href='/join.do'">회원가입</button>
					</form>
				</div>
			</div>
		</div>
		<div class="col-md-3"></div>
	</div>
</div>
<!--     <span class="error animated tada" id="msg"></span> -->
<!--     <form name="form1" class="box" method="post" action="/login.do"> -->
<!--       <h4>POSS</h4> -->
<!--         <input type="text" id="userId" name="id" placeholder="ID" autocomplete="off"> -->
<!--         <input type="password" id="userPw" name="pass" placeholder="Passsword" autocomplete="off"> -->
<!--         <label> -->
<!--           <input type="checkbox" id="ch" style="display:block"> -->
<!--           <small class="rmb">관리자 로그인</small> -->
<!--         </label> -->
<!--         <a href="/FindPw.do" class="forgetpass">비밀번호 찾기</a> -->
<!--         <a href="/join.do" class="forgetid">아이디 찾기</a> -->
<!--         <input type="submit" value="로그인" class="btn1" id="loginBtn"> -->
<!--       </form> -->
<!--         <a href="/join.do" class="dnthave">회원가입</a> -->
<!--         <button type="button" id="test">test</button> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>           
<script>



$(document).ready(function(){
    $('#loginBtn').click(function(){
        var selectedOption = $('select[name=type]').val(); // 선택된 옵션 값 가져오기
        var id = $('#id').val(); // 아이디 입력 값 가져오기
        var pass = $('#mem_pw').val(); // 비밀번호 입력 값 가져오기
        
        // 선택된 "권한"이 없는 경우
        if (!selectedOption) {
            alert('권한을 선택해주세요.'); // 알림창 표시
            return; // 로그인 중단
        }
        
        // 아이디 또는 비밀번호가 입력되지 않은 경우
        if (id === "" || pass === "") {
            alert("아이디와 비밀번호를 입력해주세요."); // 알림창 표시
            return; // 로그인 중단
        }
        
        // 선택된 "권한"에 따라 폼의 action 속성 설정
        if (selectedOption === "admin") { // 선택된 값이 "관리자"인 경우
            $('#id').attr('name', 'adminId');
            $('#mem_pw').attr('name', 'adminPw');
            $('form').attr('action', '/AdminLogin.do');
        } else if (selectedOption === "user") { // 선택된 값이 "사용자"인 경우
            $('#id').attr('name', 'id');
            $('#mem_pw').attr('name', 'pass');
            $('form').attr('action', '/login.do');
        } else if(selectedOption === ""){
        	alert('권한이 없습니다!');
        	
        }
        
        // 폼 유효성 검사 수행
        if (!validateForm()) {
            return; // 유효성 검사 통과하지 못한 경우 로그인 중단
        }
        
        // 폼을 서버로 제출
        $('form').submit();
    });
    
    function validateForm() {
        var id = $('#id').val(); // 아이디 입력 값 가져오기
        var pass = $('#mem_pw').val(); // 비밀번호 입력 값 가져오기
        if (id === "" || pass === "") {
            alert("아이디와 비밀번호를 입력해주세요."); // 알림창 표시
            return false; // 유효성 검사 통과 실패
        }
        return true; // 유효성 검사 통과 성공
    }
});






</script>
   
   
   
   
   
<%@include file="/includes/footer.jsp"%>