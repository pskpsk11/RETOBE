<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="kr.co.retobe.util.CodeToString"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<title>Insert title here</title>
<link rel="stylesheet" href="/tobe/css/reset.css" />
<link rel="stylesheet" href="/tobe/css/common.css" />
<link rel="stylesheet" href="/tobe/css/main.css" />
<link rel="stylesheet" href="/tobe/css/contents.css" />
<link rel="stylesheet" href="/tobe/css/swiper.css" />
<link
     href="https://fonts.googleapis.com/css?family=Sintony:400,700"
     rel="stylesheet"
/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="/tobe/js/function.js" type="text/javascript"></script>
<script src="/tobe/js/function_jquery.js" type="text/javascript"></script>
<style>
* {padding:0;margin:0;}
input[id="menuicon"] {display:none;}
input[id="menuicon"] + ul {display:block;position:fixed;right:0;top:50%;transform:translateY(-50%);transition:all .35s;text-align:right; z-index:99999;}
input[id="menuicon"] + ul > li {display:block;width:50px;height:50px;border:1px solid #f1f1f1;position:relative;margin-top:-1px;}
input[id="menuicon"] + ul > li > a {display:block;width:auto;height:50px;overflow:hidden;transition:all .35s;}
input[id="menuicon"] + ul > li > label {display:block;cursor:pointer;width:auto;height:50px;background:#fa0318f0;}
input[id="menuicon"] + ul > li:nth-child(1) label span {display:block;position:absolute;width:50%;height:3px;border-radius:30px;background:#fff;transition:all .35s;}
input[id="menuicon"] + ul > li:nth-child(1) label span:nth-child(1) {top:30%;left:50%;transform:translateX(-50%);}
input[id="menuicon"] + ul > li:nth-child(1) label span:nth-child(2) {top:50%;left:50%;transform:translate(-50%,-50%);}
input[id="menuicon"] + ul > li:nth-child(1) label span:nth-child(3) {bottom:30%;left:50%;transform:translateX(-50%);}
input[id="menuicon"] + ul > li:nth-child(2) a .icon {background:url('./img/search.png') center center no-repeat;background-size:50%;display:inline-block;width:50px;height:50px;vertical-align:middle;}
input[id="menuicon"] + ul > li:nth-child(3) a .icon {background:url('./img/sand-clock.png') center center no-repeat;background-size:50%;display:inline-block;width:50px;height:50px;vertical-align:middle;}
input[id="menuicon"]:checked + ul {z-index:2;right:300px;}
input[id="menuicon"]:checked + ul > li:nth-child(1) label {z-index:2;right:300px;}
input[id="menuicon"]:checked + ul > li:nth-child(1) label span:nth-child(1) {top:50%;left:50%;transform:translate(-50%,-50%) rotate(45deg);}
input[id="menuicon"]:checked + ul > li:nth-child(1) label span:nth-child(2) {opacity:0;}
input[id="menuicon"]:checked + ul > li:nth-child(1) label span:nth-child(3) {bottom:50%;left:50%;transform:translate(-50%,50%) rotate(-45deg);}
div[class="sidebar"] {width:300px;height:100%;background:#ff5050;position:fixed;top:0;right:-300px;z-index:1;transition:all .35s;}
div[class="sidebar"] > ul > li > a {display: block; color: white; font-size: 25px; font-weight: bold; padding-top: 20px; padding-bottom: 20px; padding-left: 50px;}
div[class="sidebar"] > ul > li > span {display: block; color: white; font-size: 25px; font-weight: bold; padding-top: 20px; padding-bottom: 20px; padding-left: 50px; cursor: pointer;}
input[id="menuicon"]:checked + ul + div {right:0; z-index: 9999999;}
</style>
<script type="text/javascript">
function courseView() {
	$.ajax({
		type: 'GET',
		url:'/tobe/user/modal.do',
		data:{
			a : 1
		},
		success:function(res) {
			console.log(res);
			$('#ex1').html(res);
			
			$('#ex1').modal();
			
		}
	})
}
</script>
</head>
<body>
<input type="checkbox" id="menuicon">
<ul>
	<li>
		<label for="menuicon">
			<span></span>
			<span></span>
			<span></span>
		</label>
	</li>
</ul>
<div class="sidebar">
	<ul>
		<li>
			<a href="#">장바구니</a>
		</li>
		<li>
			<span onclick="courseView();">비교함</span>
		</li>
		<li>
			<c:if test ="${!empty loginInfo }">
				<a href="/tobe/user/mypage.do">마이페이지</a>
			</c:if>
		</li>
	</ul>
</div>
<div id="ex1" class="modal">
		
</div>
</body>
</html>