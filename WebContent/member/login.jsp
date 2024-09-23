<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%   
      String memberNo = (String)session.getAttribute("memberNo");
      String sessionName = (String)session.getAttribute("sessionName");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<!--   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<%--   <link href="<%=request.getContextPath() %>/css/login_style.css" rel="stylesheet" type="text/css"> --%>
</head>

<body>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12 mt-5 mb-5 text-center">	
			<h1>CMD</h1>
		</div>
	</div>
	<div class="row">
		<div class="col-md-3"></div>
		<div class="col-md-6">
			<div class="card">
				<div class="card-header text-center">
					<h3>CMD LOGIN</h3>
				</div>
				<div class="card-body">
					<form name="form1" method="post" action="/login.do">
						<div class="mb-3">
							<label for="type" class="form-label">권한</label>
							<select class="form-select" aria-label="Default select example" name="type">
								<option selected>권한을 선택해주세요.</option>
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
							<input type="email" class="form-control" id="mem_pw" name="pass" placeholder="PW">
						</div>
						
						<p><font color="gray" onclick="javascript:location.href='/FindPw.do'">아이디찾기</font> / <font onclick="javascript:location.href=''">비밀번호 찾기</font></p>
						<button type="button" class="btn btn-dark" id="loginBtn" onclick="javascript:location.href='/loginMain.do'">로그인</button>
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
           
<script>




$(document).ready(function(){
    // "권한" 선택 상자가 변경될 때마다 호출되는 함수
    $('select[name=type]').change(function(){
        var selectedOption = $(this).val(); // 선택된 옵션 값 가져오기
        if(selectedOption === "admin") { // 선택된 값이 "관리자"인 경우
            // input 요소의 name 속성을 관리자용으로 변경
            $('#id').attr('name', 'adminId');
            $('#mem_pw').attr('name', 'adminPw');
            $('form').attr('action', '/AdminLogin.do');
            
        } else {
            // 선택된 값이 "사용자"인 경우
            // input 요소의 name 속성을 사용자용으로 변경
            $('#id').attr('name', 'id');
            $('#mem_pw').attr('name', 'pass');
            $('form').attr('action', '/login.do');
            
        }
    });
    
    
    function validateForm() {
        var id = document.forms["form1"]["id"].value;
        var pass = document.forms["form1"]["pass"].value;
        if (id == "" || pass == "") {
            alert("아이디와 비밀번호를 입력해주세요.");
            return false;
        }
    }

    // 로그인 버튼 클릭 시 이벤트 처리
    $('#loginBtn').click(function(){
        // 폼을 서버로 제출
        $('form').submit();
    });
});





















</script>
   
   
   
   
   
</body>
</html>