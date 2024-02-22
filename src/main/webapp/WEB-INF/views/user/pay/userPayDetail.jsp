<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="kr.co.retobe.util.CodeToString"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제창</title>
<!-- jQuery -->
  <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
  <!-- iamport.payment.js -->
  <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-{SDK-최신버전}.js"></script>
<style>
.title {
	position: relative;
	width: 100%;
	max-width: 1280px;
	margin: 0 auto;
}
#cart {
	margin: 0 auto;
	position: relative;
	width: 100%;
	max-width: 1280px;
	height: auto;
}
.info {
    max-width: 1280px;
    position: relative;
    /* left: 12.6%; */
    width: 800px;
    border-top: 1px solid #ddd;
    border-bottom: 1px solid #ddd;
}

#firstRow {
	background-color: #F5F5F5;
	font-size: 1.25rem;
	height: 3rem;
	width: 2rem;
	colspan: 2;
}

#secondRow {
	height: 10rem;
}

.info td {
	width: 15%;
	text-align: center;
}
.info{
	width: 
}
.title2 {
	position:relative;
}

.title3 {
	position:relative;
}
#orderbox{
 width: 60%;
}
type="radio"{
		appearance: none;
        width: 15px;
        height: 15px;
        border-radius: 50%;
        background-color: #fff;
        border: 0.3px solid black;
}
type="radio":checked{
        background-color: #fff;
        border: 5px solid black;

}
hr, strong{
	margin-left: 15px;
}
.finalpay{
	border: 0.5px solid #000;
    position: relative;
    top: -31.5rem; 
    bottom: 35.05rem;
    left: 56rem;
    width: 15rem;
    border-top: 1px solid #000
	
}
.agree{
	border: 0.5px solid #000;
    position: relative;
    top:-30rem;
    bottom: 34.8rem;
    left: 56rem;
    width: 14.9rem;
    font-size: 13px;
    vertical-align: 10px;
}
type="checkbox" {
    width: 1rem; b
    height: 1rem;
    border-radius: 50%;
    border: 1px solid #999;
    appearance: none;
    cursor: pointer;
    transition: background 0.2s;
  }

type="checkbox":checked {
    background: #000;
    border: none;
  }
 
.order{
    position: relative;
    top: -29rem; 
    bottom: 34.6rem;
    left: 56rem;
    width: 15rem;
    height: 2.5rem;
    color: #fff;
    background-color: #000;
}
type=checkbox {
zoom: 0.8;
}
.footer{
	margin: 1000px 0 0 0;
}
</style>

<script>
$(document).ready(function() {
	$('#total_price').text('0원'); 
	$('#final_payment').text('0원'); 

	$('#payfinalbyP').text('0원'); 
	
	//체크박스 전체 체크
	document.addEventListener("DOMContentLoaded", function() {
	    var checkAllCheckbox = document.querySelector('.check_all');
	    checkAllCheckbox.addEventListener('click', function() {
	        var checkboxes = document.querySelectorAll('.check');
	        checkboxes.forEach(function(check) {
	            check.checked = checkAllCheckbox.checked;
	        });
	    });
	});
});

function re() {
	var IMP = window.IMP; // 생략 가능
	IMP.init("store-e48427ce-8dd2-476e-ac6f-992c6044483e"); // 예: imp00000000
  //IMP.request_pay(param, callback) 결제창 호출
  
  IMP.request_pay({ // param
      pg: "html5_inicis.INIpayTest", //결제대행사 설정에 따라 다르며 공식문서 참고
      pay_method: "card", //결제방법 설정에 따라 다르며 공식문서 참고
      merchant_uid: map.cart_no, //주문(db에서 불러옴) 고유번호
      name: data.products,
      amount: map.pay_total,
      //buyer_email: "",
      buyer_name: data.name,
      //buyer_tel: "010-4242-4242",
      buyer_addr: data.addr,
      //buyer_postcode: "01181"
  }, function (rsp) { // callback
      if (rsp.success) {
    	// 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
          // jQuery로 HTTP 요청
          jQuery.ajax({
            url: "/payment/verify/"+ rsp.imp_uid, 
            method: "POST",
          }).done(function (data) {
        	// 위의 rsp.paid_amount 와 data.response.amount를 비교한후 로직 실행 (iamport 서버검증)
        	  if(rsp.paid_amount == data.response.amount){
		        	succeedPay(rsp.imp_uid, rsp.merchant_uid);
	        	} else {
	        		alert("결제 검증 실패");
	        	}
          })
      } else {
    	  var msg = '결제에 실패하였습니다.';
          msg += '에러내용 : ' + rsp.error_msg;
          alert(msg);
      }
  });
}
	//체크박스 전체 체크
	function AgreeAllSelect(checkbox) {
	    var checkboxes = document.querySelectorAll('.check');
	    checkboxes.forEach(function(check) {
	        check.checked = checkbox.checked;
	    });
	}
	
	function requestPay() {
		  document.getElementById("cart").submit();
	}
	
	
	//포인트 전액사용
	function useAllPoints() {
	    var pointValue = ${loginInfo.point};
	    document.getElementById("point_usage").value = pointValue;
	    calculateFinalPayment();
	}

	//최종결제금액 부분에 사용포인트 - 계산
	function calculateFinalPayment() {
        var totalPrice = parseFloat(document.getElementById("total_price").innerText);
        var usedPoints = parseFloat(document.getElementById("point_usage").value);
        
        // 입력된 포인트가 음수이면 0으로 처리
        if (usedPoints < 0) {
            usedPoints = 0;
        }
        
        var finalPayment = totalPrice - usedPoints; // 상품 금액에서 사용 포인트를 뺌
        if (finalPayment < 0) {
            finalPayment = 0; // 최종 결제 금액이 음수가 되지 않도록 보정
        }
        document.getElementById("final_payment").innerText = finalPayment + "원";
    }
	
	 //최종결제금액 총 상품금액 출력 
	  window.onload = function() {
	        // 각 cart의 가격을 모두 더한 값을 구함
	        var totalPrice = 0;
	        var carts = document.querySelectorAll(".price");
	        carts.forEach(function(cart) {
	            totalPrice += parseFloat(cart.innerText.replace(/[^0-9.-]+/g,"")); // 숫자 외의 문자 제거 후 더함
	        });

	        // finalpay 테이블에서 각 항목에 값을 설정
	        document.getElementById("total_price").innerText = totalPrice + " 원";
	    };
	    // 사용 포인트를 입력하는 input 요소의 값이 변경될 때마다 호출되는 함수
	    function updatePointUsage() {
	        var pointUsage = parseFloat(document.getElementById("point_usage").value);
	        document.getElementById("final_point_usage").innerText = pointUsage + "원"; // finalpay 테이블의 사용포인트 부분에 값 설정
	    }
</script>
</head>
<body>
<div class="wrap">
		<div class="headerBox">
			<%@include file="/WEB-INF/views/user/common/userHeader.jsp"%>
		</div>
<div class="title">
<h1 style="margin: 1rem; padding: 0;">주문상품</h1>
</div>
	<div name="cart" id="cart">
		<input type="hidden" name="cartNo" value="${param.cartNo}">
		<input type="hidden" name="course_no" value="${lecture.course_no}">
		<input type="hidden" name="member_no" value="${loginInfo.member_no}">
		<table class="info" >
				<tr id="firstRow">
					<td></td>
					<td>강좌정보</td>
					<td>가격</td>
				</tr>
				 <c:forEach var="cart" items="${basket}">
				 <tr>
				 	<td><img src="/tobe/img/course_img/${cart.teacher_img_org}" style="width:100px; height:100px"></td>
				
					<td>
						  학원명 : ${CodeToString.educationToString(cart.education)}<br>
                          과정명 : ${cart.cname}<br>
                          과목 : ${CodeToString.subjectToString(cart.subject)}<br>
                          지역 : ${CodeToString.areaToString(cart.area)} <br>
                          지점 : ${CodeToString.branchToString(cart.branch)} <br>
                       	  시간 : ${cart.time} <br>
                          요일 : ${CodeToString.dateToStirng(cart.mon, cart.tue, cart.wed, cart.thu, cart.fri, cart.sat, cart.sun)}<br></td>
                       
					</td>
				
					<td class="price">${cart.price }</td>
				</tr>	
					 <c:set var="totalPrice" value="${totalPrice + cart.price}" />
				</c:forEach>
		</table>
	
			<div class="title2">
			
				<h1 style="margin: 1rem; padding: 0;">포인트 사용</h1>
				<hr width="800px;" style="margin-left:15px;">
				<strong>보유 포인트</strong> <input type="text" name="point_usage" id="point_usage" style="margin-left:15px;" height="10px; oninput="updatePointUsage()">원 / ${loginInfo.point }원 
				<button style="margin-left:15px; background-color:#000; color: #fff; border-radius:5px;" onclick="useAllPoints()">전액 사용</button>
				<hr width="800px;">
			
				<strong style="margin-right:10px;">결제 예정 금액</strong>  <b>${totalPrice} 원</b>
				<br><hr width="800px;">
	
			</div>
			
			<div class="title3">
				<h1 style="margin: 1rem; padding: 0;">결제 수단</h1>
				<hr width="800px;" >
				<input type="radio" name="myRadio" style="margin-left:30px;"> 무통장입금
				<hr width="800px;">
				<input type="radio" name="myRadio" style="margin-left:30px;"> 신용카드
				<hr width="800px;">
			</div>
			
			<table class="finalpay">
				<tr id="firstRow" colspan="2">
					<th colspan="2">최종결제금액</th>
					<td></td>
				</tr>
				<tr id="secondRow">
					<td>상품 금액</td>
					<td id="total_price"> </td>
				</tr>
				<tr>
					<td >사용포인트</td>
					<td id="point_usage"> </td>
				</tr>
				
				<tr>
					<td>최종 결제 금액</td>
					<td id="final_payment"></td>
				<tr>
				<tr>
					<td>적립예정 포인트</td>
					<td></td>
				</tr>
			
			</table>
		<div class="agree">
			<input type="checkbox" name="checkAll" class="check_all" onclick="AgreeAllSelect(this);"> 주문 정보를 확인하였으며, 약관 전<br>&nbsp;&nbsp;&nbsp; 체에 동의합니다.<br>
			<input type="checkbox" class="check"  onclick="MathPrice(this);"> 주문 상품정보에 동의 &nbsp;(필수)<br>
			<input type="checkbox" class="check"  onclick="MathPrice(this);"> 결제대행서비스 이용을 위한 개인<br>&nbsp;&nbsp;&nbsp;정보 제3자 제공 및 위탁 동의 (필수)<br>
			<input type="checkbox" class="check"  onclick="MathPrice(this);"> 개인정보 수집 및 이용에 대한 동의<br>&nbsp;&nbsp;&nbsp;(필수)<br>
			<input type="checkbox" class="check"  onclick="MathPrice(this);"> 개인정보 제3자 제공에 대한 동의<br>&nbsp;(필수)
		</div>
	</div>	
	<form method="post" name="cart" id="cart" action="/tobe/user/payCompleteDetail.do"> 	
		<button type="button" name="button3" onclick="requestPay();" class="order" data-CartNo="${vo.cart_no }">결제하기</button>
	</form>		
	
		
	<div class="footerBox">
		<%@include file="/WEB-INF/views/user/common/userFooter.jsp"%>
	</div>	
</div>
</body>
</html>