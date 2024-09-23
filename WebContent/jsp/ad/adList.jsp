<%@ page import="ad.vo.AdVO" %>
<%@ page import="java.util.List" %>
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





<div class="ad-container">
    <h1>광고내역</h1>
    <div class="ad-button-container">
            <button class="ad-button delete" onclick="deleteAds()">
                <i class="fas fa-trash-alt"></i>
            </button>
            <button class="ad-button approve" onclick="approveAds()">
                <i class="fas fa-check"></i>
            </button>
            <button class="ad-button add" onclick="registerAd()">
                <i class="fas fa-plus"></i>
            </button>
        </div>
    <h3 class="ad-section-spacing">광고 승인 내역</h3>
    <table class="ad-table">
        <!-- 테이블 헤더 -->
        <thead>
        	<colgroup>
                <col style="width: 10%">
                <col>
                <col style="width: 20%">
                <col style="width: 20%">
            </colgroup>
            <tr>
                <th>선택</th>
                <th>광고명</th>
                <th>신청 날짜</th>
                <th>신청자</th>
            </tr>
        </thead>
        <!-- 테이블 내용 -->
        <tbody>
            <% 
            List<AdVO> confirmList = (List<AdVO>) request.getAttribute("confirmList");
            if (confirmList == null || confirmList.isEmpty()) {
            %>
            <tr>
                <td colspan="5">광고 승인 내역이 존재하지 않습니다.</td>
            </tr>
            <% } else {
                for (AdVO adVO : confirmList) {
            %>
            <tr>
                <td class="ad-checkbox-cell">
                    <input type="checkbox" class="adCheckbox">
                </td>
                <td>
                    <a href="<%= request.getContextPath() %>/AdDetail.do?no=<%= adVO.getAd_no()%>">
                        <%= adVO.getAd_title() %>
                    </a>
                </td>
                <td><%= adVO.getAd_date() %></td>
                <td><%= adVO.getAd_user() %></td>
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
                <col style="width: 20%">
            </colgroup>
            <tr>
                <th>선택</th>
                <th>광고명</th>
                <th>신청 날짜</th>
                <th>신청자</th>
            </tr>
        </thead>
        <!-- 테이블 내용 -->
        <tbody>
        <% 
            List<AdVO> adList = (List<AdVO>) request.getAttribute("adList");
            if (adList == null || adList.isEmpty()) {
            %>
            <tr>
                <td colspan="5">광고신청내역이 존재하지 않습니다.</td>
            </tr>
            <% } else {
                for (AdVO adVO : adList) {
            %>
            <tr>
                <td class="ad-checkbox-cell">
                    <input type="checkbox" class="adCheckbox">
                </td>
                <td>
                    <a href="<%= request.getContextPath() %>/AdDetail.do?no=<%= adVO.getAd_no()%>">
                        <%= adVO.getAd_title() %>
                    </a>
                </td>
                <td><%= adVO.getAd_date() %></td>
                <td><%= adVO.getAd_user() %></td>
            </tr>
            <% }
            } %>
        
        
        
        </tbody>
    </table>
</div>

<script>
    function deleteAds() {
        // 광고 목록에서 모든 체크박스 요소를 가져옵니다.
        var checkboxes = document.getElementsByClassName('adCheckbox');
        // 선택된 광고 번호를 저장할 배열을 초기화합니다.
        var selectedAds = [];

        // 각 체크박스에 대해 반복합니다.
        for (var i = 0; i < checkboxes.length; i++) {
            // 만약 현재 체크박스가 선택되었다면 실행합니다.
            if (checkboxes[i].checked) {
                // 현재 체크박스의 부모 요소의 부모 요소(즉, 테이블 행)에서 두 번째 열에 있는 링크 요소의 href 속성 값을 가져와서 광고 번호를 추출합니다.
                var adNo = checkboxes[i].parentNode.parentNode.querySelector('td:nth-child(2) a').getAttribute('href').split('=')[1];
                // 추출된 광고 번호를 배열에 추가합니다.
                selectedAds.push(adNo);
            }
        }

        // 선택된 광고가 하나 이상인지 확인합니다.
        if (selectedAds.length > 0) {
            // 사용자에게 선택한 광고를 삭제할 것인지 확인하는 메시지를 표시합니다.
            if (confirm("선택한 광고를 삭제하시겠습니까?")) {
                // XMLHttpRequest 객체를 생성합니다.
                var xhr = new XMLHttpRequest();
                // 서버의 응답이 도착할 때마다 실행될 함수를 정의합니다.
                xhr.onreadystatechange = function() {
                    // 응답 상태가 DONE 상태인지 확인합니다.
                    if (xhr.readyState == XMLHttpRequest.DONE) {
                        // 서버의 응답이 성공(200)한 경우 페이지를 새로고침합니다.
                        if (xhr.status == 200) {
                            window.location.reload();
                        } else {
                            // 오류 메시지를 표시합니다.
                            alert('삭제 중 오류가 발생했습니다.');
                        }
                    }
                };

                // GET 요청을 사용하여 AdDelete 서블릿을 호출하고 선택된 광고 번호를 전달합니다.
                xhr.open("GET", "/AdDelete.do?no=" + selectedAds.join('&no=') + "&delyn=Y", true);
                // 요청을 전송합니다.
                xhr.send();
            }
        } else {
            // 선택된 광고가 없는 경우 메시지를 표시합니다.
            alert('삭제할 광고를 선택해주세요.');
        }
    }
</script>
<script>
    function approveAds() {
        // 광고 목록에서 모든 체크박스 요소를 가져옵니다.
        var checkboxes = document.getElementsByClassName('adCheckbox');
        // 선택된 광고 번호를 저장할 배열을 초기화합니다.
        var selectedAds = [];

        // 각 체크박스에 대해 반복합니다.
        for (var i = 0; i < checkboxes.length; i++) {
            // 만약 현재 체크박스가 선택되었다면 실행합니다.
            if (checkboxes[i].checked) {
                // 현재 체크박스의 부모 요소의 부모 요소(즉, 테이블 행)에서 두 번째 열에 있는 링크 요소의 href 속성 값을 가져와서 광고 번호를 추출합니다.
                var adNo = checkboxes[i].parentNode.parentNode.querySelector('td:nth-child(2) a').getAttribute('href').split('=')[1];
                // 추출된 광고 번호를 배열에 추가합니다.
                selectedAds.push(adNo);
            }
        }

        // 선택된 광고가 하나 이상인지 확인합니다.
        if (selectedAds.length > 0) {
            // 사용자에게 선택한 광고를 삭제할 것인지 확인하는 메시지를 표시합니다.
            if (confirm("선택한 광고를 승인하시겠습니까?")) {
                // XMLHttpRequest 객체를 생성합니다.
                var xhr = new XMLHttpRequest();
                // 서버의 응답이 도착할 때마다 실행될 함수를 정의합니다.
                xhr.onreadystatechange = function() {
                    // 응답 상태가 DONE 상태인지 확인합니다.
                    if (xhr.readyState == XMLHttpRequest.DONE) {
                        // 서버의 응답이 성공(200)한 경우 페이지를 새로고침합니다.
                        if (xhr.status == 200) {
                            window.location.reload();
                        } else {
                            // 오류 메시지를 표시합니다.
                            alert('승인 중 오류가 발생했습니다.');
                        }
                    }
                };

                // GET 요청을 사용하여 AdDelete 서블릿을 호출하고 선택된 광고 번호를 전달합니다.
                xhr.open("GET", "/AdConfirm.do?no=" + selectedAds.join('&no=') + "&delyn=Y", true);
                // 요청을 전송합니다.
                xhr.send();
            }
        } else {
            // 선택된 광고가 없는 경우 메시지를 표시합니다.
            alert('승인할 광고를 선택해주세요.');
        }
    }
</script>

<script>
    function registerAd() {
        // "/AdInsert_admin.do" 페이지로 이동합니다.
        window.location.href = "<%= request.getContextPath() %>/AdInsert_admin.do";
    }
</script>










<%@include file="/includes/footer.jsp" %>
