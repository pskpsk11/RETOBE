<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <%@ page import="kr.co.retobe.util.CodeToString"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<link rel="stylesheet" href="/tobe/css/bbs.css"/>
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
 
 function ProcessSendEmail() {
		console.log(1);
	    var selectedNoList = [];

	    $('.input_button.small:checked').each(function() {
	        var member_no = $(this).data('no');
	        console.log(member_no);
	        selectedNoList.push(member_no);
	    });

	    if (selectedNoList.length > 0) {
			 window.location.href= '/tobe/gmanager/emailForm.do?member_no='+selectedNoList.join(',');
			 
	    }
 }


</script>
</head>
<style>
.container{
   position: relative;
   margin: -805px 0 0 160px;
   width : 1340px ;
   height : 840px;  
}	
.member_sub{
	margin-left : 20px; 
	margin-right : 20px; 
	width : 1300px ;
	height : 850px;
	display: flex;
	flex-direction: column;  
}
.form_sub{

display : flex;
flex-direction: column;
    align-items: stretch;
}

.box {
	position: absolute;
	width: 75rem;
	height: 22rem;
	top: 5.5rem; 
	left: 10rem;
}
.admin_logo {
	position: absolute;
	width: 40rem;
	height: 5rem;
	top: 2rem;
	left: 10rem;
}

.table {
	position: absolute;
	border: solid 1px ;
	width: 100%;
	height: 70px;
	margin: 10px 0 0 5px;
	border-collapse: collapse;
}
.tablea {
	width: 100%;
	border-collapse: collapse;
	border-top: 1px solid;
	position: absolute;
	border: solid 1px ;
	margin: 60px 0 0 5px;

}

.tablea tr {
	border-bottom: solid 1px;
	height: 30px;
}

 .tablea th{
 border:solid 1px #A4A4A4;
 background-color:#D9D9D9;

 }
 
.table td:first-child{
text-align: center;
}
.tablea tr td{
text-align:center;
border:solid 1px #A4A4A4;

}
.table td {
	border-bottom: solid 1px;
	height: 50px;
}

td{
	height: 5px;
}	

input#today, input#week, input#oneMonth, input#threeMonth, input#year{
   	border-radius:7px;
	border-width:thin;
	display:inline-block;
	width:50px;
 }
 
.searchOrReset{
	display : flex;
	flex-direction:row-reverse;
	margin: 230px 0 0 90px;
		
}

 .searchOrReset input{
 	 background-color: #E5D1E3;
     padding: 5px 15px;
     margin : 5px;
     text-align: center;
     border-radius: 15px;
     border :1px solid #E5D1E3;
}

</style>



<body>
<%@include file="/WEB-INF/views/chiefAdmin/common/chiefSideBar_logo.jsp" %>
	<div class="container">
	<div class="member_sub">
		<div class="form_sub">
			<form action="pay.do" method="get" >
		<table class="table">
			<tr>
				<td width="100px;">검색어</td>
				<td>&nbsp;<input type="text" id="searchWord" name="searchWord"
					value="${MemberVO.searchWord}" title="검색"></td>
			</tr>
			
			<tr class="date_btn">   
		    	<td>날   짜</td>
				    <td>
							<input type="date" name="startday" id="startday"> - <input type="date" name="endday" id="endday">
							<input id="today" type="button" value="오늘" >
							<input id ="week" type="button" value="일주일">
							<input id= "oneMonth" type="button" value="1개월">
							<input id= "threeMonth" type="button" value="3개월">
							<input id= "year" type="button" value="1년">
					</td>
			</tr>
			<tr>
			    <td>주문상태</td>
			    <td>
					<label><input type="checkbox" style="margin-right:5px;">주문접수</label>
					<label><input type="checkbox" style="margin-right:5px;">결제완료</label>
					<label><input type="checkbox" style="margin-right:5px;">입금대기</label>
					<label><input type="checkbox" style="margin-right:5px;">주문취소</label>
					<label><input type="checkbox" style="margin-right:5px;">결제실패</label>
					<label><input type="checkbox" style="margin-right:5px;">환 불</label>
				</td>
			</tr>
			<tr>
			    <td>결제방법</td>
			    <td>
  					<label><input type="checkbox" style="margin-right:5px;">무통장입금</label>
  					<label><input type="checkbox" style="margin-right:5px;">신용카드</label>
				</td>
			</tr>
	    </table>
	 	 				<div class="searchOrReset">
							<input type="reset" >
							<input type="submit" id="" value="검색">
						</div>  
		   
         <table class="tablea">
         	<thead>
				<th style="border-left:none;">주문번호</th>
				<th>회원번호</th>
				<th>이름</th>
				<th>아이디</th>
				<th>휴대전화</th>
				<th>이메일</th>
				<th>강좌명</th>
				<th>주문상태</th>
				<th>결제방법</th>
				<th>포인트사용금액</th>
				<th>결제일</th>
				<th style="border-right:none;">결제총액</th>
			</thead>
			<tbody>
	         	<c:forEach var="member" items="${list.list}"> 
	         	<c:set var="pay_by" value="${CodeToString.paybyToString(member.pay_by)}" />      
	         	<c:set var="i_subject" value="${CodeToString.subjectToString(member.i_subject)}" />      
				    <tr>
				        <td style="border-left:none;">${member.product_no}</td>
				        <td>${member.member_no}</td>
				        <td>${member.name}</td>
				        <td>${member.id}</td>
				        <td>${member.hp}</td>
				        <td>${member.email}</td>
				        <td>${i_subject}</td>
				        <td>${member.i_cname}</td>
				        <td>${pay_by}</td>
				        <td>${member.point_usage}</td>
				        <td>${member.pay_date }</td>
				        <td style="border-left:none;">${member.pay_total}</td> 
				    </tr>
				</c:forEach>
         	</tbody>
         </table>
         
         
         
         	<div class="pagenate clear" style="margin: 420px 0 0 0;">
                   <ul class='paging'>
                   <c:if test="${list.prev }">
                   	<li><a href="/tobe/gmanager/pay.do?page=${list.startPage-1 }"> << </a></li>
                   </c:if>
                   <c:forEach var="p" begin="${list.startPage}" end="${list.endPage}">
                   	<c:if test="${p == param.page}">
                       <li><a href='#;' class='current'>${p}</a></li>
                       </c:if>
                       <c:if test="${p != param.page}">
                       <li><a href='/tobe/gmanager/pay.do?page=${p}'>${p}</a></li>
                       </c:if>
                   </c:forEach>
                   <c:if test="${list.next }">
                   	<li><a href="/tobe/gmanager/pay.do?page=${list.endPage+1 }"> >> </a></li>
                   </c:if>
                   </ul> 
             </div>
              
              
          </div>  
   </div>
</body>
</html>