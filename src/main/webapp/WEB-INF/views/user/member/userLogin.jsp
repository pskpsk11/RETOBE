<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">

<head> 
    <meta charset="utf-8">
    <title></title>
    <META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no"> 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
   	<!--<link rel="stylesheet" href="/tobe/css/user_Header_Footer.css"/>-->

  
<script>

function loginCheck() {
	if ($("#id").val() == '') {
		alert("아이디를 입력해 주세요");
		$("#id").focus();
		return false;
	}
	if ($("#pwd").val() == '') {
		alert("비밀번호를 입력해 주세요");
		$("#pwd").focus();
		return false;
	}
}
</script>
<style>
.main {
	width: 75rem;
	height: 50rem;
}
.sub{
   position:absolute;
   top:25rem;
   left:27.5rem;
   font-size: 1.25rem;
}
.no_dot{
   list-style-type:none;
   font-size: 1.25rem;
   padiing: 0;
}
.wrap {
	width: 85rem;
	height: 70rem;
	margin: 0 auto;
	position: relative;
}

* {
	box-sizing: border-box;
}

.header {
	width: 75rem;
	height: 15rem;
	position: absolute;
	top: 0;
	left: 5rem;
}

.header_memberBar {
	position: absolute;
	color: #000;
	right: 0;
	top: 10%;
	font-family: Inter;
	text-align: center;
	font-size: 1rem;
	letter-spacing: 0;
}

.tobe_logo {
	position: absolute;
	top: 4.5rem;
	width: 20rem;
}

.menu_container {
	position: absolute;
	width: 50rem;
	right: 0;
	top: 6.5rem;
}

a:link {
	text-decoration: none;
}

a:visited {
	text-decoration: none;
	color: #49654E;
}

.menu_container>ul>li {
	list-style: none;
	float: left;
	height: 3rem;
	line-height: 3rem;
	width: 25%;
	text-align: center;
	color: #d3d3d3;
	font-size: 2rem;
}

.menu_container>ul>li:hover {
	color: #49654E;
	font-weight: bolder;
	cursor: pointer;
}

.quickMenu {
	position: absolute;
	width: 4rem;
	top: 30rem;
	right: -5rem;
	z-index: 99999;
}

.quick {
	width: 4rem;
}

#goTop {
	cursor: pointer;
}

.footer {
	background-color: #d3d3d3;
	width: 100%;
	height: 12.5rem;
	position: absolute;
	top: 65rem;
}

.footer_content {
	display: grid;
	place-items: center;
}

.footer_logo {
	width: 6rem;
	display: grid;
	place-items: center;
	float: left;
	height: 5rem;
}

.footer_info {
	width: 37.5rem;
	display: grid;
	place-items: center;
	float: left;
	height: 5rem;
}


.no_dot {
	list-style-type: none;
	padding: 0 ;
}



.btnSet_clear .btn {
	text-decoration-line: none;
	border-radius: 10px;
	background-color: #F5F5F5;
	color: #000000;
	border-color: #000000;
	border-width: thin;
}
.login_form{
	border:1px solid black;
	border-radius:15px;
	text-align:center;
	width:350px;
	}
.login_form .login_btn{
	background:#E4E6D9; 
	width:200px; 
	border-radius:10px;
	border:none;
	text-align:center; 
	color:white;
	font-weight:bold;
	margin-top:30px;
}
p{
margin-bottom:20px;
}
input#id{
margin-top:30px;
}
input#pwd{
margin-top:10px;
}
	
.top{
text-align:center;
color: #0C4C2D;
margin-bottom:10px;
}
.find{
border:none;
}
.find:focus{
outline:none;
}
.change li{
text-align : center;
float:left;
list-style:none;
}
.id_pwd{
border:none;
background-color:rgba(0,0,0,0);
font-size:10px;
margin-left:120px;
cursor: pointer;
}

fieldset li{

margin:0 10px;
}
</style>

</head>


<body>
    <div class="wrap">
		<div class="headerBox">
			<%@include file="/WEB-INF/views/user/common/userHeader.jsp"%>
		</div>
    	<div class="main">
	    	<form action="userLogin.do" method="post" id="board1" name="board1" onsubmit="">
	            <div class="sub">
	                <h3 class="sub_title">로그인</h3>
	                	<div class="size">
	                    	
	                    <div class="member">
	                        <div class="box">
	                            <div class="login_form">
	                                <ul class="no_dot">	                                	
	                                    <li class="top" style="font-size:40px; font-weight:bold">TOBE</li>	                                
	                                    <li><input type="text" id="id" name="id" placeholder="아이디" style="width:200px; font-size: 1rem;"></li>
	                                    <li><input type="password" id="pwd" name="pwd" placeholder="비밀번호" style="width:200px; font-size: 1rem;"></li>
	                                    <ul class="change">
		                                    <!-- <li><label  style="font-size: 0.75rem;"><input type="checkbox" name="reg1" id="reg1" style="width:10px; height:10px;"/>아이디저장</label></li>  -->
		                                    <!-- <li><a href="userFindMember.do" class="btn" style="font-size:10px">아이디|비밀번호 찾기</a></li>  -->
		                                    <li float="left"><input class="id_pwd" type="button" value="아이디 | 비밀번호 찾기" onclick="window.open('userFindMember.do','window_name','width=450,height=600');"></li>
	                                    </ul>
	                                </ul>
	                               	<input class= "login_btn" type="submit" value="로그인"/>
	                               	<div class="btnSet_clear">
		                                <div style="color: #2F5720; font-size:xx-small; font-weight:bolder">
		                                    <p>아직 TOBE회원이 아니신가요?<a href="userJoinPolicy.do" class="btn">    회원가입    </a></p>
		                               </div>
	                            </div>
	                     
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </form>
        </div>
		<div class="footerBox">
			<%@include file="/WEB-INF/views/user/common/userFooter.jsp"%>
		</div>
	</div>	
</body> 
</html>