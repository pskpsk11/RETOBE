<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Tobe 회원탈퇴</title>

<META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
<link rel="stylesheet" href="/tobe/css/user_Header_Footer.css" />

<script type="text/javascript">

</script>

<style>
.main {
	width: 75rem;
	height: 55rem;
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

.quitMain {
	position: absolute;
	top: 17.5rem;
	width: 40rem; 
	left: 17.5rem;
}

#pwdCheckBox {
	margin: 2rem 12rem;
}

#idCheck, #pwdCheck {
	width: 15rem;
	text-align: center;
	font-size: 1rem;	
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
}

.quitNotice {
	position: absolute;
	top: 24rem;
	left: 1rem;
}

.quitBox {
	position: absolute;
	width: 71rem;
	left: 1rem;
	top: 42.5rem;
}

.line {
	position: absolute;
	background-color: #49654E;
	width: 72rem;
	height: 2px;
	top: 4rem;
	
}

#quitAgree {
	position: absolute;
	width: 8rem;
	height: 2rem;
	font-size: 1.25rem;
	background-color: #000;
	color: #fff;
    cursor: pointer;
    left: 31rem;
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
			
			<div class="quitNotice">
				<h2>그동안 Tobe를 이용해주셔서 감사합니다.</h2>
				<p style="font-size: 1.15rem; margin: 0 0;">공영쇼핑 회원탈퇴 시 아래 사항을 확인하여 주시기 바랍니다.</p>
				<ul style="font-size: 1.15rem; margin: 0.5rem; padding: 0 0 0 1rem;">
					<li>고객님의 정보는 전자상거래 소비자보호법에 의거한 공영쇼핑 개인정보보호정책에 따라 관리됩니다.
					<li>탈퇴 시 고객님께서 보유하셨던 포인트는 모두 삭제되며, 재가입 시에도 복원되지 않습니다.</li>
					<li>탈퇴 후 <b>3개월</b>동안 재가입을 하실 수 없습니다.</li>
					<li>탈퇴 <b>3개월</b> 이후 재가입 시 동일 ID 재사용이 가능합니다.</li>
					<li>탈퇴 시 <b>예치금은 환불처리가 가능(반드시 본인명의의 계좌만 가능)하며</b>, 환불요청은 고객센터(02-1234-5678)로 연락 주시기 바랍니다.</li>
					<li>탈퇴 시 받으신 혜택 제공은 모두 취소됩니다.</li>
				</ul>
			</div>
			
			<div class="quitBox">
				<h2 id="q">회원 탈퇴 사유</h2>
				<div class="line"></div>
				<form class="quitForm" method="post" action="userQuit.do">
					<table>
						<tr>
							<th style="width: 10rem; font-size: 1.25rem;" >회원 탈퇴 사유</th>
							<td >
								<select id="quitReason" style="width: 15rem; height: 2rem; font-size: 1rem;" required>
									<option value="1">강의종류 불만</option>
									<option value="2">강의가격 불만</option>
									<option value="3">강의질 불만</option>
									<option value="4">강사 불만</option>
									<option value="5">환불 불만</option>
									<option value="6">고객응대 불만</option>
									<option value="7">시스템 불만</option>
									<option value="8">이용빈도 낮음</option>
									<option value="9">개인정보 유출 우려</option>
									<option value="10">포인트 및 혜택 부족</option>
									<option value="11">기타</option>
								</select>
							</td>
						</tr>
						<tr>
							<th style="font-size: 1.25rem;">기타 불만 사항</th>
							<td><textarea id="quitOpnion" cols="100" rows="10" placeholder="(선택입력)Tobe에 의견이 있으시면 작성해주세요." 
									style="font-size:1rem;"></textarea></td>
						</tr>					
					</table>
					<input type="checkbox" id="quitCheck" name="quitCheck" required>
					<span style="font-size: 1rem;"><b>회원탈퇴 안내를 모두 확인하였으며 탈퇴에 동의합니다.</b></span><br><br>
					<input type="submit" id="quitAgree" value="탈퇴하기">
				</form>
			</div>

			
			
		</div>
		<%@include file="/WEB-INF/views/user/common/userFooter.jsp"%>
	</div>
</body>
</html>