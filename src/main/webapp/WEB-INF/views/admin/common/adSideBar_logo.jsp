<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지 사이드바</title>


</head>
<style>


.mainLeftBar > a:link {
	text-decoration: none;
}

.mainLeftBar > a:visited {
	text-decoration: none;
	color: #fff; 
}


.mainLeftBar {
	position: absolute;
	width: 14rem;
	height: 45rem;
	background-color: #3F4350;
}

#admin_logo {
	position: absolute;
	width: 14rem;
}



.admin_course {
	position: absolute;
	width: 14rem;
	top: 9rem;
	left: 1rem;
	color: #fff;
}

.admin_pay {
	position: absolute;
	width: 14rem;
	top: 15rem;
	left: 1rem;
	color: #fff;
}

.admin_qna {
	position: absolute;
	width: 14rem;
	top: 21rem;
	left: 1rem;
	color: #fff;
}

#logout { 
	position: absolute; 
	left: 60rem; 
	top: 3.5rem; 
	font-size: 1rem; 
	cursor: pointer; 
} 

#logout:link, #logout:visited {
	text-decoration: none;
	color: #000;
}



</style>
<body>
<div class="mainLeftBar">
	<a href="/tobe/admin/common/adIndex.do"><img src="/tobe/img/admin_logo.png" id="admin_logo" onmouseover="this.style.cursor='pointer'"></a>
	<hr id="line" style="position: absolute; top: 5.5rem; border: solid 1px pink; width: 14rem;">
	
	<a href="/tobe/admin/course/adCourseIndex.do" class="admin_course">
		<img src="/tobe/img/admin_course_img.png" style="width: 3rem;">
		<span style="position: absolute; top: 0.75rem; left: 4rem; font-size: 1.23rem;"><b>강좌관리</b></span>
	</a>

	<a href="/tobe/admin/pay/adPayIndex.do" class="admin_pay">
		<img src="/tobe/img/admin_pay_img.png" style="width: 3rem;">
		<span style="position: absolute; top: 0.75rem; left: 4rem; font-size: 1.23rem;"><b>주문결제관리</b></span>
	</a>
	
	<a href="/tobe/admin/customer/adQnaIndex.do" class="admin_qna">
		<img src="/tobe/img/admin_qna_img.png" style="width: 3rem;">
		<span style="position: absolute; top: 0.75rem; left: 4rem; font-size: 1.23rem;"><b>문의관리</b></span>
	</a>
	
	<div id="logout">
		<a href="/tobe/admin/common/adLogout.do" id="logout">로그아웃</a>
	</div>
</div>
</body>
</html>