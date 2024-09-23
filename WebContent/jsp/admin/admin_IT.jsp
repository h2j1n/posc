<%@page import="board_it.vo.ItVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@include file="/includes/header_Admin.jsp" %>

<!-- admin : IT 관리 -->

<%
Integer adminId = (Integer) session.getAttribute("admNo");
%>


<div class="ad-container">
    <h1>IT 행사 관리</h1>
    <div class="ad-button-container">
            <button class="ad-button delete" onclick="del()">
                <i class="fas fa-trash-alt"></i>
            </button>
            <button class="ad-button approve" onclick="permit()">
                <i class="fas fa-check"></i>
            </button>
        </div>
    <h3 class="ad-section-spacing">IT행사 승인 내역</h3>
    <table class="ad-table">
        <!-- 테이블 헤더 -->
        <thead>
        	<colgroup>
                <col style="width: 10%">
                <col>
                <col style="width: 20%">
            </colgroup>
            <tr>
                <th>선택</th>
                <th>행사명</th>
                <th>신청 날짜</th>
            </tr>
        </thead>
        <!-- 테이블 내용 -->
        <tbody>
            <% 
            List<ItVo> It_Y_List = (List<ItVo>) request.getAttribute("It_Y_List");
            if (It_Y_List == null || It_Y_List.isEmpty()) {
            %>
            <tr>
                <td colspan="5">IT행사 승인 내역이 존재하지 않습니다.</td>
            </tr>
            <% } else {
                for (ItVo ityVO : It_Y_List) {
            %>
            <tr>
                <td class="ad-checkbox-cell">
                    <input type="checkbox" class="adCheckbox">
                </td>
                <td>
                    <a href="<%= request.getContextPath() %>/ITDetail.do?no=<%= ityVO.getIt_no()%>">
                        <%= ityVO.getIt_title() %>
                    </a>
                </td>
                <td><%= (ityVO.getIt_sdate().substring(0,10)) %></td>
            </tr>
            <% }
            } %>
        </tbody>
    </table>
    <h3 class="ad-section-spacing">신청 내역</h3>
    <table class="ad-table">
        <!-- 테이블 헤더 -->
        <thead>
        <colgroup>
                <col style="width: 10%">
                <col>
                <col style="width: 20%">
            </colgroup>
            <tr>
                <th>선택</th>
                <th>광고명</th>
                <th>신청 날짜</th>
            </tr>
        </thead>
        <!-- 테이블 내용 -->
        <tbody>
        <% 
            List<ItVo> IT_N_List = (List<ItVo>) request.getAttribute("IT_N_List");
            if (IT_N_List == null || IT_N_List.isEmpty()) {
            %>
            <tr>
                <td colspan="5">광고신청내역이 존재하지 않습니다.</td>
            </tr>
            <% } else {
                for (ItVo itnVO : IT_N_List) {
            %>
            <tr>
                <td class="ad-checkbox-cell">
                    <input type="checkbox" class="itBox">
                </td>
                <td>
                    <a href="<%= request.getContextPath() %>/ITDetail.do?no=<%= itnVO.getIt_no()%>">
                        <%= itnVO.getIt_title() %>
                    </a>
                </td>
                <td><%= (itnVO.getIt_sdate()).substring(0,10) %></td>
            </tr>
            <% }
            } %>
        </tbody>
    </table>
</div>

<script>
function del(){
	let ch = document.querySelectorAll('.itBox');
	let selArr = [];
	
	for(let i=0; i<ch.length; i++){
		if(ch[i].checked){
			let no = ch[i].parentNode.parentNode.querySelector('td:nth-child(2) a').getAttribute('href').split('=')[1];
			console.log(no)
			selArr.push(no);
		}
	}
	
	if(selArr.length>0){
		if(confirm("선택한 홍보를 삭제하시겠습니까?")){
			let xhr = new XMLHttpRequest();
			xhr.onreadystatechange = function(){
				if(xhr.readyState == XMLHttpRequest.DONE){
                    if (xhr.status == 200) {
                        window.location.reload();
                    } else {
                        // 오류 메시지를 표시합니다.
                        alert('삭제 중 오류가 발생했습니다.');
                    }
				}
			};
			
			xhr.open("GET", "/adminITDelete.do?no=" + selArr.join('&no=') + "&delyn=Y", true);
            xhr.send();
			
		}
	}else{
		alert('삭제할 홍보를 선택하세요.');
	}
	
	
}

function permit(){
    
	let ch = document.querySelectorAll('.itBox');

    let selArr = [];

    for (let i=0; i<ch.length; i++) {
        if (ch[i].checked) {
        	let no = ch[i].parentNode.parentNode.querySelector('td:nth-child(2) a').getAttribute('href').split('=')[1];
        	
        	
        	selArr.push(no);
        }
        	
    }

    console.log(selArr)
    
    if (selArr.length > 0) {
        if (confirm("선택한 광고를 승인하시겠습니까?")) {
            let xhr = new XMLHttpRequest();
            xhr.onreadystatechange = function() {
                if (xhr.readyState == XMLHttpRequest.DONE) {
                    if (xhr.status == 200) {
                        window.location.reload();
                    } else {
                        alert('승인 중 오류가 발생했습니다.');
                    }
                }
            };

            xhr.open("GET", "/adminITConfirm.do?no=" + selArr.join('&no=') + "&delyn=Y", true);
            xhr.send();
        }
    } else {
        alert('승인할 광고를 선택해주세요.');
    }
}



</script>


<%@include file="/includes/footer.jsp" %>