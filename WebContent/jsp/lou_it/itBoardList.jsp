<%@page import="java.time.LocalDate"%>
<%@page import="board_it.vo.ItVo"%>
<%@page import="com.itextpdf.text.log.SysoCounter"%>
<%@page import="main.vo.MainHotVO"%>
<%@page import="get_study_user.vo.GetStudyUserVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>


<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page info="copyright by MIS"%>


<%
   List<ItVo> ivList = (List<ItVo>) request.getAttribute("ivList");

Integer adminId = (Integer) session.getAttribute("admNo");
Integer userId = (Integer) session.getAttribute("userNo");
if (userId != null || adminId != null) {
%>
<%@include file="/includes/header_Login.jsp"%>
<%
   } else {
%>

<%@include file="/includes/header_unLogin.jsp"%>
<%
   }
%>



<style>
.dummy {
   width: 100%;
   height: 150px
}

.addGetStudyBtn {
   border-radius: 10px;
   display: flex;
   background-color: #ffb524;
   padding: 10px 40px;
   font-size: x-large;
   color: white;
   border: 5px solid orange;
}

.middle.itImg.img {
   width: 250px;
   height: 200px;
}

.itImg {
   width: 100%;
   height: 180px;
}

.modal-body {
   height: 500px;
}


 .btn_img {
        width: 100%; /* 너비 고정 */
        height: 200px; /* 높이 고정 */
        display: flex;
        justify-content: center;
        align-items: center;
        padding: 0;
        overflow: hidden;
        text-align: center;
    }

    .btn_img img {
        max-width: 100%;
        max-height: 100%;
        width: auto;
        height: auto;
    }

    .card {
        margin-bottom: 20px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        transition: transform 0.3s;
    }

    .card:hover {
        transform: translateY(-10px);
    }

    .card-body {
        text-align: left;
    }

    .card-title {
        font-size: 1.25rem;
        font-weight: bold;
        color: #333;
        margin-bottom: 0.5rem;
    }

    .card-text {
        font-size: 1rem;
        color: #666;
    }

</style>

<div class="dummy"></div>

<div class="container-fluid fruite py-5">
    <div class="container py-5">
        <div class="tab-class text-center">

            <div class="col g-2">
                <div class="row g-2">
					<h1 class="">IT 행사</h1>
                    <div class="col-lg-12 d-flex justify-content-end mb-3 align-items-center">
                        
                        
                        
                        <button type="button" class="btn btn-primary" onclick="window.location.href='/itRegisterBoard.do'">행사 신청</button>

                    </div>

                </div>
            </div>

            <div class="tab-content">
                <div id="tab-1" class="tab-pane fade show p-0 active">
                    <div class="row g-4">
                        <div class="col-lg-12">
                            <div class="row g-4" id="newStudyArea">

                                <!-- 행사 리스트 출력 -->
                                <%
                                for (int i = 0; i < ivList.size(); i++) {
                                %>
                                <div class="col-md-6 col-lg-4 col-xl-3">
                                    <div class="card">
                                        <button type="button" class="btn btn-link btn_img card-img-top"  onclick="window.location.href='/itBoardDetail.do?it_no=<%=ivList.get(i).getIt_no()%>'">
                                            <%=ivList.get(i).getIt_mainimg()%>
                                        </button>
                                        <div class="card-body">
                                            <h5 class="card-title"><%=ivList.get(i).getIt_title()%></h5>
                                            <%
                                            String sDate = ivList.get(i).getIt_sdate();
                                            String eDate = ivList.get(i).getIt_edate();
                                            String endDate = ivList.get(i).getIt_enddate();
                                            String sd = sDate.substring(0, 10);
                                            String ed = eDate.substring(0, 10);
                                            String endD = endDate.substring(0, 10);
                                            %>
                                            <p class="card-text"><%=sd + " ~ " + ed%></p>
                                        </div>
                                    </div>
                                </div>
                                <%
                                }
                                %>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<<script type="text/javascript">

   // p태그에 고정된 이미지 width값 제거
   let imgs = document.querySelectorAll('img');
   
   imgs.forEach(function(img){
      img.style.removeProperty('width');
   });
      
</script>

<!-- Fruits Shop End-->
<script
   src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
   integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
   crossorigin="anonymous"></script>
<script type="text/javascript">









</script>

<%@include file="/includes/footer.jsp"%>
