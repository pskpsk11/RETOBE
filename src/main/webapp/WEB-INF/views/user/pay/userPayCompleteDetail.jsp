<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="javax.servlet.*,javax.servlet.http.*" %>
<%@ page import="kr.co.retobe.util.CodeToString"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Tobe 주문정보</title>

<META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />

<script type="text/javascript">

$(function(){
	document.getElementById('cancelBtn').addEventListener('click', function () {
	    document.getElementById('popup').style.display = 'block';
	});

	document.getElementById('confirmButton').addEventListener('click', function () {
		window.location.href = '/tobe/user/pay/userPayCancelForm.do?detail_no=${pdvo.detail_no}';
	});

	document.getElementById('cancelButton').addEventListener('click', function () {
	    document.getElementById('popup').style.display = 'none';
	    // 여기에 취소 버튼을 눌렀을 때의 동작을 추가
	    // 예를 들어, 아무 동작도 하지 않거나 다른 작업을 수행할 수 있습니다.
	});
})



</script>

<style>
.container {
	width: 75rem;
	padding: 0 2.5rem;
}

.btitle {
	color: #49654e;
}
.courseInfo {
	width:  70rem;
	border-top: 1px solid #ddd;
	border-bottom: 1px solid #ddd;
}

#firstRow {
	font-size: 1.25rem;
	height: 3rem;
	background-color: #F5F5F5;
}

#secondRow {
	height: 10rem;
	font-size: 1.5rem;
	font-weight: bolder;
}

.courseInfo td {
	width: 25%;
	text-align: center;
}

.payInfo {
	width:  70rem;
	border: 3px solid #000;
	text-align: center;
}

.payInfo tr:first-child {
	height: 3rem;
	font-size: 1.25rem;
	font-weight: bolder;
}
.payInfo tr:last-child {
	background-color: #F5F5F5;
}

.payInfo td {
	width: 33.3%;
}

.payInfo div {
	height: 3rem;
}

.payInfo span {
	height: 3rem;
	padding: 0.5rem;
}

#minusImg {
	position: absolute;
	top: 41.5rem;
	left: 25rem;
	width: 2rem;
}

#equalImg {
	position: absolute;
	top: 41.5rem;
	left: 48.25em;
	width: 2rem;
}

#btnBox {
	margin: 2rem;
    display: flex;
    justify-content: center;
}

#cancelBtn {
	width: 7rem;
	height: 2.25rem;
	font-size: 1.25rem;
	background-color: #000;
	color: #fff;
	cursor: pointer;
}

#backBtn {
	width: 7rem;
	height: 2.25rem;
	font-size: 1.25rem;
	background-color: #fff;
	color: #000;
	cursor: pointer;
}

.popup {
    display: none;
 	position: fixed;
 	top: 25rem;
 	left: 45rem;
  	z-index: 9999;
    padding: 20px;
    border: 1px solid #ccc;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    width: 30rem;
    height: 20rem;
    font-size: 1.5rem;
}

.popup-content {
	height: 14.5rem;
    text-align: center;
    background-color: #fff;
}

#confirm {
	padding: 4rem 0 2rem;
}
#cancelButton {
	width: 5rem;
	height: 2.25rem;
	font-size: 1.25rem;
	background-color: #fff;
	color: #000;
	cursor: pointer;
}
#confirmButton {
	width: 5rem;
	height: 2.25rem;
	font-size: 1.25rem;
	background-color: #000;
	color: #fff;
	cursor: pointer;
}


</style>

</head>
<body>
	<div class="wrap">
	<%@include file="/WEB-INF/views/user/common/userSidebar.jsp"%>
    <%@include file="/WEB-INF/views/user/common/userChatBot.jsp"%>
		<div class="headerBox">
			<%@include file="/WEB-INF/views/user/common/userHeader.jsp"%>
		</div>
		<div class="container">
			<div class="btitle">
				 <h1>결제정보</h1>
			</div>
			<div class="title">
				<h2>주문상품</h2>
			</div>
			
			<div>
				<table class="courseInfo">
					<tr id="firstRow">
						<th></th>
						<th>강좌정보</th>
						<th>가격</th>
						<th>총상품금액</th>
					</tr>
					<tr id="secondRow">
						<td><img src="/tobe/img/course_img/${pdvo.teacher_img_org}" style="width: 8rem;"></td>
						<td>
							<span style="font-size: 1.25rem;">강좌명 : ${pdvo.i_cname }</span><br>
							<span style="font-size: 1rem; font-weight: normal;">개강일 : ${pdvo.i_startday }</span><br>
							<span style="font-size: 1rem; font-weight: normal;">종강일 : ${pdvo.i_endday}</span>
						</td>
						<td>${pdvo. pay_single}원</td>
						<td>${pdvo. i_price}원</td>
					</tr>
				</table>
			</div>
			
			<div class="title">
				<h2>결제 정보</h2>
			</div>
			
			<div>
				<img id="minusImg" src="/tobe/img/minus.png">
				<img id="equalImg" src="/tobe/img/equal.png">
				<table class="payInfo">
					<tr>
						<td>
							<span style="width: 50%; float: left;">총 주문 금액</span>
							<span style="width: 50%; float: left;">${pdvo. i_price}원</span>
						</td>
						<td>
							<span style="width: 50%; float: left;">총 할인 금액</span>
							<c:set var="discount" value="${pdvo.i_price - pdvo.pay_single }"/>
							<span style="width: 50%; float: left;"><c:out value="${discount }원"/></span>		
						</td>
						<td>
							<span style="width: 50%; float: left;">결제 금액</span>
							<span style="width: 50%; float: left;">${pdvo.pay_single}원</span>	
						</td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td style="font-size: 1.25rem;">
						<c:set var="pay_complete" value="${CodeToString.payCompleteToString(pdvo.pay_complete)}" />
						<c:set var="pay_by" value="${CodeToString.paybyToString(pdvo.pay_by)}" />
							<span style="width: 50%; float: left;">진행상황</span>
							<span style="width: 50%; float: left;">${pay_complete}</span>	
							<span style="width: 50%; float: left;">결제 방법</span>
							<span style="width: 50%; float: left;">${pay_by}</span>	
							<span style="width: 50%; float: left;">입금계좌</span>
							<span style="width: 50%; float: left;">${pdvo.ad_account}</span>
							<span style="width: 50%; float: left;">예금주</span>
							<span style="width: 50%; float: left;">${pdvo.ad_name}</span>
							<span style="width: 50%; float: left;">결제 완료</span>
							<span style="width: 50%; float: left;">${pdvo.pay_date2}</span>
						</td>
					</tr>
				</table>			
			</div>
			
		<!--  -->
		<div class = "title2">
			<h2>주문자 정보</h2>
		</div>
		
		<table class = "orderer">
			<tr>
				<td style="width:300px; background-color:#F5F5F5">주문하시는 분</td>
				<td style="width:1000px">${pdvo.member_name}</td>
			</tr>
			<tr>
				<td style="background-color:#F5F5F5">이메일 주소</td>
				<td>${pdvo.member_email}</td>
			</tr>
			<tr>
				<td style="background-color:#F5F5F5">휴대폰 번호</td>
				<td>${pdvo.member_hp}</td>
			</tr>			
		</table>
		
		<div class="title3">
			<h2>결제 정보</h2>
		</div>
		
		<table class = "payment">
			<tr>
				<td style="width:300px; background-color:#F5F5F5;">카드 결제</td>
				<td style="width:1000px">${pdvo.pay_single}원</td>
			</tr>
			<tr>
				<td style="background-color:#F5F5F5">포인트 할인</td>
				<td><c:out value="${discount }원"/></td>
			</tr>
		</table>
		<!--  -->
			<div id="btnBox">
				<button id="backBtn" onclick="location.href='/tobe/user/mypage.do'">이전</button>
				<button id="cancelBtn">주문취소</button>
			</div>
		</div>
	
		<div id="popup" class="popup">
		    <div class="popup-content">
		        <p id="confirm"><b>주문을 취소하시겠습니까?</b></p>
		        <button id="cancelButton">취소</button>
		        <button id="confirmButton">확인</button>
		    </div>
		</div>
		
			
		<div class="footerBox">
			<%@include file="/WEB-INF/views/user/common/userFooter.jsp"%>
		</div>
	</div>
</body>
</html>