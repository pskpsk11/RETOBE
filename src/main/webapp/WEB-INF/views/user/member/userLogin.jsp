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

</head>


<body>
    <div class="wrap">
	<%@include file="/WEB-INF/views/user/common/userSidebar.jsp"%>
    <%@include file="/WEB-INF/views/user/common/userChatBot.jsp"%>		<div class="headerBox">
			<%@include file="/WEB-INF/views/user/common/userHeader.jsp"%>
		</div>
    	<div class="main">
	    	<form action="login.do" method="post" id="board1" name="board1" onsubmit="">
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