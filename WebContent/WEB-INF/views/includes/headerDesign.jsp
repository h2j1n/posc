<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%String userId =(String)session.getAttribute("sessionName");  %>
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
	footer {
	  background-color: #f2f2f2;
	  padding: 25px;
	}
	/* Add a gray background color and some padding to the footer */
	
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
      <a class="navbar-brand" href="/a">POSS</a>
    </div>
 
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
