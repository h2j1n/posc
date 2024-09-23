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
	/*** Navbar Start ***/
.navbar .navbar-nav .nav-link {
    padding: 10px 15px;
    font-size: 16px;
    transition: .5s;
}

.navbar {
    height: 100px;
    border-bottom: 1px solid rgba(255, 255, 255, .1);
}

.navbar .navbar-nav .nav-link:hover,
.navbar .navbar-nav .nav-link.active,
.fixed-top.bg-white .navbar .navbar-nav .nav-link:hover,
.fixed-top.bg-white .navbar .navbar-nav .nav-link.active {
    color: var(--bs-primary);
}

.navbar .dropdown-toggle::after {
    border: none;
    content: "\f107";
    font-family: "Font Awesome 5 Free";
    font-weight: 700;
    vertical-align: middle;
    margin-left: 8px;
}

@media (min-width: 1200px) {
    .navbar .nav-item .dropdown-menu {
        display: block;
        visibility: hidden;
        top: 100%;
        transform: rotateX(-75deg);
        transform-origin: 0% 0%;
        border: 0;
        transition: .5s;
        opacity: 0;
    }
}

.dropdown .dropdown-menu a:hover {
    background: var(--bs-secondary);
    color: var(--bs-primary);
}

.navbar .nav-item:hover .dropdown-menu {
    transform: rotateX(0deg);
    visibility: visible;
    background: var(--bs-light) !important;
    border-radius: 10px !important;
    transition: .5s;
    opacity: 1;
}

#searchModal .modal-content {
    background: rgba(255, 255, 255, .8);
}
/*** Navbar End ***/
	
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

<!-- <nav class="nav"  id="unLoginHead"> -->
<!--   <div class="container-fluid"> -->
<!--     <div class="navbar-header"> -->
<!--       <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar"> -->
<!--         <span class="icon-bar"></span> -->
<!--         <span class="icon-bar"></span> -->
<!--         <span class="icon-bar"></span>                         -->
<!--       </button> -->
<!--       <a class="navbar-brand" href="#">POSS</a> -->
<!--     </div> -->
<!--     <div class="collapse navbar-collapse" id="myNavbar"> -->
<!--       <ul class="nav navbar-nav"> -->
<!--         <li class="active"><a href="#">스터디모집</a></li> -->
<!--         <li><a href="#">스터디</a></li> -->
<!--         <li><a href="#">라운지</a></li> -->
<!--         <li><a href="#">POSS-IT</a></li> -->
<!--       </ul> -->
<!--       <ul class="nav navbar-nav navbar-right"> -->
<!--         <li id="a"><a href="#"><span class="glyphicon glyphicon-log-in"></span> 로그인</a></li> -->
<!--         <li id="b"><a href="#"><span class="glyphicon glyphicon-log-in"></span> 회원가입</a></li> -->
        
<!--       </ul> -->
<!--     </div> -->
<!--   </div> -->
<!-- </nav> -->

<div class="container-fluid fixed-top">
    <div class="container px-0">
        <nav class="navbar navbar-light bg-white navbar-expand-xl">
            <a href="index.html" class="navbar-brand"><h1 class="text-primary display-6">POSS</h1></a>
            <button class="navbar-toggler py-2 px-3" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                <span class="fa fa-bars text-primary"></span>
            </button>
            <div class="collapse navbar-collapse bg-white" id="navbarCollapse">
                <div class="navbar-nav mx-auto">
                    <a href="#" class="nav-item nav-link active">스터디모집</a>
                    <a href="#" class="nav-item nav-link">스터디</a>
                    <a href="#" class="nav-item nav-link">라운지</a>
                    <a href="#" class="nav-item nav-link">POSS-IT</a>
                </div>
                <div class="d-flex m-3 me-0">
                    <a href="#" class="nav-item nav-link">로그인</a>
                    <a href="#" class="nav-item nav-link">회원가입</a>
                </div>
            </div>
        </nav>
    </div>
</div>



<script>
document.querySelector('#a').addEventListener('click', function(){
	location.href="/login.do";
})
document.querySelector('#b').addEventListener('click', function(){
	location.href="/join.do";
})




</script>
