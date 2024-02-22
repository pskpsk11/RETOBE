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
<title>Tobe 취소신청</title>

<META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
<link rel="stylesheet" href="/tobe/css/user_Header_Footer.css" />

<script type="text/javascript">


</script>

<style>
.main {
	width: 75rem;
}

.container {
	width: 70rem;
	margin: 0 auto;
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

#btnBox {
	margin: 2rem;
    display: flex;
    justify-content: center;
}

#cancelBtn {
	width: 10rem;
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

#cancelReason {
	font-size: 1.25rem;
}

#cancelReasonDetail {
	font-size: 1rem;
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
		<div class="main">
			<div class="container">
				<div class="btitle">
					 <h1>결제취소</h1>
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
							<td><img src="/tobe/img/course_img/${pdvo.teacher_img_org }" style="width: 8rem;"></td>
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
					<table class="payInfo">
						<tr>
							<td style="width: 40%">
								<span style="width: 50%; float: left;">결제 금액</span>
								<span style="width: 50%; float: left;">${pdvo.pay_single}원</span>	
							</td>
							<td style="width: 60%;">주문취소 사유</td>
						</tr>
						<tr>
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
								<c:if test="${pdvo.pay_date != null}">
									<span style="width: 50%; float: left;">${pdvo.pay_date2}</span>
								</c:if>
								<c:if test="${pdvo.pay_date == null}">
									<span style="width: 50%; float: left;">결제 미완료</span>
								</c:if>
							</td>
							<td>
								<p style="height: 1rem; padding: 0; margin: 0;"></p>
								<form method="post" action="userPayCancel.do">
									<div>
										<select id="pay_cancel_reason" name="pay_cancel_reason" class="input">
											<option value="1">단순변심</option>
											<option value="2">수업 불만족</option>
											<option value="3">학원 불만족</option>
											<option value="4">결제방법 변경</option>
											<option value="5">기타</option>
										</select>
									</div>
									<textarea id="pay_cancel_reason_detail" name="pay_cancel_reason_detail" placeholder="주문 취소 사유를 입력해주세요." cols="50" rows="6"></textarea><br><br>
									<button id="cancelBtn" >주문취소하기</button><br><br>
									<input type="hidden" name="detail_no" value="${pdvo.detail_no }">
								</form>
							</td>
						</tr>
					</table>			
				</div>
				<div id="btnBox">
					<button id="backBtn" onclick="location.href='/tobe/user/pay/userPayCompleteDetail.do?detail_no=${pdvo.detail_no}'">이전</button>
				</div>
			</div>
		</div>
		<div class="footerBox">
			<%@include file="/WEB-INF/views/user/common/userFooter.jsp"%>
		</div>
	</div>
</body>
</html>