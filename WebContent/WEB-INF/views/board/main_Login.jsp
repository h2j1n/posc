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
	.navbar {
	  margin-bottom: 0;
	  border-radius: 0;
	}
	body{
		display: flex;
		justify-content: center;
	}
	#Area{
		width: 60vw;
	}
	#tbArea{
		width: 60vw;
		display: flex;
	}
	#sessionId{
		font-size: 30px;
		color: white;
	
	
	}
</style>
</head>
<body>

<div id="Area">
<!-- header -->
<%@include file="/WEB-INF/views/includes/header_Login.jsp" %>


<div class="jumbotron">
  <div class="container text-center">
    <h1>광고</h1>      
  </div>
</div>
  
<div class="contaisner-fluid bg-3 text-center">    
	<h3>Some of my Work</h3><br>
	<div id="tbArea"></div>
</div>


<br>
<%@include file="/WEB-INF/views/includes/footer.jsp" %>
</div>
<script>






let tbArea = document.querySelector('#tbArea');
let tbl = "";
tbl += `<table border="1" id="table">`;
for(let i=0; i<8; i++){
tbl += `<tr>`;
	for(let j=0; j<4; j++){
		tbl += `<td class="stdGetList">내용</td>`;
	}
tbl += `</tr>`;
}
tbl += `</table>`;
tbArea.insertAdjacentHTML('beforeend', tbl);
let getList =	document.querySelectorAll('.stdGetList');

let table = document.querySelector('#table');
table.style.width = '60vw';
table.style.borderCollapse = 'separate';
table.style.borderSpacing = '10px';
table.style.border = 'none';

getList.forEach(function(e){
	e.style.height = '200px';
	e.style.radius = '20px';
})
</script>
