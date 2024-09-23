<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    
 <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style >

 .container{
  margin: 10px;
  width: 350px;
  height: 800px;
 
 }
 h4{
 text-align:center;
 
 }
</style>
 
    
    
    
</head>
<br>
<br>


	<div class="col-sm-8 text-left container">
		<h4>회원가입</h4>
	  <hr>
	  <form class="form-horizontal" method="post" onsubmit="valid(event)">
	    <div class="form-group">
	      <label for="id" class="control-label col-sm-2">아이디<span class="rq"> *</span></label>
	      <div class="col-sm-4">
	        <input type="text" class="form-control" id="id" name="id" placeholder="Enter id"
	        required pattern="[a-zA-Z]\w{3,7}">
				
	      </div>
	      <div class="col-sm-6" style="text-align: left;">
<!--             <button type="button" class="btn btn-success btn-sm" id="idChk">중복검사</button> -->
            <span id="disp"></span>
	      </div>
	    </div>
	    
	    <div class="form-group">
	      <label for="pass" class="control-label col-sm-2">비밀번호<span class="rq"> *</span></label>
	      <div class="col-sm-4">
	        <input type="text" class="form-control" id="pass" name="pass"  required
	        pattern="(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$%\^&\*\(\)_\+\|]).{8,}">
	      </div>
	    </div>
	    
	    <div class="form-group">
	      <label for="name" class="control-label col-sm-2">이름<span class="rq"> *</span></label>
	      <span class="sp"></span>
	      <div class="col-sm-4">
	        <input type="text" class="form-control" id="name" name="name"  required
	        pattern="[가-힣]{2,8}">
	      </div>
	    </div>
	    
	    <div class="form-group">
	      <label for="bir" class="control-label col-sm-2">생년월일*</label>
	      <div class="col-sm-4">
	        <input type="date" class="form-control" id="bir" name="birth">
	      </div>
	    </div>
	    
	    <div class="form-group">
	      <label for="hp" class="control-label col-sm-2">연락처<span class="rq"> *</span></label>
	      <div class="col-sm-4">
	        <input type="text" class="form-control" id="hp" name="tel" placeholder="010-0000-0000"  required
	        pattern="[0-9]{2,3}-\d{3,4}-[0-9]{4}">
	      </div>
	    </div>
	    
	    <div class="form-group">
	      <label for="add1" class="control-label col-sm-2">우편번호<span class="rq"> *</span></label>
	      <div class="col-sm-4">
	        <input type="text" class="form-control" id="postAddr" name="mem_zip"  required>
	      </div>
	      <div class="col-sm-6" style="text-align: left;">
	        <button type="button" id="addrBtn" class="btn btn-info btn-sm">주소검색</button>
	      </div>
	    </div>
	    
	    <div class="form-group">
	      <label for="addr1" class="control-label col-sm-2">주소<span class="rq"> *</span></label>
	      <div class="col-sm-6">
	        <input type="text" class="form-control" id="addr1" name="mem_add1" readonly>
	      </div>
	    </div>
	    
	    <div class="form-group">
	      <label for="addr2" class="control-label col-sm-2">상세주소<span class="rq"> *</span></label>
	      <div class="col-sm-6">
	        <input type="text" class="form-control" id="addr2" name="mem_add2" required>
	      </div>
	    </div>
	    <div class="form-group">
	      <label for="mail" class="control-label col-sm-2">이메일*</label>
	      <div class="col-sm-4">
	        <input type="email" class="form-control" id="email" name="mem_mail">
	      </div>
	    </div>
	    
	    
	    <div class="form-group">
	      <div class="col-sm-offset-2 col-sm-6">
	        <button class="btn btn-default" id="joinBtn">가입하기</button>
	        <span id="joinspan"></span>
	      </div>
	    </div>
	  </form>

	</div>
	
	
	
	
	
	</html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
   <script type="text/javascript">
   

   
        $(function(){
             var joinBtn = $("#joinBtn");
             //목록 버튼 클릭 시 이벤트 -->
              joinBtn.on('click',function(){ 
            if(confirm('회원가입에 성공하셨습니다!!')){ 
               
            document.querySelector('#joinform').submit(); 
         
               
            } 
            
               
             }); 

          });


   
   
   
   
   
   
   
   //회원가입 





   
   
   
   
   
   
      </script>






   
   
   
   
   
