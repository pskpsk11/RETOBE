<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강후기</title>
<META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
</head>
<style>
p{
	font-size: large;
}
.mainContent{
   width: 100%;
   display: block;
}
.subContentBar{
   margin-left: 800px;
   height: auto;
   display: table-row-group;
   position: absolute;
}
.DetailSelectBtn{
	  cursor: pointer;
      color: black;
      border: 0;
      /* display: flex; */
      /*align-items: center;
      justify-content: center;
      /* position: inherit; */
      font-size: 16px;
      /* padding: 8px 16px; */
      margin: 5px 10px;
      height: 34px;
      border-radius: 20px;
      background-color: #8ba888;
      border-color: #000;
      /* text-align: center; */
      letter-spacing: -0.5px;
      position: relative;
}
.DetailpayBtn{
	cursor: pointer;
	color: white;
	border: 0;
	/* display: flex; */
	/*align-items: center;
	justify-content: center;
	/* position: inherit; */
	font-size: 16px;
	/* padding: 8px 16px; */
	margin: 5px 10px;
	height: 34px;
	border-radius: 20px;
	background-color: #253528; 
	border-color: #000;
	/* text-align: center; */
	letter-spacing: -0.5px;
	position: relative;
}
.reviewQnA{
	width: 100%;
}

.reviewQnA td {
    padding: 10px; /* 셀 안의 내용과 셀 경계 간의 간격 설정 */
    /*border: 1px solid #ddd;*/ /* 셀 경계 선 설정 */
    text-align: center; /* 셀 내용 가운데 정렬 */
}

.reviewQnA tr:first-child {
    /*background-color: #8ba888;*/ /* 첫 번째 행 배경색 설정 */
}
.reviewCol, .cqnaCol{
   display: none;
}
#detailButton, #reviewButton, #cqnaButton{
   width:100%;
   height:100%;
   cursor: pointer;
      color: black;
      border: 1px solid #222222;
      /* display: flex; */
      /*align-items: center;
      justify-content: center;
      /* position: inherit; */
      font-size: 16px;
      /* padding: 8px 16px; */
      margin: 5px 10px;
      height: 34px;
      border-radius: 20px;
      border-color: #000;
      /* text-align: center; */
      letter-spacing: -0.5px;
      position: relative;
}
.subContent{
	margin: 0 auto;
	width: 100%;
	height: auto;
}

.subContentInfo{
	margin: 30px auto;
	width:100%;
	height: auto;
	max-width: 1280px;
	display: flex;
	position: relative;
	flex-direction: column;
	justify-content: flex-end;
	align-items: stretch;
	flex-wrap: nowrap;
}

.subContentLecture{
	width: 100%;
	max-width: 1280px;
	margin: 0 auto;
	padding: 20px 20px 20px 20px;
	position: relative;
}

a {
	text-decoration: none;
	color: #000;
}
.SelectBtn{
	padding: 0 16px;
	cursor: pointer;
   	color: black;
   	border: 1px solid #222222;
   	/* display: flex; */
   	/*align-items: center;
   	justify-content: center;
   	/* position: inherit; */
   	font-size: 16px;
   	/* padding: 8px 16px; */
   	margin: 5px 10px;
   	height: 34px;
   	border-radius: 20px;
   	border-color: #000;
   	/* text-align: center; */
   	letter-spacing: -0.5px;
   	position: relative;
}

.SelectBtn:hover{
	font-weight: bold;
}
.payBtn{
	padding: 0 16px;
	cursor: pointer;
   	border: 1px solid #222222;
	cursor: pointer;
   	color: white;
   	border: 0;
   	/* display: flex; */
   	/*align-items: center;
   	justify-content: center;
   	/* position: inherit; */
   	font-size: 16px;
   	/* padding: 8px 16px; */
   	margin: 5px 10px;
   	height: 34px;
   	border-radius: 30px;
	background-color: #fa0318f0; 
	border-color: #000;
   	/* text-align: center; */
   	letter-spacing: -0.5px;
   	position: relative;
}

.payBtn:hover{
	font-weight: bold;
}
</style>
<script>
document.addEventListener('DOMContentLoaded', function(){
   
    var course_no = <%= request.getParameter("course_no") %>;
    
    $(document).ready(function() {
        document.getElementById('detailButton').click();
    });
    
    function showDetail() {
        $('#showReviewContent, #showQnaContent').hide();
        $('#showDetailContent').show();
        ajaxFuncDetail();
    }

    function showReview() {
        $('#showDetailContent, #showQnaContent').hide();
        $('#showReviewContent').show();
        ajaxFuncReview(1);
    }

    function showQnA() {
        $('#showDetailContent, #showReviewContent').hide();
        $('#showQnaContent').show();
        ajaxFuncQna(1); // 강좌 문의를 가져오는 함수 호출
    }
    
    window.showDetail = showDetail;
    window.showReview = showReview;
    window.showQnA = showQnA;
});

function ajaxFuncDetail(page) {
	$.ajax({
		url: "/tobe/user/userCourseDetailList.do?course_no=${courseInfo.course_no}&page="+page,
		type: 'GET',
		success: function(courseInfoList){
			console.log("반가워");
			console.log(courseInfoList);
			$("#showDetailContent").html(courseInfoList);
		},
		error: function() {
			console.error('강좌 상세 정보를 가져오는데 실패했습니다.');
		}
    });
}
    
function ajaxFuncQna(page) {
	$.ajax({
		url: "/tobe/user/userCourseDetailQnaList.do?course_no=${courseInfo.course_no}&page="+page,
		type: 'GET',
		success: function(courseInfoList){
			console.log("반가워");
			console.log(courseInfoList);
			$("#showQnaContent").html(courseInfoList);
		},
		error: function() {
			console.error('문의 정보를 가져오는데 실패했습니다.');
		}
    });
}

function ajaxFuncReview(page) {
	$.ajax({
		url: "/tobe/user/userCourseDetailReviewList.do?course_no=${courseInfo.course_no}&page="+page,
		type: 'GET',
		success: function(courseInfoList){
			console.log("반가워");
			console.log(courseInfoList);
			$("#showReviewContent").html(courseInfoList);
		},
		error: function() {
			console.error('후기 정보를 가져오는데 실패했습니다.');
		}
    });
}
</script>
<script>  
function setCourseComp(no) {
	  var compT;	
	  $.ajax({    	
        url: "/tobe/user/setCourseComp.do",
        data: {
            course_no: no,
        },
        success: function(res) {
			if (res == "success") {
				console.log("등록 성공");
			}
			if(res=="full"){
				console.log("full");
				alert('비교함이 꽉차있습니다 비교함을 비워주세요.');
			}
        },
        error: function(xhr, status, error) {
            console.error("에러 발생", status, error);
        }
   		});
	}
</script>
<body>
   <div class="wrap">
   <%@include file="/WEB-INF/views/user/common/userSidebar.jsp"%>
   <%@include file="/WEB-INF/views/user/common/userChatBot.jsp"%>
		<div class="headerBox">
			<%@include file="/WEB-INF/views/user/common/userHeader.jsp"%>
		</div>
      <div class = "mainContent">
         <div class = "subContentLecture">
            <div class = "detailContent">
               <!--<c:forEach var="lecture" items="${lectureList }">
                   <p><img src="${lecture.teacher_img_org}" alt="강사 이미지" width="50" height="50"></p>
                      <p>${lecture.cname}</p>
                      <p>${lecture.time}</p>
                      <p>${lecture.price}</p>
                  </c:forEach> -->
                  	<c:if test="${not empty courseInfo}">
                   		<p><img src="/tobe/img/course_img/${courseInfo.teacher_img_org}" alt="강사 이미지" style="width: 120px; height:120px;"></p>
                   		<p>${courseInfo.cname}</p>
                   		<p>${courseInfo.time}</p>
                   		<p>${courseInfo.price}</p>
               		</c:if>
            </div>
            <div class = "subContentBar">
                <table>
                   <tr>
					  <td><button type="button" onclick="location.href='/tobe/user/basket.do?course_no=${courseInfo.course_no}'" class="SelectBtn">장바구니 담기</button></td>
					  <td><button type="button" onclick="setCourseComp('${courseInfo.course_no}');" class="SelectBtn">비교함 담기</button></td>
					  <td><button type="button" onclick="location.href='/tobe/user/mainPayDetail.do?course_no=${courseInfo.course_no}'" class="payBtn">결제 하기</button></td>
                   </tr>
                </table>
            </div>
         </div>
         <div class = "subContentInfo">
            <div class = "detailContent">
               <table class = "reviewQnA">
                  <tr>
                      <td><button type="button" id="detailButton" onclick="showDetail()">강좌 상세 내용</button></td>
                      <td><button type="button" id="reviewButton" onclick="showReview()">강좌 후기</button></td>
                      <td><button type="button" id="cqnaButton" onclick="showQnA()">강좌 문의</button></td>
                  </tr>
               </table>
            </div>
         
	         <div class = "subContent">
	            <div id = "showDetailContent">
	            </div>
	            <div id = "showReviewContent">
	            </div>
	            <div id = "showQnaContent">
	            </div>
	         </div>
         </div>
      </div>
		<div class="footerBox">
			<%@include file="/WEB-INF/views/user/common/userFooter.jsp"%>
		</div>
   </div>
</body>
</html>