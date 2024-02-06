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
<style>
.reviewDetailTitle{
	width: 75rem;
	margin: 0 auto;
}
.reviewDetailTitle h2 {
	width: 75rem;
	padding: 0 4rem;
}
table{
	width: 75rem;
	text-align: center;

}

#secondLine{
	width: 75rem;

}
hr{
	border: 1px solid #000;
}
.textBox{
	width: 75rem;
	height: 45rem;

}
#realTextBox{
	width: 75rem;
	height: 40rem;
	background-color: #f1f3f5;
	border: 0;
}

.comeBack{
	width: 70px;
	cursor: pointer;
   	color: white;
   	border: 0;
   	font-size: 16px;
   	margin: 5px 10px;
   	height: 34px;
   	border-radius: 20px;
   	background-color: #8ba888;
   	border-color: #000;
   	letter-spacing: -0.5px;
   	margin: 1rem 0; 
}

.modify{
	position: relative;
	left:1050px;
	width: 70px;
	cursor: pointer;
   	color: white;
   	border: 0;
   	font-size: 16px;
   	margin: 5px 10px;
   	height: 34px;
   	border-radius: 20px;
   	background-color: #8ba888;
   	border-color: #000;
   	letter-spacing: -0.5px;
   	margin: 1rem 0; 
}
</style>
<body>
   	<div class="wrap">
		<div class="headerBox">
			<%@include file="/WEB-INF/views/user/common/userHeader.jsp"%>
		</div>
   	<div class="reviewDetailTitle">
   		<h2>수강후기</h2>
   	</div>
 
   	<div >
   		<table>
		    <tr>
		        <td>${review.r_title}</td>
		        <td><c:out value="${review.r_writedate}" /></td>
		    </tr>
		</table>
   	</div>
   	<div id="secondLine">
   		<hr>
   	</div>
   	<div class = "textBox">
   		<div class = "subContainer">
   			<input type="text" value="${review.r_content}" readonly id="realTextBox">
   		</div>
   		<button type="button" onclick="location.href='/tobe/user/review/userReviewIndex.do'" class="comeBack">목록</button>
   		<c:if test="${!empty loginInfo}">
   			<button type="button" onclick="location.href='/tobe/user/course/qna/edit.do?review_no=${review.review_no }'" class="modify">수정</button>
		</c:if>
   	</div>
			

		<div class="footerBox">
			<%@include file="/WEB-INF/views/user/common/userFooter.jsp"%>
		</div>
	</div>
</body>
</html>