<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String findId = (String)request.getAttribute("findId");
%>
<%@include file="/includes/header_unLogin.jsp" %>

<style>
    /* 공통 버튼 스타일 */
    .btn {
        padding: 10px 20px;
        font-size: 18px;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s;
    }

    .btn-primary {
        background-color: #77d38e; /* 밝은 연두색 */
        color: #fff;
        border: none;
    }

    .btn-primary:hover {
        background-color: #64c878; /* 더 진한 연두색 */
    }

    .btn-info {
        background-color: #77d38e; /* 밝은 연두색 */
        color: #fff;
        border: none;
    }

    .btn-info:hover {
        background-color: #64c878; /* 더 진한 연두색 */
    }

    .btn-default {
        background-color: #77d38e; /* 밝은 연두색 */
        color: #fff;
        border: none;
    }

    .btn-default:hover {
        background-color: #64c878; /* 더 진한 연두색 */
    }

    /* 주소 검색 버튼 스타일 */
    #addrBtn {
        padding: 8px 16px;
        font-size: 16px;
        border-radius: 5px;
    }

    .selectedSkill {
        display: inline-flex;
        align-items: center;
        background-color: #f0f0f0;
        border: 1px solid #ccc;
        border-radius: 5px;
        padding: 5px 10px;
        margin-right: 10px;
        margin-bottom: 10px;
    }

    .selectedSkillText {
        margin-right: 10px;
    }

    .selectedSkillClose {
        background-color: transparent;
        border: none;
        cursor: pointer;
        color: #888;
        font-weight: bold;
        font-size: 16px;
    }
</style>

<div class="container mt-5">
    <div class="row">
        <div class="col-md-12" style="margin-top:200px">
            <h4>ID 찾기</h4>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            <form class="form-horizontal" id="loginForm">
                <div class="form-group row mb-3">
                    <label for="name" class="col-sm-2 col-form-label">이름<span class="rq"> *</span></label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="name" name="name" required pattern="[가-힣]{2,8}" placeholder="이름을 입력해주세요">
                    </div>
                </div>

                <div class="form-group row mb-3">
                    <label for="bir" class="col-sm-2 col-form-label">생년월일<span class="rq"> *</span></label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="bir" name="birth" placeholder="ex)2024-00-00">
                    </div>
                </div>

                <div class="form-group row mb-3">
                    <label for="hp" class="col-sm-2 col-form-label">연락처<span class="rq"> *</span></label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="hp" name="tel" placeholder="010-0000-0000" required pattern="[0-9]{2,3}-\d{3,4}-[0-9]{4}">
                    </div>
                </div>

                <div class="form-group row mb-3">
                    <div class="col-sm-offset-2 col-sm-10 text-start">
                        <button type="button" class="btn btn-primary" id="findId">ID 찾기</button>
                        <span id="joinspan"></span>
                    </div>
                </div>
            </form>
        </div>

        <div class="col-md-6">
            <div class="card">
                <div class="card-header bg-primary text-white">
                    <h3>아이디 찾기 결과</h3>
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
    var findId = $("#findId");
    var completeBtn = $("#completeBtn");

    findId.on("click", function() {
        var name = $("#name").val();
        var bir = $("#bir").val();
        var hp = $("#hp").val();

        $.ajax({
            url: "/FindId.do",
            type: "post",
            data: {
                name: name,
                birth: bir,
                tel: hp
            },
            success: function(res) {
                if (res) {
                    $("#output").text(name + ' 회원님의 ID는 ' + res + '입니다.');
                } else{
                    $("#output").text("일치하는 ID 없음");
                }
            },
            error: function(xhr, status, error) {
                $("#output").text("일치하는 ID 없음");
            }
        });
    });

    completeBtn.on("click", function() {
        if (confirm("로그인 페이지로 이동하겠습니까?")) {
            window.location.href = "/login.do";  // 로그인 페이지로 이동
        }
    });
});

</script>

<%@include file="/includes/footer.jsp" %>
