<%@ page import="ad.vo.AdVO"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    Integer adminId = (Integer) session.getAttribute("admNo");
    Integer userId = (Integer) session.getAttribute("userNo");
    if (userId != null || adminId != null) {
%>      
    <%@include file="/includes/header_Admin.jsp"%>
<%
    } else {
%>
    <%@include file="/includes/header_unLogin.jsp"%>
<%
    }
%>   

<%
    // 게시글 객체와 댓글 리스트를 가져옴
    AdVO adVO = (AdVO) request.getAttribute("adVO");
    
    // 게시글 번호를 가져옴
    int adNo = 0;
    if (adVO != null) {
        adNo = adVO.getAd_no();
    }
%>

<div class="h1title">
    <h1>광고 신청 내역</h1>
</div>

<div class="detailboard">
    <div class="white_box2" id="whiteBox">
        <div class="post_info">
            <div class="h4title">
                <h4><%= adVO.getAd_title() %></h4>
            </div>
            <div class="post_meta post_user">
                <h5>작성자 : <%= adVO.getAd_user() %></h5>
            </div>
        </div>
        
        <div class="post_content">
            <p id="postContent">
                <%= adVO.getAd_content()%>
            </p>
        </div>
        <div class="file_down">
            <a href="/AdDownload.do?fileName=<%= adVO.getAd_file() %>" download class="f_c" target="_blank">
                <img src="/img/file.png" alt="다운로드">
                <span> [ 첨부파일 ]</span>
                <span title="다운로드"><%= adVO.getAd_file() %></span>
            </a>
        </div>
    </div>
</div>

<div class="write_button2">
    <button onclick="location.href='/AdList.do'" class="postbtn3">광고 내역</button>
</div>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>   

<%@include file="/includes/footer.jsp" %>
