<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%   
    String userId =(String)session.getAttribute("sessionName");  
      String memberNo = (String)session.getAttribute("memberNo");
    
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style>	
	/* Remove the navbar's default margin-bottom and rounded borders */ 
	.navbar-inverse{
		background-color: none;
	}
	.navbar {
	  margin-bottom: 0;
	  border-radius: 0;
	}
	.footer .footer-item .btn-link {
    line-height: 35px;
    color: rgba(255, 255, 255, .5);
    transition: 0.5s;
	}
	
	.footer .footer-item .btn-link:hover {
	    color: var(--bs-secondary) !important;
	}
	
	.footer .footer-item p.mb-4 {
	    line-height: 35px;
	}
	
	
</style>
</head>
<body>

<nav class="nav" id="unLoginHead"> 
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#">POSS</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#">스터디모집</a></li>
        <li><a href="#">스터디</a></li>
        <li><a href="#">라운지</a></li>
        <li><a href="#">POSS-IT</a></li>
        <li><a href="/LouFreeList.do">게시글  목록</a></li>
        <li><a href="/LoutFreeBoardRegister.do">게시글 등록</a></li>
        <li><%=userId %></li>
        <li><%=memberNo %></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li id="btnOut"><a href="/Logout.do"><span class="glyphicon glyphicon-log-in"></span> 로그아웃</a></li>
        <li id="btnMyPage"><a href="#">마이페이지</a></li>
      </ul>
    </div>
  </div>
</nav>


<script>
let btnOut = document.querySelector('#btnOut');
let btnMyPage = document.querySelector('#btnMyPage');

// btnOut.addEventListener('click', function(){
// 	location.href="/main_unLogin.jsp";
// })
btnMyPage.addEventListener('click', function(){
	location.href="/myPage.do";
})
</script>
