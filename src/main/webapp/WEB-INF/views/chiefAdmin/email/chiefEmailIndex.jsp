<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<style>
.container{
	position: relative;
	margin: -845px 0 0 160px;
	width : 1340px ;
	height : 840px;
	 
}
.email_sub{
	width : 1340px ;
	height : 650px;
	display: flex;
	flex-direction: row;  
	justify-content : space-around;
	align-items: center; 
}
.mail{
	width : 250px ;
	height : 250px;
 	border: 2px solid #ddd;
	align-items: center;
	display: flex;
	flex-direction: column; 
	justify-content : space-evenly;
}
.mailImg{
	width : 120px ;
	height:120px;
}
.image{
	width : 100% ;
	height : 100%;

}
</style>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="wrqp">
	<%@include file="/WEB-INF/views/chiefAdmin/common/chiefSideBar_logo.jsp" %>
	<div class="container">
		<div class="email_sub">
			<div class="mail" style="background-color:#F8FFF5;">
				<div class="mailImg" >
					<img class="image" src="/tobe/img/emailSend.png" onclick="location.href='/tobe/emailForm.do';" >
				</div>
			     <a href="/tobe/emailForm.do"><b>메일작성하기</b></a></font>
			</div>
			<div class="mail" style="background-color:#FDFFF3;">
				<div class="mailImg" >
					<img class="image" src="/tobe/img/eamilBoxpng.png" onclick="location.href='/tobe/gmanager/emailBox.do';" id="mail"><br>
				</div>  	
				<a href="/tobe/gmanager/emailBox.do" ><b>보낸메일함</b></a>
			</div>
			<div class="mail" style="background-color:#F9FFFE;">
				<div class="mailImg">
				   <img class="image" src="/tobe/img/emailMember.png" onclick="location.href='/tobe/gmanager/memberListEmail.do';"><br>
				</div>
				   <a href="/tobe/gmanager/memberListEmail.do" ><b>회원목록바로가기</b></a>
			</div>
		</div>
	</div>  
</div>
</body>
</html>