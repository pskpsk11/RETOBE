<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>학원별 주문결제관리 페이지</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<link rel="stylesheet" href="/retobe/css/bbs.css"/>
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
      font-size : 15px;
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

.count_member{
	display : flex;
	flex-direction: row;
	justify-content: space-between;
	margin-top: 20px;
	margin-bottom: 10px;
	

}

.count_member button:hover {
   text-decoration: none;
   background-color : #3F4350;
   color:white;
   cursor:pointer;
}

 .count_member button{
 	 background-color: #E5D1E3;
     padding: 5px 15px;
     text-align: center;
     border-radius: 15px;
     border :1px solid #E5D1E3;
     font-size : 15px;
}

</style>

</head>
<body>
<%@include file="/WEB-INF/views/chiefAdmin/common/chiefSideBar_logo.jsp" %>
<div class="container">
	<div class="member_sub">
		<div class="form_sub">
			<form action="memberListEmail.do" method="get" >
				<table class="table">
					<tr>
					    <td width="100px;">검색어</td>
					    <td>
							<input type="text" id="searchWord" name="searchWord" value="${memberVO.searchWord}"  title="검색">
						</td>
					</tr>
					<tr  class="date_btn">   
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
						<td>생년 월일</td>
				    	<td>
							&nbsp;<input type="date" name="birthDayStartday" id="birthDayStartday"> - <input type="date" name="birthDayEndday" id="birthDayEndday">
						</td>
					</tr>
					</table>
			   	 	<div class="searchOrReset">
						<input type="reset" value="초기화" onclick="window.location.href='/tobe/chiefAdmin/memberListEmail.do'">
						<input type="submit" id="" value="검색">
					</div>  
				</form>
		</div>
		<div class="count_member">
		  	<p><span><strong>총 ${map.count }개</strong>  |  ${memberVO.page }/${map.totalPage }페이지</span></p>
		  	<button type="button"  onclick="ProcessSendEmail();" >메일 작성하기</button>
		</div>  
	
		
         <table class="tablea">
	        <thead>
	         	<th style="border-left:none;">    </th>
	         	<th>이름</th>
	         	<th>아이디</th>
	         	<th>성별</th>
	         	<th>가입일</th>
	         	<th>생년월일</th>
	         	<th>이메일</th>
	         	<th style="border-right:none;">전화번호</th>
	        </thead>
	        <tbody>
	         	<c:forEach var="member" items="${map.list}">       
				    <tr style="text-align:center;">
				   		<td  style="border-left:none;" ><input  type="checkbox" class="input_button small" name="member_no" data-no="${member.member_no }"><label for="checkbox2">&nbsp;</label></td>
				        <td>${member.name}</td>
				        <td>${member.id}</td>
				        <td>${member.gender}</td>
				        <td>${member.registdate}</td>
				        <td>${member.birthday}</td>
				        <td>${member.email}</td>
				        <td style="border-right:none;">${member.hp}</td>
				    </tr>
				</c:forEach>
	 		</tbody>
         </table>
         
       	<div class="email">
	       	 <div class="pagenate clear">
	              <ul class='paging'>
	              <c:if test="${map.prev }">
	              	<li><a href="/retobe/chiefAdmin/chiefEmailIndex.do?page=${map.startPage-1 }"> << </a></li>
	              </c:if>
	              <c:forEach var="p" begin="${map.startPage}" end="${map.endPage}">
	              	<c:if test="${p == memberVO.page}">
	                  <li><a href='#;' class='current'>${p}</a></li>
	                  </c:if>
	                  <c:if test="${p != memberVO.page}">
	                  <li><a href='/retobe/chiefAdmin/chiefEmailIndex.do?page=${p}'>${p}</a></li>
	                  </c:if>
	              </c:forEach>
	              <c:if test="${map.next }">
	              	<li><a href="/retobe/chiefAdmin/chiefEmailIndex.do?page=${map.endPage+1 }"> >> </a></li>
	              </c:if>
	              </ul> 
           	</div> 
          </div>
            
         </div>
      </div>
</body>
</html>