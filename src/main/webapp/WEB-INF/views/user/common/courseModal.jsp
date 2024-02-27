<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="kr.co.retobe.util.*" %> 
<style>
button {
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
      font-style: none;
}
.modal{
	max-width: 1280px;
	
}
.result{
	max-width: 800px;
	height: 800px;
	text-align: center;
	margin: 0 auto;
	
	
}
.flex{
	color: white;
	display: flex;
	justify-content:space-around;
	align-items: center;
	height: 90%;

}

.cImg{
	width : 350px ;
	height:350px;
	border: 1px solid #ddd;
	margin : 10px;
}
.child{
	display: flex;
	justify-content:center;
	flex-direction: column; 
	align-items: center; 
	width: 450px;
}
#comp, #close{
	color: white;
}
.bnt{
	background-color: #ff5050;
	padding: 5px 5px;
   	margin : 20px;
	text-align: center;
	border-radius: 15px;
	color : white;
	width : 200px;
 	font-size : 20px;
   	  
   	
}

.removeBtn{
	background-color: #ff5050;
	padding: 5px 5px;
   	margin : 20px;
	text-align: center;
  	border-radius: 15px;
	color : white;
	width : 200px;
	border: none;
 	font-size : 20px;

}
.text_s{
	display : flex;
	justify-content:center;
	flex-direction: row; 
	width: 450px;
	margin : 30px;
	color : #253528;
	text-align :left;
	font-size : 18px;
	padding : 0 10px 0 10px; 
}

.sub_co{
	margin-left : 10px
}


</style>
<script>

$(function(){
	$(".removeBtn").click(function(){

		$.ajax({
			type: 'GET',
			url:'/tobe/user/modalRemove.do',
			data:{
				remove : $(this).val()
			},
			success:function(res) {
				console.log(res);
				$('#ex1').html(res);
				
				$('#ex1').modal();
				
			}
		})
	})
	
	
})
</script>
		<div class="result">
			<div class="parent  flex">
				<div class="child">
					<c:if test="${!empty map.cosComp1 }" >
						<div class="child">
						<img src="/tobe/img/course_img/${map.cosComp1.teacher_img_org}" class="cImg"><br>
						${CodeToString.educationToString(map.cosComp1.education)} ${CodeToString.areaToString(map.cosComp1.area)} ${CodeToString.branchToString(map.cosComp1.branch)}<br>
			    						${map.cosComp1.cname}<br></div>
			    		<button class="removeBtn " value="cosComp1">삭제하기</button>				
					</c:if>
					<c:if test="${empty map.cosComp1 }">
						<img class="cImg" src="/tobe/img/addCourse.png" onclick="location.href='/tobe/user/course.do';" ><br><br><br>
						<a href="/tobe/user/course.do" class="bnt" >강좌추가</a>
					</c:if>
				</div>
				<div class="child">
					<c:if test="${!empty map.cosComp2 }">
						<div class="child">
						<img src="/tobe/img/course_img/${map.cosComp2.teacher_img_org}" class="cImg"><br>
						${CodeToString.educationToString(map.cosComp2.education)} ${CodeToString.areaToString(map.cosComp2.area)} ${CodeToString.branchToString(map.cosComp2.branch)}<br>
			    						${map.cosComp1.cname}<br></div>
			    		<button class="removeBtn " value="cosComp2" >삭제하기</button>				
					</c:if>
					<c:if test="${empty map.cosComp2 }" >
						<img class="cImg"  src="/tobe/img/addCourse.png" onclick="location.href='/tobe/user/course.do';"><br><br><br>
						<a href="/tobe/user/course.do" class="bnt" >강좌추가</a>
					</c:if>
				</div>
	  	 	</div>
	  	 	<c:if test="${!empty map.cosComp1 && !empty map.cosComp2 }" >
				<p id = "comp"><a href="#sub-modal" rel="modal:open" text-align="center" class="bnt" >비교하기</a></p>
			</c:if>
		</div>
		
		<div id="sub-modal" class="modal" style="display=none;">
			<div class="flex">
				<div class="child">
					<img src="/tobe/img/course_img/${map.cosComp1.teacher_img_org}" class="cImg">
					<div class="text_s">
						<div>
							<b>과정명</b> <br>
							<b>학원</b>  <br>
							<b>요일</b> <br> 
							<b>시간</b>  <br>
							<b>가격</b>  <br>
							<b>강사명</b> <br>
							<b>개강일</b> <br>
							<b>종강일</b>  <br>
							<b>후기평점</b><br>
							<b>후기개수</b><br>
						</div>
						<div class="sub_co">
							${map.cosComp1.cname} <br>
							${CodeToString.educationToString(map.cosComp1.education)}<br>
							${CodeToString.dateToStirng(map.cosComp1.mon, map.cosComp1.tue, map.cosComp1.wed, map.cosComp1.thu, map.cosComp1.fri, map.cosComp1.sat, map.cosComp1.sun)}<br>
							${map.cosComp1.time}<br>
							${map.cosComp1.price}원<br>
							${map.cosComp1.teacher1} , ${map.cosComp1.teacher2}<br>
							${map.cosComp1.startday}<br>
							${map.cosComp1.endday}<br>
							${map.cosComp1.course_rating}<br>
							${map.cosCompRe1}<br>
						</div>	
					
					</div>
				</div>
				<div class="child" style="border-left: 1px solid #D9D9D9;">
					
					<img src="/tobe/img/course_img/${map.cosComp2.teacher_img_org}" class="cImg">
					<div class="text_s">
						<div>
							<b>과정명</b> <br>
							<b>학원</b>  <br>
							<b>요일</b> <br> 
							<b>시간</b>  <br>
							<b>가격</b>  <br>
							<b>강사명</b> <br>
							<b>개강일</b> <br>
							<b>종강일</b>  <br>
							<b>후기평점</b><br>
							<b>후기개수</b><br>
						</div>
						<div  class="sub_co">
							${map.cosComp2.cname} <br>
							${CodeToString.educationToString(map.cosComp2.education)}<br>
							${CodeToString.dateToStirng(map.cosComp2.mon, map.cosComp2.tue, map.cosComp2.wed, map.cosComp2.thu, map.cosComp2.fri, map.cosComp2.sat, map.cosComp2.sun)}<br>
							${map.cosComp2.time}<br>
							${map.cosComp2.price}<br>
							${map.cosComp2.teacher1} , ${map.cosComp2.teacher2}<br>
							${map.cosComp2.startday}<br>
							${map.cosComp2.endday}<br>
							${map.cosComp2.course_rating}<br>
							${map.cosCompRe2}<br>
						</div>	
					</div>
				</div>
			</div>	 	
	 		<p id = "close"> <a href="#ex1" rel="modal:open" class="bnt" >닫기</a></p>
		</div>
		