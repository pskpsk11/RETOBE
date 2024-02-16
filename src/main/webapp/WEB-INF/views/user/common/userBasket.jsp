<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="kr.co.retobe.util.CodeToString"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no"> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script>


$(document).ready(function() {
	$('#paytotal').text('0원'); 
	$('#payfinal').text('0원'); 

	$('#payfinalbyP').text('0원'); 
});

var selectedPrices =0;
// checkbox 클릭 시 호출되는 함수
function MathPrice(checkbox) {
    var price = parseFloat($(checkbox).val());  // checkbox의 value를 숫자로 변환
	console.log(price);
    
    if ($(checkbox).is(':checked')) {
    	selectedPrices += price;
    } else {
    	selectedPrices -= price;
    }
    document.getElementById("paytotal").innerText =selectedPrices+'원';
    var pot = parseFloat($("#point").val()) || 0;
    
    document.getElementById("payfinal").innerText =selectedPrices-pot+"원";
    document.getElementById("payfinalbyP").innerText =(selectedPrices-pot)*0.01+"원";
    
    var individualCheckboxes = $('.input_button.small');
    var allChecked = true;

    individualCheckboxes.each(function() {
        if (!$(this).is(':checked')) {
            allChecked = false;
            return false; 
        }
    });
    $('.check_all').prop('checked', allChecked);
}


function BasketAllSelect(checkAllCheckbox) {
    var individualCheckboxes = $('.input_button.small');
    var isChecked = $(checkAllCheckbox).is(':checked');
    
    if(isChecked){
    	$('.input_button.small').prop('checked', true);
    	selectedPrices =0;
    } else{
    	$('.input_button.small').prop('checked', false);
    	//
    }
    
    
    individualCheckboxes.each(function() { 
    	MathPrice(this);
    });
}

function removeSelectedItems() {
    var selectedNoList = [];

    $('.input_button.small:checked').each(function() {
        var cartNo = $(this).data('no');
        selectedNoList.push(cartNo);
    });

    if (selectedNoList.length > 0) {
		 window.location.href= 'basketDelete.do?cartNo='+selectedNoList.join(',');
        //$.ajax ({
		//	url: 'userBasketDelete.do?cartNo='+selectedNoList.join(','),
		/* 	success: function(res) {
			}
		}); */
    }
    /* else {
        alert("삭제할 상품을 선택해주세요.");
    }*/
}

function ProcessOrder() {
	console.log(1);
    var selectedNoList = [];

    $('.input_button.small:checked').each(function() {
        var cartNo = $(this).data('no');
        selectedNoList.push(cartNo);
    });

    if (selectedNoList.length > 0) {
		 window.location.href= '/tobe/user/payDetail.do?cartNo='+selectedNoList.join(',');
    }
}

</script>
</head>
<style>

.cart_wrap {
	width: 100%;
	height: 800px;
	max-width: 1280px;
	margin: 20px auto;
}
.cart_box {
	width: 100%;
	height : 100%;
}
.cart{
	width:70%;	
	float:left;
}
.payment{
	float:left;
	padding-left: 30px;
}
.cart_product {
	overflow-y:scroll;
	margin : 0;
	padding :0;
	height : 600px;
}

.firstRow {
	background-color: #F5F5F5;
	font-size: 1.25rem;
	height: 3rem;
	width: 2rem;
	colspan: 2;
}

.finalpay{
	margin: 20px auto;
	border: 0.5px solid #000;
    position: relative;
    /* top: 17rem; */
    /* left: 56rem; */
    /* width: 15rem; */
    /* border-top: 1px solid #ddd; */
    text-align: center;
	
}

.secondRow {
	height: 5rem;

}

.order{
	position: relative;
    /* top: 42rem; */
    /* left: 59rem; */
    width: 200px;
    height: 40px;
    color: #fff;
    background-color: #000;
    border: 0;
}

.bnt{
     background-color: #000;
     padding: 5px 15px;
     margin : 5px;
     text-align: center;
      border: none;
      color: #fff;
     border-radius: 15px;
     background-color: #000;
}

button:hover {
   text-decoration: none;
   background-color : #E7E7E7;
   color: #000;
   cursor:pointer;
}

.table_con{
	width : 100%;
	margin : 0;
	padding : 0;

}

</style>
<body>	
	<div class="wrap">
		<div class="headerBox">
			<%@include file="/WEB-INF/views/user/common/userHeader.jsp"%>
		</div>
		
		<div class="cart_wrap">
			<div class="cart_box">
				<div class = "cart">
					<h2 class="title" >장바구니<span>(${cart.total })</span></h2>
					<div class="cart_product">
						<table class="table_con">
							<colgroup>
								<col style="width: 30px">
								<col style="width: 250px">
								<col style="width: 375px">
								<col style="width: 125px">
							</colgroup>
							<thead>
								<tr class="firstRow">
									<th><span >
			            	 	       	<input type="checkbox" name="checkAll" class="check_all" onclick="BasketAllSelect(this);">
			                		     <label for="checkAll">&nbsp;</label> </span>
									</th>
									
									<th colspan="2">강좌정보</th>
									<th>강좌금액</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var= "vo" items="${cart.list }"> 
								<!-- <c:set var="education" value="${CodeToString.educationToString(vo.education)}" />
									<c:set var="subject" value="${CodeToString.subjectToString(vo.subject)}" />
									<c:set var="area" value="${CodeToString.areaToString(vo.area)}" />
									<c:set var="branch" value="${CodeToString.branchToString(vo.branch)}" />
									<c:set var="date" value="${CodeToString.dateToStirng(vo.mon, vo.tue, vo.wed, vo.thu, vo.fri, vo.sat, vo.sun)}" /> -->
									<tr>
									  <td class="input_btn" ><span>
									  <input  type="checkbox" class="input_button small" name="cart_no" data-no="${vo.cart_no }" value="${vo.price }" onclick="MathPrice(this);"><label for="checkbox2">&nbsp;</label></span></td>
									  <td class="img" style="padding: 0 55px;">
										  <img src="/tobe/img/course_img/${vo.teacher_img_org}" style="width:100px; height:100px;">
									  </td>
									  <td class="product"> 
									  	
									  	학원명 : ${CodeToString.educationToString(vo.education)}<br>
									  	과정명 : ${vo.cname}<br>
									  	과목 : ${CodeToString.subjectToString(vo.subject)}<br>
									  	지역 : ${CodeToString.areaToString(vo.area)} <br>
									  	지점 : ${CodeToString.branchToString(vo.branch)} <br>
										시간 : ${vo.time} <br>
									  	요일 : ${CodeToString.dateToStirng(vo.mon, vo.tue, vo.wed, vo.thu, vo.fri, vo.sat, vo.sun)}<br></td>
									  <td class="price" style="text-align:center;">${vo.price }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						</div>
					<div class="bx_btn">
						<button type="button" name="button1" class="bnt" onclick="removeSelectedItems();">선택상품삭제</button>
	                    <a href="/tobe/user/course.do"><button type="button" name="button2" class="bnt">쇼핑계속하기</button></a>
					</div>
				</div>
				<div class="payment ">
					<table class="finalpay">
						<tr class="firstRow" colspan="2">
							<th colspan="2">최종결제금액</th>
							<td></td>
						</tr>
						<tr class="secondRow">
							<th><strong>총 상품 금액 </strong></th>
							<td><p id="paytotal"></p></td>
						</tr>
						<tr class="secondRow">
							<th><strong>사용 가능한 포인트</strong></th>
							<td> <p id="point">${loginInfo.point }원</p></td>
						</tr>
						<tr class="secondRow">
							<th> <strong>총 결제금액</strong></th>
							<td> <p id="payfinal"></p></td>
						</tr>
						<tr class="secondRow">
							<th><strong>적립예정 포인트</strong></th>
							<td><p id="payfinalbyP"></p></td>
						</tr>
					</table>
				
		         	<button type="button" name="button3" onclick="ProcessOrder();" class="order">선택상품 주문하기</button>
				
				</div>
			</div>   
		</div>
        
	<div class="footerBox">
		<%@include file="/WEB-INF/views/user/common/userFooter.jsp"%>
	</div>
	</div>
		
</body>
</html>