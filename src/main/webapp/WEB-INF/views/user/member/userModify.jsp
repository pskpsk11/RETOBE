<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Tobe 회원정보 수정</title>

<META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />

<script type="text/javascript">

</script>

<style>
.main {
	width: 75rem;
	height: 50rem;
}

.userMain {
	width: 75rem;
	height: 10rem;
	background-color: #E4E6D9;
}

.userMain a:link, a:visited {
	text-decoration: none;
	color: #49654E;
}


.part1 {
	position: absolute;
	width: 10rem;
	height: 10rem;
	text-align: center;
	font-color: #000;
	font-size: 1.5rem;
	left: 1rem;
	color: #49654E;
}

#userName {
	position: absolute;
	top: 0.75rem;
	left: 1.5rem;
}
#userId {
	position: absolute;
	top: 4rem;
	left: 1.5rem;
}

.part2 {
	position: absolute;
	width: 20rem;
	height: 10rem;
	font-size: 1.25rem;
	left: 15rem;
	color: #49654E;
}

#set {
	position: absolute;
	width: 20rem;
	height: 4rem;
	margin: 0 auto;
	padding: 0;
	top: 1rem;

}

#quit {
	position: absolute;
	width: 20rem;
	height: 4rem;
	top: 4.5rem;
	margin: 0 auto;
	padding: 0;
}

#setImg, #quitImg {
	position: absolute;
	width: 2.5rem;
	top: 1rem;
}

#setText{
	position: absolute;
	text-align: center;
	left: 3.5rem;
	top: 1.35rem;
}

#quitText {
	position: absolute;
	text-align: center;
	left: 3.5rem;
	top: 1.25rem;
}

.pointContainer {
	margin: 0 0 0 53rem;
	width: 22rem;
	height: 10rem;
}

#pointImg {
	margin: 1.9rem 0;
	float: left;
}

#point {
	float: left;
	margin: 3rem 0 0 1rem;
	width: 13rem;
	height: 4rem;
	color: #49654E;
}

#userPointText {
	width: 13rem;
	font-size: 1.25rem;
}
#numPointText {
	width: 11.5rem;
	font-size: 1.25rem;
}

.modifyMain {
	position: absolute;
	top: 30em;
	width: 40rem; 
	left: 16rem;
	height: 30rem;
}

#pwdCheckBox {
	margin: 2rem 12rem;
}

#idCheck, #pwdCheck {
	width: 15rem;
	text-align: center;
	font-size: 1.15rem;	
	padding: 0.5rem;
	margin: 0.5rem auto;
}

#pwdCheckBtn {
	position: absolute;
	width: 6rem;
	height: 2rem;
	font-size: 1.25rem;
	top: 17.5rem;
	left: 16.5rem;
	background-color: #000;
	color: #fff;
    cursor: pointer;
}



</style>



</head>
<body>
	<div class="wrap">
		<div class="headerBox">
			<%@include file="/WEB-INF/views/user/common/userHeader.jsp"%>
		</div>
		<div class="main">
			<div class="userMain">
				<div class="part1">
					<p id="userName"><b>${user.name }</b>님</p>
					<p id="userId">${user.id }</p>
				</div>
				<div class="part2">
					<div id="set">
						<a href="/tobe/user/member/userModify.do">
							<img src="/tobe/img/set.png" id="setImg">
							<span id="setText">회원정보수정</span>
						</a>
					</div>
					<div id="quit">
						<a href="/tobe/user/member/userQuit.do">
							<img src="/tobe/img/quit.png" id="quitImg">
							<span id="quitText">회원탈퇴</span>
						</a>
					</div>
				</div>
				
				<div class="pointContainer"><img src="/tobe/img/point.png" id="pointImg">
					<span id="point">
						<span id="userPointText"><b>${user.name }</b>님의 잔여포인트</span>
						<span id="numPointText"><b>${user.point } </b> 포인트</span>
					</span>
				</div>
			</div>
			
			<div class="modifyMain">
				<div id="pwdCheckText">
					<h3 style="font-size: 1.75rem; text-align:center;">비밀번호 확인</h3>
					<p style="font-size: 1.25em;">개인정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인합니다.</p>
				</div>
					
				<form method="post" action="userModifyForm.do" id="frm">
					<div id="pwdCheckBox">
						<input type="text" id="idCheck" value="${user.id }" disabled><br>
						<input type="password" id="pwdCheck" name="pwd" maxlength="20" placeholder="비밀번호를 입력해주세요" required><br>
					</div>
					<input type="submit" id="pwdCheckBtn" value="확인">
				</form>
			</div>
			
		</div>
		<div class="footerBox">
			<%@include file="/WEB-INF/views/user/common/userFooter.jsp"%>
		</div>
	</div>
</body>
</html>