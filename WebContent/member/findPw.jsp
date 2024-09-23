<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%
    	
    	String findId = (String)request.getAttribute("findId");
    
    
    %>
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<%-- <%@include file="/WEB-INF/views/includes/headerDesign.jsp" %> --%>
<div class="container">
	<div class="row">
		<div class="col-md-12">
			<h4>비밀번호 첮가 </h4>
		</div>
	</div>
	<div class="row">
		<div class="col-md-6">
			<form class="form-horizontal" id="loginForm">
				<div class="form-group">
					<label for="name" class="control-label col-sm-2">이름<span
						class="rq"> *</span></label> <span class="sp"></span>
					<div class="col-sm-4">
						<input type="text" class="form-control" id="name" name="name"
							required pattern="[가-힣]{2,8}">
					</div>
				</div>

				<div class="form-group">
					<label for="bir" class="control-label col-sm-2">생년월일*</label>
					<div class="col-sm-4">
						<input type="text" class="form-control" id="bir" name="birth">
					</div>
				</div>

				<div class="form-group">
					<label for="hp" class="control-label col-sm-2">E-mail<span
						class="rq"> *</span></label>
					<div class="col-sm-4">
						<input type="text" class="form-control" id="hp" name="email"
							placeholder="010-0000-0000" required
							pattern="[0-9]{2,3}-\d{3,4}-[0-9]{4}">
					</div>
				</div>



				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-6">
						<button type="button" class="btn btn-default" id="findId">ID찾기</button>
						<span id="joinspan"></span>
					</div>
				</div>
			</form>
		</div>
		<div class="col-md-6">
			<div class="card">
				<div class="card-header card-primary">
					<h3>아이디 찾기 결과</h3>
				</div>
				<div class="card-body">
					<p id="output" style="font-size:24px; color: red;"></p>
				</div>
				<div class="card-footer">
					<button type="button" class="btn btn-primary">완료</button>
				</div>
			</div>
		</div>	
	</div>
</div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript">
// 	let joinBtn = document.querySelector('#findId');
// 	joinBtn.addEventListener('click', function(){})
$(function(){
	var findId = $("#findId");
	
	findId.on("click", function(){
		var name = $("#name").val();
		var bir = $("#bir").val();
		var hp = $("#hp").val();
		 
		$.ajax({
			url : "/FindPw.do",
			type: "post",
			data : {
				name : name,
				birth : bir,
				tel : hp
			},
			success: function(res){
				$("#output").text(res);
			}
		});	
	});
});
</script>
</html>



