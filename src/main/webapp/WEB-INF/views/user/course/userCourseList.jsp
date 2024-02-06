<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
	.paging {
		list-style: none;
	}
	.paging > li{
		float: left;
		margin:5px;
	}
	.subChildContainer{
		height: 400px;
		margin: 0 auto;
		display: table;
		text-align: center;
	}
	.childSelectBox1{
		position: relative;
		top: -0.5rem;
	}
	.subContainer{
		width:33.3333%;
		height: 50rem;
		display: contents;
	}
	.pagenate.clear{
		position:absolute;
		bottom:10rem;
		margin-left: 27rem;
	}
	a{
		text-decoration: none;
		color: #8ba888;
	}
</style>
	<c:forEach var="lecture" items="${map.list }">
	  		<div class = "subChildContainer">
				<p><a href="userCourseDetail.do?course_no=${lecture.course_no}"><img src="/tobe/img/course_img/${lecture.teacher_img_org}" alt="강사 이미지" width="150" height="150"></a></p>
              	<p>${lecture.cname}</p>
              	<p>${lecture.time}</p>
              	<p>${lecture.price}</p>
              	<div class = "childSelectBox1">
		   			<table>
		   				<tr>
							<td><button type="button" onclick="location.href='/tobe/user/common/userBasket.do?course_no=${lecture.course_no}'" class="SelectBtn">장바구니 담기</button></td>
							<td><button type="button" onclick="setCourseComp('${lecture.course_no}');" class="SelectBtn">비교함 담기</button></td>
							<td><button type="button" onclick="location.href='/tobe/user/pay/userPayDetail.do?course_no=${lecture.course_no}'" class="payBtn">결제 하기</button></td>
		   				</tr>
		   			</table>
				</div>
	  		</div>
	</c:forEach>
	<div class="pagenate clear">
	    <ul class='paging'>
	        <c:if test="${map.page > 1}">
			    <li><a href="userCourseDetail.do?page=${map.page - 1}"> << </a></li>
			</c:if>
			<c:forEach var="p" begin="1" end="${map.totalPage}">
			    <c:choose>
			        <c:when test="${p == map.page}">
			            <li><a href='#;' class='current'>${p}</a></li>
			        </c:when>
			        <c:otherwise>
			            <li><a href='javascript:loadInitialData(${p})'>${p}</a></li>
			        </c:otherwise>
			    </c:choose>
			</c:forEach>
			<c:if test="${map.page < map.totalPage}">
			    <li><a href="userCourseDetail.do?page=${map.page + 1}"> >> </a></li>
			</c:if>
	    </ul>
	</div>