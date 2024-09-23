<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
    <title>POSS</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">
    


    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap" rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="../library/lightbox/css/lightbox.min.css" rel="stylesheet">
    <link href="../library/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


    <!-- Customized Bootstrap Stylesheet -->
    <link href="../css/bootstrap.min.css?ver1.2" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="../css/style.css?ver1.7" rel="stylesheet">
    
    <!--     폰트 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Inter:wght@100..900&display=swap" rel="stylesheet">
    
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>   
    

    
         
    <% if(request.getRequestURI().contains("Post") ||
    		request.getRequestURI().contains("comment")  || 
    		request.getRequestURI().contains("Free") 
    		|| request.getRequestURI().contains("itBoardDetail")){ %>

    <!-- 공지사항, 댓글 관련 css -->
    <link href="/css/board.css?ver4.3" rel="stylesheet">
    <link href="/css/detailboard.css?ver1.1" rel="stylesheet">
    <link href="/css/board_form.css" rel="stylesheet">
    <link href="/css/comment.css?ver1.0" rel="stylesheet"> 
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    
     
   <% } %>
   
    <% if(request.getRequestURI().contains("adDetail") ){ %>

    <!-- 공지사항, 댓글 관련 css -->
    <link href="/css/board.css" rel="stylesheet">
    <link href="/css/ad_detail.css?ver1.0" rel="stylesheet">
    <link href="/css/board_form.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    
     
   <% } %>
   
    <% if(request.getRequestURI().contains("adList")){ %>
	<link href="/css/ad.css" rel="stylesheet">
    
   <% } %>
    <% if(request.getRequestURI().contains("adForm")){ %>
	<link href="/css/ad_form.css" rel="stylesheet">
    
   <% } %>
    
        
	
        
    
</head>
<body>

<!-- Spinner Start -->
<!--     <div id="spinner" class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center"> -->
<!--         <div class="spinner-grow text-primary" role="status"></div> -->
<!--     </div> -->
    <!-- Spinner End -->


    <!-- Navbar start -->
    <div class="container-fluid fixed-top">
    <div class="container topbar bg-primary d-none d-lg-block">
                <div class="d-flex justify-content-between">
                    <div class="top-info ps-2">
                    </div>
                    <div class="top-link pe-2">
                    </div>
                </div>
            </div>
    
        <div class="container px-0">
            <nav class="navbar navbar-light bg-white navbar-expand-xl">
                <a href="/unLoginMain.do" class="navbar-brand">
                    <h1 class="text-primary display-6">POSS</h1>
                </a>
                <button class="navbar-toggler py-2 px-3" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                        <span class="fa fa-bars text-primary"></span>
                    </button>
                <div class="collapse navbar-collapse bg-white" id="navbarCollapse">
                    <div class="navbar-nav mx-auto">
                        <a href="/studyMain.do" class="nav-item nav-link " style="">스터디</a>
                        <a href="/getStudy.do" class="nav-item nav-link">스터디 모집</a>
                        <div class="nav-item dropdown">
                           <a href="" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"">라운지</a>
                           <div class="dropdown-menu m-0 bg-secondary rounded-0">
                               <a href="/LouFreeList.do" class="dropdown-item">자유 라운지</a>
                               <a href="/PostBoard/List.do" class="dropdown-item">공지사항</a>
                           </div>
                        </div>
                        <a href="/itBoardList.do" class="nav-item nav-link">POSS-IT</a>
                    </div>
                    
                    <!-- 아이콘 -->
                    
                    <div class="d-flex m-3 me-0">
                        
                        <a href="/login.do" class="position-relative me-4 my-auto">
                            <i class="bi bi-box-arrow-in-right">로그인</i>
                        </a>
                        <a href="/join.do" class="my-auto">
                            <i class="bi bi-person-fill-add">회원가입</i>
                        </a>
                    </div>
                    
                    <!-- 아이콘 -->
                    
                </div>
            </nav>
        </div>
    </div>

    <!-- Navbar End -->