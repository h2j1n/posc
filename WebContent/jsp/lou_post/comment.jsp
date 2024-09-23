<%@page import="board_post.vo.StcoVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 댓글 -->
<div class="comment_container">
    <div class="commenttitle">
        <img src="/img/comment2.png" alt="댓글 아이콘">
        <h3>댓글</h3>
    </div>
    <div class="divider"></div>
    
    <%
        if (!comments.isEmpty()) {
            for (StcoVO comment : comments) {
    %>
    <div class="comment">
        <div class="comment_header">
            <span class="author"><%= comment.getUser_id() %></span>
            <span class="date"><%= comment.getStco_date() %></span>
        </div>
        <div class="comment_body">
            <span class="comment_content"><%= comment.getStco_cont() %></span>
            
            <%
                // 댓글 작성자의 ID
                int commentUserId = comment.getUser_no();

                // 현재 로그인한 사용자의 ID
                int loggedInUserId = userId != null ? userId : 0; // 만약 세션에 userId가 없으면 0으로 처리
            %>

            <% // 댓글 작성자와 로그인한 사용자가 같을 때만 수정 및 삭제 버튼이 나오도록 함 %>
            <% if (loggedInUserId == commentUserId) { %>
            <!-- 수정 및 삭제 버튼 추가 -->
            <span class="edit_buttons">
                <button class="updatecombtn">
                    <img src="/img/update.png" alt="수정">
                </button>
                <input type="hidden" class="comment_no" value="<%= comment.getStco_no() %>" data-stco-no="<%= comment.getStco_no() %>">
                <button class="delcombtn" data-stco-no="<%= comment.getStco_no() %>">
                    <img src="/img/delete.png" alt="삭제">
                </button>
            </span>
            <% } %>
            
        </div>
    </div>
    <%
            }
        } else {
    %>
    <p>댓글이 없습니다.</p>
    <%
        }
    %>

    <div class="divider"></div>

    <form class="comment_form" method="POST" id="insertcomment">
        <textarea id="comment_input" name="comment_input" placeholder="댓글을 입력하세요" rows="4"></textarea>
        <button type="button" id="addBtn" class="postbtn">등록</button>
    </form>
</div>

<script>
    $(document).on("click", ".updatecombtn", function() {
        var commentDiv = $(this).closest('.comment');
        var commentBody = commentDiv.find('.comment_body');
        var commentContent = commentBody.find('.comment_content').text().trim(); // 기존 댓글 내용 가져오기
        var postNo = <%= request.getParameter("no") %>; // 해당 댓글의 게시글 번호 가져오기
        
        // 기존 댓글 내용을 입력 폼으로 변경
        var updateForm = '<form class="update_comment_form" method="POST" action="/PostBoard/commentupdate.do">' +
                            '<textarea class="update_comment_input" name="update_comment_input" style="width: 930px; height: 120px;" rows="6">' + commentContent + '</textarea>' +
                            '<input type="hidden" name="cono" value="' + commentDiv.find('.comment_no').val() + '">' +
                            '<input type="hidden" name="postNo" value="' + postNo + '">' + // 게시글 번호 추가
                            '<button type="submit" class="update_comment_submit postbtn" style="float: right;">수정</button>' +
                        '</form>';
                        
        commentBody.html(updateForm);
    });

    $(function() {
        var addBtn = $("#addBtn");
        var insertCommentForm = $("#insertcomment");

        // 등록 버튼 클릭 시 이벤트
        addBtn.on("click", function() {
            var comment_input = $("#comment_input").val();

            if (comment_input == null || comment_input == "") {
                alert("댓글을 입력해주세요!");
                return false;
            }

            insertCommentForm.submit(); // 서버로 전송
        });

        // 삭제 버튼 클릭 시 이벤트
        $(document).on("click", ".delcombtn", function() {
            // 확인 창 띄우기
            if (confirm("댓글을 삭제하시겠습니까?")) {
                // 클릭된 삭제 버튼의 부모 요소인 댓글의 input 태그에서 값을 가져옴
                var stco_no = $(this).closest('.comment').find('.comment_no').val();
                // 댓글 번호가 없을 때(값이 null 또는 빈 문자열일 때) 삭제 진행하지 않음
                if (!stco_no) {
                    alert("댓글 번호를 가져올 수 없습니다.");
                    return;
                }
                // 확인을 누르면 삭제 진행
                location.href = "/PostBoard/commentdelete.do?cono=" + stco_no + "&postNo=" + <%= request.getParameter("no") %>;
            }
        });
    });
</script>
