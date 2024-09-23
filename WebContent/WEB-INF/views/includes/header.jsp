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
<title>Insert title here</title>
<style>
	/* Remove the navbar's default margin-bottom and rounded borders */ 
	.navbar {
	  margin-bottom: 0;
	  border-radius: 0;
	}
	
	/* Add a gray background color and some padding to the footer */
	footer {
	  background-color: #f2f2f2;
	  padding: 25px;
	}
</style>
</head>
<body>

<nav class="navbar navbar-inverse">
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
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="/Login.do"><span class="glyphicon glyphicon-log-in"></span> 로그인</a></li>
        <li><a href="/Join.do"><span class="glyphicon glyphicon-log-in"></span> 회원가입</a></li>
      </ul>
    </div>
  </div>
</nav>
