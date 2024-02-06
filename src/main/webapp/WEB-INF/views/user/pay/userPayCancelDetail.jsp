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
<title>Tobe 결제 취소 상새</title>

<META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />

<script type="text/javascript">


</script>

<style>
.container {
	width: 70rem;
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
	width: 9rem;
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
		<div class="headerBox">
			<%@include file="/WEB-INF/views/user/common/userHeader.jsp"%>
		</div>
		<div class="container">
			<div class="btitle">
				 <h1>결제취소 상세조회</h1>
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
						<td><img src="/tobe/img/course_img/${pcdi.teacher_img_org }" style="width: 8rem;"></td>
						<td>
							<span style="font-size: 1.25rem;">강좌명 : ${pcdi.i_cname }</span><br>
							<span style="font-size: 1rem; font-weight: normal;">개강일 : ${pcdi.i_startday }</span><br>
							<span style="font-size: 1rem; font-weight: normal;">종강일 : ${pcdi.i_endday}</span>
						</td>
						<td>${pcdi. pay_single}원</td>
						<td>${pcdi. i_price}원</td>
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
							<span style="width: 50%; float: left;">결제취소 금액</span>
							<span style="width: 50%; float: left;">${pcdi.pay_single}원</span>	
						</td>
						<td style="width: 60%;">환불 안내</td>
					</tr>
					<tr>
						<td style="font-size: 1.25rem;">
							<c:set var="pay_refund" value="${CodeToString.payRefundToString(pcdi.pay_refund)}" />
							<c:set var="pay_by" value="${CodeToString.paybyToString(pcdi.pay_by)}" />
							<span style="width: 50%; float: left;">진행상황</span>
							<span style="width: 50%; float: left;">${pay_refund}</span>
							<span style="width: 50%; float: left;">결제방법</span>
							<span style="width: 50%; float: left;">${pay_by}</span>	
							<span style="width: 50%; float: left;">입금계좌</span>
							<span style="width: 50%; float: left;">${pcdi.pay_by_account}</span>
							<span style="width: 50%; float: left;">예금주</span>
							<span style="width: 50%; float: left;">${pcdi.name}</span>
							<span style="width: 50%; float: left;">환불날짜</span>
							<c:if test="${pcdi.pay_refund_date2 != null}">
								<span style="width: 50%; float: left;">${pcdi.pay_refund_date2}</span>
							</c:if>
							<c:if test="${pcdi.pay_refund_date2 == null}">
								<span style="width: 50%; float: left;">환불 진행중입니다.</span>
							</c:if>
						</td>
						<td>
							<p>1. 환불 조건
							   - 강좌가 개강한 지 7일 이내에 있는 결제건에 대해서만 <br>100% 환불이 가능합니다. 이외의 환불액은 게시판을 확인해주시기 바랍니다.
							</p>
							<p>
							2. 환불 처리 기간
							   - 환불 요청이 접수된 후 최대 7일 이내에 처리됩니다.
							</p>
							<p>
							3. 환불 방법:
							   - 환불은 원래 결제 수단을 통해 이루어집니다.
							</p>
							<p>
							4. 환불 수수료 및 제한사항:
							   - 환불 수수료는 발생하지 않습니다.<br>
							   - 특정 제한사항이나 조건이 있는 경우, 이는 개별적으로 안내드리겠습니다.
							</p>
							<p>
							5. 문의처 안내:
							   - 환불에 관한 추가 정보나 문의사항이 있으시면 <br>언제든지 [고객센터/02-123-4567로 연락해주시기 바랍니다.
							</p>
						</td>
					</tr>
				</table>			
			</div>
			<div id="btnBox">
				<button id="backBtn" onclick="location.href='/tobe/user/member/userMyPageMain.do'">마이페이지</button>
			</div>
		</div>

		<div class="footerBox">
			<%@include file="/WEB-INF/views/user/common/userFooter.jsp"%>
		</div>
	</div>
</body>
</html>