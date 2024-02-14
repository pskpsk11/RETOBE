<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="kr.co.retobe.util.CodeToString"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>학원별 강좌관리 페이지</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<link rel="stylesheet" href="/tobe/css/bbs.css"/>

<script>
	
function ProcessDelete() {
	console.log(1);
    var selectedNoList = [];

    $('.input_button.small:checked').each(function() {
        var courseNo = $(this).data('no');
        selectedNoList.push(courseNo);
    });

    if (selectedNoList.length > 0) {
		 window.location.href= '/tobe/manager/delete.do?courseNo='+selectedNoList.join(',');
    }
}

	function courseAllSelect(checkAllCheckbox) {
	    var individualCheckboxes = $('.input_button.small');
	    var isChecked = $(checkAllCheckbox).is(':checked');
	    
		    if(isChecked){
		    	$('.input_button.small').prop('checked', true);
		    	selectedPrices =0;
		    } else{
		    	$('.input_button.small').prop('checked', false);
		    	//
		    }
	}
	
	function checkCl(checkbox) {
		  
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
	
	
	
	window.onload = function() {
		

		

	
	};
	
	


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
	margin-bottom:15px;
}

.tablea tr {
	border-bottom: solid 1px;
	height: 40px;
}

.table td {
	border-bottom: solid 1px;
	height: 30px;
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
 .add input, .resetOrSearch input, .modOrDelete input {
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

.add input:hover, .resetOrSearch input:hover, .modOrDelete input:hover {
	text-decoration: none;
	background-color : #3F4350;
	color:white;
	cursor:pointer;
}
.add{
display:flex;
flex-direction:row-reverse;
margin-bottom:10px;
}
.resetOrSearch{
display:flex;
flex-direction:row-reverse;
margin-bottom:10px;
}
.modOrDelete{
display:flex;
flex-direction:row-reverse;
}
#total{
margin-bottom:10px;
}

</style>

</head>
<body>
<body>
	<%@include
		file="/WEB-INF/views/chiefAdmin/common/chiefSideBar_logo.jsp"%>
<div class="container">
	<div class="member_sub">
		<div class="form_sub">
			<form action="course.do" method="get" >
			<div class= "add">
			<input class ="bnt" type="button" value="강좌등록" onclick="window.location.href='courseForm.do'">
			</div>
				
				<table class="table">
				
					<tr>
						 <td width="100px;">학원명</td>
							 <td>
						 		<select name="education">
						 		<option value="0">전체</option>
						 		<option value= "1">해커스</option>
						 		<option value= "2">파고다</option>
						 		<option value= "3">YBM</option>
						 		</select>
					 		</td>
					</tr>
				<tr>
				    <td width="100px;">검 색</td>
				    <td>
						<input type="text" id="searchWord" name="searchWord" value=""  title="검색" placeholder="강좌명, 강사명을 입력하세요"/>
					</td>
				</tr>

				<tr>
					<td width="100px;">지 역</td>
					<td>	
						<select name="area">
		                 <option value="2">서울</option>
		                 <option value="32">인천</option>
		                 <option value="51">부산</option>
		                 <option value="53">대구</option>
		      			</select>
	      			</td>
	       		 </tr>
	       		 <tr>
	       		 	<td width="100px;">지 점</td>
	       		 	<td>
						<select name="branch">
		                   <option value="1">강남</option>
			                 <option value="2">종로</option>
			                 <option value="3">종로e4u</option>
			                 <option value="4">신촌</option>
			                 <option value="5">건대</option>
			                 <option value="6">대구동성로</option>
			                 <option value="7">서면</option>
			                 <option value="8">부산대</option>
			                 <option value="9">대연</option>
			                 <option value="10">부산광복</option>
			                 <option value="11">인천센터</option>
		      			</select>
	      			</td>
	       		 </tr>
				<tr>
					<td width="100px;">과목</td>
					<td>
						<select name="subject">
		                 <option value="1">토익</option>
		                 <option value="2">토스</option>
		                 <option value="3">토플</option>
		                 <option value="4">아이엘츠</option>
		                 <option value="5">텝스</option>
		                 <option value="6">오픽</option>
		                 <option value="7">gre</option>
		                 <option value="8">g-telp</option>
		      			</select>
	      			</td>
	       		 </tr>
	       	</table>
	       	
	   	 	<div class="resetOrSearch">   	 			
				<input class ="bnt" type="reset" value="초기화" onclick="window.location.href='/tobe/gmanager/course.do'">
				<input class ="bnt" type="submit" id="" value="검색">
			</div>    
			<div class="modOrDelete">   	 			
	   	 		<input class ="bnt" type="button" value="수정" onclick="window.location.href='/tobe/gmanager/courseMod.do'">
	   	 		<input class ="bnt" type="button" value="삭제" onclick="ProcessDelete();">
			</div> 
		
			</form>
		</div>
		

	
		<div id="total"><p><span><strong>총 ${map.count }개</strong>  |  ${courseVO.page }/${map.totalPage }페이지</span></p></div>
         
         <table class="tablea">
            <thead>
         	<th><span >
      	 		<input type="checkbox" name="checkAll" class="check_all" onclick="courseAllSelect(this);">
          		<label for="checkAll">&nbsp;</label> </span>
			</th>
			<th>no</th>
         	<th>학원<th>
         	<th>과목</th>
         	<th>지역</th>
         	<th>지점</th>
         	<th>강좌명</th>
         	<th>수준</th>
         	<th>강사명</th>
         	<th>가격</th>
         	<th>요일</th>
         	<th>시간대</th>
         	<th>개강일</th>
         	<th>종강일</th>
         </thead>
        
        <tbody> 
         	<c:forEach var="vo" items="${map.list}">       
			    <tr style="text-align:center;">
			   		<td><input  type="checkbox" class="input_button small" name="course_no" data-no="${vo.course_no }" onclick="checkCl(this);"><label for="checkbox2">&nbsp;</label></td>
			      	<td> ${CodeToString.educationToString(vo.education)}</td>
					<td> ${CodeToString.subjectToString(vo.subject)}</td>
					<td> ${CodeToString.areaToString(vo.area)} </td>
					<td> ${CodeToString.branchToString(vo.branch)} </td>
					<td> ${vo.cname}</td>
					<td> ${CodeToString.levelToString(vo.level)} </td>
					<td> ${vo.teacher1} ${vo.teacher2 } </td>
					<td> ${vo.price }</td>
					<td> ${CodeToString.dateToStirng(vo.mon, vo.tue, vo.wed, vo.thu, vo.fri, vo.sat, vo.sun)}</td>
					<td> ${vo.time} </td>
					<td> ${vo.startday} </td>
					<td> ${vo.endday} </td>
			    </tr>
			</c:forEach>			
 		</tbody>         	
      </table>
         
         
        	
        	 <div class="pagenate clear">
                       <ul class='paging'>
                       <c:if test="${map.prev }">
                       	<li><a href="/tobe/gmanager/course.do?page=${map.startPage-1 }"> << </a></li>
                       </c:if>
                       <c:forEach var="p" begin="${map.startPage}" end="${map.endPage}">
                       	<c:if test="${p == courseVO.page}">
                           <li><a href='#;' class='current'>${p}</a></li>
                           </c:if>
                           <c:if test="${p != courseVO.page}">
                           <li><a href='/tobe/gmanager/course.do?page=${p}'>${p}</a></li>
                           </c:if>
                       </c:forEach>
                       <c:if test="${map.next }">
                       	<li><a href="/tobe/gmanager/course.do?page=${map.endPage+1 }"> >> </a></li>
                       </c:if>
                       </ul> 
              </div> 

        	
		</div>
	</div>

</body>
</html>