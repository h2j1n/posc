<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Integer adminId =(Integer)session.getAttribute("admNo");
Integer userId =(Integer)session.getAttribute("userNo");
		if(userId!=null ||adminId!=null){
%>			
<%@include file="/includes/header_Admin.jsp"%>
<% 			
		}else{
%>
<%@include file="/includes/header_unLogin.jsp"%>
<% 			
		}
%>	

<!-- Summernote resources -->
<link href="/css/bootform2.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>

<div>
    <div class="h1ad">
        <h1>광고 문의</h1>
    </div>
        <div class="adAnnoucement">
            <h2>🔥  신청 전 꼭 읽어주세요 🔥</h2>
            <ul>
                <li>메인 광고 배너 권장 사이즈는 (1313 x 373)px 입니다!</li>
                <li>연락 가능한 이메일 주소를 함께 남겨주세요!</li>
                <li>광고에 대한 설명, 관련 URL을 함께 적어주세요!</li>
                <li>광고는 관리자 검토 후 승인되면 첨부하신 사진이 POSS의 메인 화면 배너로 들어갑니다.</li>
            </ul>
        </div>
        
        
        <div class = "adform" style="margin: 0 auto; max-width: 1100px;">
        <form action="/AdInsert_admin.do" method="POST" id="insertAd_admin" enctype="multipart/form-data">
            <div class="formtitle">
                <label for="title" style="font-size: 20px;">광고명</label><br>
                <input type="text" id="title" name="title" placeholder="광고명을 입력해주세요" required><br>
            </div>
            <div class="formtitle">
                <label for="user" style="font-size: 20px;">신청자</label><br>
                <input type="text" id="user" name="user" placeholder="신청자 또는 신청하시는 단체명을 입력해주세요" required><br>
            </div>
            <div class="formtitle">
                <label for="file" style="font-size: 20px;">광고 배너 이미지파일 첨부(권장 사이즈 : 1313 x 373)px</label><br>
                <input type="file" id="file" name="file" required><br>
            </div>
            <label for="content" style="font-size: 20px;"> 관련 내용</label>
            <textarea class="form-control summernote" rows="5" id="content" name="content"></textarea>
        </form>
        
        
        </div>
        
    <div class="post_button">
        <button type="submit" id="addBtn" class="postbtn">광고 신청</button>
    </div>
</div>



<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>   
<!-- Summernote initialization script -->
<script type="text/javascript">
    $.noConflict();
    $(".summernote").summernote({
        height: 503,
        lang: "ko-KR",
        placeholder: '내용을 입력해주세요',
        focus: true,
        toolbar: [
            ['fontname', ['fontname']],
            ['fontsize', ['fontsize']],
            ['style', ['bold', 'italic', 'underline', 'strikethrough', 'clear']],
            ['color', ['forecolor', 'color']],
            ['table', ['table']],
            ['para', ['ul', 'ol', 'paragraph']],
            ['height', ['height']],
            ['insert', ['picture', 'link', 'video']],
            ['view', ['codeview', 'fullscreen', 'help']]
        ],
        fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', '맑은 고딕', '궁서', '굴림체', '돋음체', '바탕체'],
        fontSizes: ['8', '9', '10', '11', '12', '13', '14', '15', '20', '30', '40']
    });
</script>
<script>
$(function(){
    var addBtn = $("#addBtn");
    var insertAd_admin = $("#insertAd_admin");

    addBtn.on("click", function(){
        var title = $("#title").val();
        var content = $("#content").val();
        var file = $("#file").val();
        var user = $("#user").val();

        if (title == null || title == "") {
            alert("제목을 입력해주세요!");
            return false;
        }
        if (user == null || user == "") {
            alert("신청자를 입력해주세요!");
            return false;
        }
        if (file == null || file == "") {
            alert("파일을 첨부해주세요!");
            return false;
        }
        if (content == null || content == "") {
            alert("내용을 입력해주세요!");
            return false;
        }

        insertAd_admin.submit();
    });
});
</script>
<%@include file="/includes/footer.jsp" %>
