<%@page import="get_study_user.vo.SkillVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/includes/header_unLogin.jsp" %>




<%
List<SkillVO> skillList = (List<SkillVO>) request.getAttribute("skills");

String msg = session.getAttribute("msg1") == null ? "" : (String) session.getAttribute("msg1");

session.removeAttribute("msg1");
%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

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






<%
	if (msg != null && !msg.isEmpty()) {
%>
<script>
	alert('<%=msg%>');
</script>

<%
	msg = null;
}
%>

<div class="col-sm-8 text-left container" style="margin-top:200px">
	<h4>POSS 회원가입</h4>
	<hr>
	<form class="form-horizontal" method="post" action="/join.do"
		id="formTest">
	
<div class="form-group row mb-3">
    <label for="id" class="control-label col-sm-2 col-form-label text-sm-end">아이디<span class="rq"> *</span></label>
    <div class="col-sm-4">
        <div class="input-group">
            <input type="text" class="form-control" id="id" name="id" placeholder="ID를 입력해주세요" required>
            <span class="input-group-text"><i class="fas fa-user"></i></span>
        </div>
    </div>
    <div class="col-sm-6" style="text-align: left;">
        <button class="btn btn-primary" id="duplicateCheckBtn">
            중복 체크
        </button>
    </div>
</div>

<div class="form-group row mb-3">
    <label for="pass" class="control-label col-sm-2 col-form-label text-sm-end">비밀번호<span class="rq"> *</span></label>
    <div class="col-sm-4">
        <div class="input-group">
            <input type="password" class="form-control" id="pass" name="pass" placeholder="비밀번호를 입력해주세요" required>
            <span class="input-group-text"><i class="fas fa-lock"></i></span>
        </div>
    </div>
</div>

<div class="form-group row mb-3">
    <label for="pass_confirm" class="control-label col-sm-2 col-form-label text-sm-end">비밀번호 확인<span class="rq"> *</span></label>
    <div class="col-sm-4">
        <div class="input-group">
            <input type="password" class="form-control" id="pass_confirm" name="pass_confirm" placeholder="입력한 비밀번호를 확인 해주세요" required>
            <span class="input-group-text"><i class="fas fa-lock"></i></span>
        </div>
    </div>
</div>


	<div class="form-group row mb-3">
    <label for="name" class="control-label col-sm-2 col-form-label text-sm-end">이름<span class="rq"> *</span></label>
    <div class="col-sm-4">
        <input type="text" class="form-control" id="name" name="name" required>
    </div>
</div>

<div class="form-group row mb-3">
    <label for="bir" class="control-label col-sm-2 col-form-label text-sm-end">생년월일<span class="rq"> *</span></label>
    <div class="col-sm-4">
        <input type="date" class="form-control" id="bir" name="birth" required>
    </div>
</div>

<div class="form-group row mb-3">
    <label for="hp" class="control-label col-sm-2 col-form-label text-sm-end">연락처<span class="rq"> *</span></label>
    <div class="col-sm-4">
        <input type="text" class="form-control" id="hp" name="tel" placeholder="010-0000-0000" required>
    </div>
</div>

<div class="form-group row mb-3">
    <label for="add1" class="control-label col-sm-2 col-form-label text-sm-end">우편번호<span class="rq"> *</span></label>
    <div class="col-sm-4">
        <input type="text" class="form-control" id="postAddr" name="zip" required>
    </div>
    <div class="col-sm-6" style="text-align: left;">
        <button type="button" id="addrBtn" class="btn btn-info btn-sm">주소검색</button>
    </div>
</div>

<div class="form-group row mb-3">
    <label for="addr1" class="control-label col-sm-2 col-form-label text-sm-end">주소<span class="rq"> *</span></label>
    <div class="col-sm-6">
        <input type="text" class="form-control" id="addr1" name="add1" readonly>
    </div>
</div>

<div class="form-group row mb-3">
    <label for="addr2" class="control-label col-sm-2 col-form-label text-sm-end">상세주소<span class="rq"> *</span></label>
    <div class="col-sm-6">
        <input type="text" class="form-control" id="addr2" name="add2" required>
    </div>
</div>

<div class="form-group row mb-3">
    <label for="mail" class="control-label col-sm-2 col-form-label text-sm-end">이메일<span class="rq"> *</span></label>
    <div class="col-sm-4">
        <input type="email" class="form-control" id="email" name="email" required>
    </div>
</div>

<div class="form-group row mb-3">
    <label for="favorite" class="control-label col-sm-2 col-form-label text-sm-end">기술스택<span class="rq"> *</span></label>
    <div class="col-sm-8">
        <div class="row" id="skillDiv">
            <% for (SkillVO sv : skillList) { %>
                <div class="col-md-4">
                    <div class="form-check">
                        <input class="form-check-input skill" type="checkbox" name="skills" id="skill_<%=sv.getSgdt_No()%>" value="<%=sv.getSgdt_Name()%>" data-skill="<%=sv.getSgdt_Name()%>">
                        <label class="form-check-label" for="skill_<%=sv.getSgdt_No()%>">
                            <%=sv.getSgdt_Name()%>
                        </label>
                    </div>
                </div>
            <% } %>
        </div>
    </div>
</div>




<div class="form-group row mb-3">
    <label class="control-label col-sm-2 col-form-label text-sm-end">선택된 기술스택:</label>
    <div class="col-sm-4">
        <div id="selectedSkills"></div>
    </div>
</div>

<div id="selectedValuesOutput" style="margin-top: 10px;"></div>


<div class="form-group row">
    <div class="offset-sm-2 col-sm-6">
        <button class="btn btn-default d-block mx-auto" id="joinBtn">가입하기</button>
        <span id="joinspan"></span>
    </div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="js/jquery.min.js"><\/script>')</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
$(function() {
    $('#joinBtn').on('click', function() {
        var id = $('#id').val();
        var pass = $('#pass').val();
        var pass_confirm = $('#pass_confirm').val();
        var name = $('#name').val();
        var bir = $('#bir').val();
        var hp = $('#hp').val();
        var postAddr = $('#postAddr').val();
        var addr1 = $('#addr1').val();
        var addr2 = $('#addr2').val();
        var email = $('#email').val();
        var selectedSkills = $('input[name="skills"]:checked').map(function(){
            return $(this).val();
        }).get().join(',');

        console.log(selectedSkills);
        if (!id || !pass || !pass_confirm || !name || !bir || !hp || !postAddr || !addr1 || !addr2 || !email ) {
            alert('모든 필수정보를 입력해주세요.');
            return false;
        }

        if (pass !== pass_confirm) {
            alert('비밀번호가 일치하지 않습니다.');
            $('#pass_confirm').css('border-color', 'red');
            return false;
        } else {
            $('#pass_confirm').css('border-color', '');
        }

        $('#selectedValuesInput').val(selectedSkills);
        $('#formTest').submit();
    });

    $('#duplicateCheckBtn').on('click', function() {
        var userId = $('#id').val();

        if (!userId) {
            alert('아이디를 입력해주세요.');
            return;
        }

        $.ajax({
            type: 'get',
            url: '/jsp/member/idChk.jsp?userId=' + userId,
            success: function(rst) {
                var obj = JSON.parse(rst);
                if (obj.rst === "ok") {
                    alert(userId + '사용 가능한 ID입니다');
                } else {
                    alert(userId + '이미 존재하는 ID입니다');
                }
            },
            error: function(xhr) {
                alert('중복 체크 중 오류가 발생했습니다. 상태 코드: ' + xhr.status);
            }
        });
    });

    $('#addrBtn').on('click', function() {
        new daum.Postcode({
            oncomplete: function(data) {
                $('#postAddr').val(data.zonecode);
                $('#addr1').val(data.address);
                $('#addr2').focus();
            }
        }).open();
    });

    $('input[name="skills"]').on('change', function() {
        var selectedSkills = [];
        $('input[name="skills"]:checked').each(function() {
            selectedSkills.push($(this).next('label').text());
        });
        $('#selectedSkills').empty();
        selectedSkills.forEach(function(skill) {
            addSelection(skill);
        });
    });

    function addSelection(text) {
        var container = $('#selectedSkills');
        var div = $('<div></div>').addClass('selectedSkill');
        var skillText = $('<span></span>').text(text.replace(/,/g, '')).addClass('selectedSkillText');
        var closeButton = $('<button></button>').attr('type', 'button').html('&times;').addClass('selectedSkillClose');
        closeButton.on('click', function(event) {
            del(event);
        });
        div.append(skillText).append(closeButton);
        container.append(div);
    }

    function del(event) {
        var selectedSkill = $(event.target).closest('.selectedSkill');
        var valueToRemove = selectedSkill.find('.selectedSkillText').text().trim();
        selectedSkill.remove();
        $('input[name="skills"][value="' + valueToRemove + '"]').prop('checked', false);
    }
});


</script>



<%@include file="/includes/footer.jsp"%>