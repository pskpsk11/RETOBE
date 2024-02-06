<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학원관리자 페이지</title>
</head>
<style>
* {
	box-sizing: border-box;
	 margin:0;
    padding:0;
}

body {
	position: relative;
}
#contain{
   width: 125px;
   background-color: #3F4350;
}

#logo {
   background-color: #3F4350;
   img_size: 30px;
   height: 125px;
   width: 125px;
}

#logo>img {
   width: 90%;
   margin-left: 5px;
   margin-top: 12px;
   cursor:pointer;
}

#btn>img {
   max-width: 75px;
   max-height: 75px;
   display: block;
   margin-left: 10px;
   cursor:pointer;
}

#btno>img {
   max-width: 100px;
   max-height: 100px;
   display: block;
   margin-left: 10px;
   cursor:pointer;
}

#btne>img {
   max-width: 70px;
   max-height: 70px;
   display: block;
   margin-left: 10px;
}

#btna>img {
   max-width: 80px;
   max-height: 80px;
   display: block;
   margin-left: 10px;
}

#btn {
   background-color: #3F4350;
   height: 75px;
   width: 125px;
   border: 0px;
}

#btno {
   background-color: #3F4350;
   height: 75px;
   width: 125px;
   border: 0px;
}

#btne {
   background-color: #3F4350;
   height: 75px;
   width: 125px;
   border: 0px;
}

#btna {
   background-color: #3F4350;
   height: 75px;
   width: 125px;
   border: 0px;
}

#mainlogo>img {
   background-color: #fff;
   border: 0px;
   margin: -50px 0 0 40px;
   max-width: 500px;
   max-height: 500px;
}
#main {
   display: flex;
   
   	height: 950px;
    width: 1500px;
}

a:link, a:visited {
	text-decoration: none;
	color: #000;
}
a:hover {
	text-decoration: none;
	color: #d3d3d3;
}

#logout{
	position: absolute;
	top: 2.5rem;
	left: 45rem;
	font-size: 110%;
}


#logout>a:link, #logout>a:visited {
	text-decoration: none;
	color: #000;
	
}

.admin_logo {
	position: absolute;
	width: 40rem;
	height: 5rem;
	top: 1rem;
	left: 10rem;
}
#mainlogo {
	margin : 20px;
}

</style>
<body>
<div id="main">
	<div id="contain">
    	<div id="logo">
        	<img src="/tobe/img/admin_logo.png" onclick="location.href='/tobe/admin/common/adIndex.do';">
			<hr style="border: solid 1px pink;">
		</div>
	
		<div>
		   	<button id="btn" onclick="location.href='/tobe/admin/course/adCourseIndex.do';"> 	
		   		<img src="/tobe/img/admin_course.png">
		    </button>
	   	</div>
		<div>
			<button id="btno" onclick="location.href='/tobe/admin/pay/adPayIndex.do';">
				<img src="/tobe/img/admin_order.png">
			</button>
		</div>
		<div>
		   	<button id="btno" onclick="location.href='/tobe/admin/customer/adQnaIndex.do';">
		      	<img src="/tobe/img/admin_qna.png">
		   	</button>
		</div>
		<div id="btna"></div>
		<div id="btna"></div>
	 	<div id="btna"></div>
	 	<div id="btna"></div>
	 	<div id="btna"></div>
	</div> 
	<div id="mainlogo">
     <c:if test="${admin.ad_type == 1}">
		<div class="hackers_logo admin_logo">
			<img src="/tobe/img/HACKERS_logo.png" style="width: 13rem;">
			<span style="position: absolute; top: 0.5rem; left: 14rem; font-size: 2rem;"><b>관리자 페이지_해커스</b></span>
		</div>
	</c:if>
	<c:if test="${admin.ad_type == 2}">
		<div class="PAGODA_logo admin_logo">
			<img src="/tobe/img/PAGODA_logo.png" style="position: absolute; width: 13rem; top:0.5rem;">
			<span style="position: absolute; top: 0.5rem; left: 14rem; font-size: 2rem;"><b>관리자 페이지_파고다</b></span>
		</div>
	</c:if>
	<c:if test="${admin.ad_type == 3}">
		<div class="YBM_logo admin_logo">
			<img src="/tobe/img/YBM_logo.png" style="position: absolute;  width: 13rem;">
			<span style="position: absolute; top: 0.5rem; left: 14rem; font-size: 2rem;"><b>관리자 페이지_YBM</b></span>
		</div>
	</c:if>
	</div>
	
	<div id="logout">
		<a href="/tobe/admin/common/adLogout.do" >로그아웃</a>
	</div>
	

</div>
</body>
</html>