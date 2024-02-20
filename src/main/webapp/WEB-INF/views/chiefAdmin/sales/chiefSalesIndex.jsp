<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="kr.co.retobe.util.CodeToString"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Tobe 총관리자 매출관리</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>


<script>

$(function(){
    $('#today').click(function(){
    	$("#startday").val(getDates('today').start);
    	$("#endday").val(getDates('today').end);
    })
    $('#week').click(function(){
    	$("#startday").val(getDates('oneWeek').start);
    	$("#endday").val(getDates('oneWeek').end);
    })
    $('#oneMonth').click(function(){
    	$("#startday").val(getDates('oneMonth').start);
    	$("#endday").val(getDates('oneMonth').end);
    })
    $('#threeMonth').click(function(){
    	$("#startday").val(getDates('threeMonths').start);
    	$("#endday").val(getDates('threeMonths').end);
    })
    $('#year').click(function(){
    	$("#startday").val(getDates('oneYear').start);
    	$("#endday").val(getDates('oneYear').end);
    })
})

function getDates(period) {
   var currentDate = new Date();
   var pastDate = new Date();

   switch (period) {
    case 'today':
           pastDate.setDate(currentDate.getDate());
           break;
       case 'oneWeek':
           pastDate.setDate(currentDate.getDate() - 7);
           break;
       case 'oneMonth':
           pastDate.setMonth(currentDate.getMonth() - 1);
           break;
       case 'threeMonths':
           pastDate.setMonth(currentDate.getMonth() - 3);
           break;
       case 'oneYear':
           pastDate.setFullYear(currentDate.getFullYear() - 1);
           break;
       default:
           // 기본값은 현재 날짜
           pastDate = currentDate;
           break;
   }

   return {
       start: getFormattedDate(pastDate),
       end: getFormattedDate(currentDate)
   };
}

function getFormattedDate(date) {
    var year = date.getFullYear();
    var month = (date.getMonth() + 1).toString().padStart(2, '0');
    var day = date.getDate().toString().padStart(2, '0');
    return year + '-' + month + '-' + day;
}
</script>

</head>
<style>

.searchBox {
	position: absolute;
	width: 75rem;
	height: 7.5rem;
	top: 10rem; 
	left: 12rem;
	border: 1px solid #000;
}

.searchBox table {
	position: absolute;
	top: 1rem;
}

/*
.searchBox th {
	width: 10rem;
	font-size: 1.25rem;
}

.searchBox td {
	width: 40rem;
	font-size: 1.25rem;
}

.input {
	height: 2rem;
	width: 10rem;
	font-size: 1rem;
}
*/
.frmBtn {
	position: absolute;
	left: 64rem;
	top: 4.75rem;
}
.frmBtn input {
	width: 5rem;
	height: 1.75rem;
	font-size: 1rem;
	background-color: #F0F5F8;
	cursor: pointer;
	border-color: #F0F5F8;
}

.lBox {
	position: absolute;
	width: 40rem;
	height: 29.5rem;
	top: 23rem; 
	left: 12rem;
	border: 1px solid #000;
	overflow-y: scroll;
}

.salesList {
	position: absolute;
	top: 1rem;
	border-collapse: collapse;
	width: 100%;
	border-top: none;
	border-bottom: none;
}

.salesList th, .salesList td {
    border: 1px solid #dddddd;
    text-align: center;
    padding: 8px;
    width: 25%;
}

.salesList th {
        border-top: none; /* 맨 위 줄 제거 */
}

.salesList td {
        border-bottom: none; /* 맨 아래 줄 제거 */
}


.total {
	position: absolute;
	width: 33rem;
	height: 29.5rem;
	top: 23rem; 
	left: 54rem;
	border: 1px solid #000;
	padding: 0 0;
	margin: 0 0;
}

.total th, .total td {
    text-align: center;
    width: 33.3%;
    padding: 0 0;
    margin: 0 0;
}

.total td{
	font-size: 1.5rem;
}
.resetOrSearch input {
 	 background-color: #E5D1E3;
     padding: 5px 15px;
     margin : 10px;
     text-align: center;
     border-radius: 15px;
     border :1px solid #E5D1E3;
}
.resetOrSearch input:hover{
	text-decoration: none;
	background-color : #3F4350;
	color:white;
	cursor:pointer;
}

.resetOrSearch{
display:flex;
flex-direction:row-reverse;
margin-bottom:5px;
}

</style>

<body>
	<%@include file="/WEB-INF/views/chiefAdmin/common/chiefSideBar_logo.jsp" %>
   	
   	<div class="searchBox">
   		<form action="payList.do" method="get">
   			<table>
				<tr class="date_btn">
					
					<td>학원명</td>
					<td> <select name="education">
  							<option value="">전체</option>
  							<option value="1">해커스</option>
  							<option value="2">파고다</option>
  							<option value="3">YBM</option>
					</select>
					</td>
				</tr>
				<tr class="date_btn">
					<td>가입일</td>
				    	<td>
					&nbsp;<input type="date" name="startday" id="startday"> - <input type="date" name="endday" id="endday">
							<input id="today" type="button" value="오늘" >
							<input id ="week" type="button" value="일주일">
							<input id= "oneMonth" type="button" value="1개월">
							<input id= "threeMonth" type="button" value="3개월">
							<input id= "year" type="button" value="1년">							
						</td>
				</tr>   			
   			</table>
   			<div class="resetOrSearch">   	 			
				<input class ="bnt" type="reset" value="초기화" onclick="window.location.href='/tobe/gmanager/sales.do'">
				<input class ="bnt" type="submit" id="" value="검색">
			</div>    
   		</form>
   	</div>
   	
	<div class="lBox">
		<table class="salesList">
			<tr>
				<th>학원명</th>
				<th>결제일</th>
				<th>결제총액</th>
				<th>수수료</th>
			</tr>
			<c:forEach var="vo" items="${payList}">
			<c:set var="education" value="${CodeToString.educationToString(vo.education)}" />
				<tr>
					<td>${education}</td>
					<td>${vo.pay_date}</td>
					<td>${vo.pay_total}</td>
					<td>${vo.charge_total}</td>
				</tr>
			</c:forEach>
			
		</table>
	
	</div>
	

	<table class="total">
		<tr style="background-color: #D9D9D9; height: 3.5rem;">
			<th colspan="3" style="font-size: 1.15rem;">총매출:
				<c:if test="${!empty pay_chargeTotal}">
					<span style="font-size: 1.5rem; color: #3152A8;">${pay_chargeTotal.pay_total }</span>
				</c:if>
			</th>
		</tr>
		
		<tr style="height:5rem;">
		<c:forEach var="vo" items="${conEduTotal}">
			<td><b>${CodeToString.educationToString(vo.education)}</b></td>
		</c:forEach>
		</tr>
		<tr style="height: 5rem;">
			<c:if test="${!empty conEduTotal}">
				<c:forEach var="vo" items="${conEduTotal}">
					<td>${vo.pay_total }</td>
				</c:forEach>
			</c:if>
		</tr>
		
		<tr style="background-color: #D9D9D9; height: 3.5rem;">
			<th colspan="3" style="font-size: 1.15rem;">총수수료:
				<c:if test="${!empty pay_chargeTotal}">
					<span style="font-size: 1.5rem; color: #3152A8;">${pay_chargeTotal.charge_total }</span>
				</c:if>
			</th>
		</tr>
		<tr style="height:5rem;">
			<c:forEach var="vo" items="${conEduTotal}">
				<td><b>${CodeToString.educationToString(vo.education)}</b></td>
			</c:forEach>
		</tr>
		<tr style="height: 5rem;">
			<c:if test="${!empty conEduTotal}">
				<c:forEach var="vo" items="${conEduTotal}">
					<td>${vo.charge_total }</td>
				</c:forEach>
			</c:if>
		</tr>
	</table>
</body>
</html>