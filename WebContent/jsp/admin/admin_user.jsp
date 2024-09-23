<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="vo.MemberVO"%>
<%@page import="java.util.List"%>


<%@include file="/includes/header_Admin.jsp" %>

<!-- admin : 회원 관리 -->
<%
Integer adminId = (Integer) session.getAttribute("admNo");
%>

<div id="area" style="margin-top:300px; display:flex; justify-content: center;">
	<div>
		<div style="display:flex; justify-content:space-between; align-items:baseline;">
	    	<h3 style="width:30%">UserList</h3>
			<div class="dropdown" style="width:50%">
				<button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false" style="background-color:white">
					User
				</button>
				<ul class="dropdown-menu">
					<li><a class="dropdown-item" href="/adminManageUser.do">User</a></li>
					<li><a class="dropdown-item" href="/adminManageBlackUser.do">BlackList</a></li>
				</ul>
			</div>
			<div class="search-box" style="width:40%">
				<form action="/adminSearch.do" method="get" style="display: flex">
					<input type="text" name="searchKeyword" placeholder="userNo or userID" required>
					<button type="submit" style="border:none; background-color: white">
						<i class="fas fa-search"></i>
					</button>
					</input>
				</form>
			</div>
			<button id="removeUser" onclick="removeUser()" style="border: none; width:5%">	    	
	    		<i class="fas fa-trash-alt"></i>
	    	</button>
	    </div>
	    <div id="tableArea">
		    <table class="ad-table">
		        <!-- íì´ë¸ í¤ë -->
		        <thead>
		        <colgroup>
		                <col style="width: 10%">
		                <col style="width: 10%">
		                <col>
		                <col style="width: 20%">
		                <col style="width: 20%">
		                <col style="width: 5%">
		            </colgroup>
		            <tr>
		                <th>No</th>
		                <th>ID</th>
		                <th>Address</th>
		                <th>Email</th>
		                <th>Tel</th>
		                <th>Reports</th>
		            </tr>
		        </thead>
		        <!-- íì´ë¸ ë´ì© -->
		        <tbody>
		        <% 
		            List<MemberVO> memList = (List<MemberVO>) request.getAttribute("memList");
		            if (memList == null || memList.isEmpty()) {
		            %>
		            <tr>
		                <td colspan="6">Nothing.</td>
		            </tr>
		            <% } else {
		                for (MemberVO memVO : memList) {
		            %>
		            <tr>
		                <td class="ad-checkbox-cell">
		                    <input type="checkbox" class="chBox">
		                    <span style="display:none"><%=memVO.getUser_no() %></span>
		                </td>
		                <td><%= memVO.getUser_id() %></td>
		                <td><%= memVO.getUser_add1() + memVO.getUser_add2()%></td>
		                <td><%= memVO.getUser_email() %></td>
		                <td><%= memVO.getUser_tel() %></td>
		                <td><%= memVO.getUser_rep_cnt() %></td>
		            </tr>
		            <% }
		            } %>
		        </tbody>
		    </table>
	    </div>
    </div>
</div>
<script>
function removeUser(){
	let chBox = document.querySelectorAll('.chBox');
	let chArr = [];
	
	for(let i=0; i<chBox.length; i++){
		if(chBox[i].checked){
			chArr.push(chBox[i].parentNode.children[1].innerText);
		}
	}
	
	if(chArr.length>0){
		if(confirm("정말로 삭제하시겠습니까?")){
			let xhr = new XMLHttpRequest();
			xhr.onreadystatechange = function(){
				if(xhr.readyState == XMLHttpRequest.DONE){
					if (xhr.status == 200) {
                        window.location.reload();
                    } else {
                        // ì¤ë¥ ë©ìì§ë¥¼ íìí©ëë¤.
                        alert('삭제 중 오류가 발생했습니다.');
                    }
				}
			};
			
			xhr.open("GET", "/adminDeleteUser.do?no=" + chArr.join('&no=') + "&delyn=Y", true);
			xhr.send();
			
		}
	}else{
		alert('회원을 선택해주세요.');
	}
}
</script>


<%@include file="/includes/footer.jsp" %>