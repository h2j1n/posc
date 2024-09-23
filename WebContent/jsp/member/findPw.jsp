<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String findId = (String)request.getAttribute("findId");
%>
<%@include file="/includes/header_unLogin.jsp" %>

<div class="container mt-5">
    <div class="row">
        <div class="col-md-12" style="margin-top:200px">
            <h4>비밀번호 찾기</h4>
            <hr>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            <form class="form-horizontal" id="loginForm">
                <div class="form-group row mb-3">
                    <label for="id" class="col-sm-2 col-form-label text-sm-end">ID<span class="rq"> </span></label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="id" name="userid" required placeholder="ID를 입력해주세요">
                    </div>
                </div>

                <div class="form-group row mb-3">
                    <label for="name" class="col-sm-2 col-form-label text-sm-end">이름<span class="rq"> </span></label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="name" name="name" required pattern="[가-힣]{2,8}" placeholder="이름을 입력해주세요">
                    </div>
                </div>

                <div class="form-group row mb-3">
                    <label for="bir" class="col-sm-2 col-form-label text-sm-end">생년월일<span class="rq"> </span></label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="bir" name="birth" placeholder="ex)2024-00-00">
                    </div>
                </div>

                <div class="form-group row mb-3">
                    <label for="email" class="col-sm-2 col-form-label text-sm-end">E-mail<span class="rq"> </span></label>
                    <div class="col-sm-10">
                        <input type="email" class="form-control" id="email" name="email" placeholder="example@example.com" required>
                    </div>
                </div>

                <div class="form-group row mb-3">
                    <div class="col-sm-offset-2 col-sm-10 text-start">
                        <button type="button" class="btn btn-primary" id="findPw">비밀번호 찾기</button>
                        <span id="joinspan"></span>
                    </div>
                </div>
            </form>
        </div>

        <div class="col-md-6">
            <div class="card">
                <div class="card-header bg-primary text-white">
                    <h3>비밀번호 찾기 결과</h3>
                </div>
                <div class="card-body">
                    <p id="output" class="text-danger" style="font-size: 24px;"></p>
                </div>
                <div class="card-footer">
                    <button type="button" class="btn btn-primary" id="completeBtn">로그인 페이지로 이동</button>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
    var findPw = $("#findPw");
    var completeBtn = $("#completeBtn");

    findPw.on("click", function() {
        var userid = $("#id").val();
        var name = $("#name").val();
        var bir = $("#bir").val();
        var email = $("#email").val();

        $.ajax({
            url: "/FindPw.do",
            type: "post",
            data: {
                userid: userid,
                name: name,
                birth: bir,
                email: email
            },
            success: function(res) {
                if (res) {
                    $("#output").text('회원님의 비밀번호는 ' + res + '입니다.');
                } else {
                    $("#output").text("입력하신 회원 정보가 일치하지 않습니다.");
                }
            },
            error: function(xhr, status, error) {
                $("#output").text("일치하는 비밀번호 없음");
            }
        });
    });

    completeBtn.on("click", function() {
        if (confirm("로그인 페이지로 이동하시겠습니까?")) {
            window.location.href = "/login.do";  // 로그인 페이지로 이동
        }
    });
});
</script>

<%@include file="/includes/footer.jsp"%>
