<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>관리자 페이지 회원관리</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
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
</script>



<style>

.container{
   position: relative;
   margin: -845px 0 0 160px;
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


.table {
 	border: solid 1px; 
 	width: 100%;
	border-collapse: collapse;
	margin-bottom : 10px;
	
}

.tablea {
	width: 100%;
	border-collapse: collapse;
	border-top: 1px solid;
}

.tablea tr {
	border-bottom: solid 1px;
	height: 30px;
}

.table td {
	border-bottom: solid 1px;
	height: 50px;
}

.searchOrReset{
	display : flex;
	flex-direction:row-reverse;
	margin-bottom:10px;
		
}

.form_sub{

display : flex;
flex-direction: column;
    align-items: stretch;
}


input#today, input#week, input#oneMonth, input#threeMonth, input#year{
   	border-radius:7px;
	border-width:thin;
	display:inline-block;
	width:50px;
 }
 .searchOrReset input{
 	 background-color: #E5D1E3;
     padding: 5px 15px;
     margin : 5px;
     text-align: center;
     border-radius: 15px;
     border :1px solid #E5D1E3;
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
.searchOrReset{
	display: flex;
	flex-direction: row;  
    justify-content: flex-end
}

.searchOrReset input:hover {
	text-decoration: none;
	background-color : #3F4350;
	color:white;
	cursor:pointer;
}


</style>

</head>
<body>
	<%@include
		file="/WEB-INF/views/chiefAdmin/common/chiefSideBar_logo.jsp"%>
<div class="container">
	<div class="member_sub">
		<div class="form_sub">
			<form action="member.do" method="get" >
				<table class="table">
					<tr>
						<td width="100px;">검색어</td>
						<td>&nbsp;<input type="text" id="searchWord" name="searchWord"
							value="${MemberVO.searchWord}" title="검색"></td>
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
	
						<tr>
							<td>생년월일</td>
							<td>&nbsp;<input type="date" name="birthDayStartday" id="birthDayStartday"> - <input type="date" name="birthDayEndday" id="birthDayEndday"></td>
						</tr>
						

				</table>
				
						<div class="searchOrReset">
							<input type="reset" >
							<input type="submit" id="" value="검색">
						</div> 
			</form>
		</div>
		<!--
       <form method ="get" name="searchForm" id="searchForm" action="chiefMemberIndex.do">
		   <span class="searchWord">
		   	 <input id="search" type="search" name="searchWord" value="${MemberVO.searchWord }" placeholder="검색">                        
			 <button type="submit" class="btn" style="background-color: #ECEDE8; color:#44546A; border-width: 1px; border-radius: 7px; padding:3x 10px; ">검색</button>
		   </span>
		</form> 
		-->




		<table class="tablea">
			<thead>
				<th style="border-left:none;">no</th>
				<th>이름</th>
				<th>아이디</th>
				<th>가입일</th>
				<th>생년월일</th>
				<th>이메일</th>
				<th>전화번호</th>
				<th>포인트</th>
				<th style="border-right:none;">주소</th>
			</thead>
			<tbody>
				<c:forEach var="MemberVO" items="${map.list }">
					<tr>
						<td style="border-left:none;">${MemberVO.member_no }</td>
						<td>${MemberVO.name }</td>
						<td>${MemberVO.id }</td>						
						<td>${MemberVO.registdate }</td>
						<td>${MemberVO.birthday }</td>
						<td>${MemberVO.email }</td>
						<td>${MemberVO.hp }</td>
						<td><a href="memberDetail.do?no=${MemberVO.member_no }">
						<input type="text" name="point" id="point" style="float: left;" value="${MemberVO.point }"></a>point</td>
						<td style="border-right:none;">${MemberVO.addr1 }</td>						
					</tr>
				</c:forEach>
			</tbody>
		</table>
		

	

		<div class="pagenate clear">
			<ul class='paging'>
				<c:if test="${map.prev }">
					<li><a href="member.do?page=${map.startPage-1 }"> << </a></li>
				</c:if>
				<c:forEach var="p" begin="${map.startPage ge 0 ? map.startPage : 0}"
					end="${map.endPage}">
					<c:if test="${p == MemberVO.page}">
						<li><a href='#;' class='current'>${p}</a></li>
					</c:if>
					<c:if test="${p != MemberVO.page}">
						<li><a href="member.do?page=${p}">${p}</a></li>
					</c:if>
				</c:forEach>
				<c:if test="${map.next }">
					<li><a href="member.do?page=${map.endPage+1 }">
							>> </a></li>
				</c:if>
			</ul>
		</div>
</div>
</div>
</body>
</html>