<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
<link rel="stylesheet" href="/tobe/css/user_Header_Footer.css" />
</head>
<style>
.footer{
	position: relative;
	top: 50rem;
}
.NoticeDetailTitle{
	position: relative;
	top:13rem;
	margin: 0 auto;
	width: 1200px;
}
#firstLine{
	width: 1200px;
	margin: 0 auto;
	position: relative;
	top:13rem;
}
#secondLine{
	width: 1200px;
	margin: 0 auto;
	position: relative;
	top: 15rem;
}
hr{
	border: 1px solid #000;
}
.textBox{
	width: 1200px;
	position: relative;
	margin: 0 auto;
	top: 18rem;
}
#realTextBox{
	width: 1200px;
	height: 700px;
	background-color: #f1f3f5;
	border: 0;
}
.combackBtn{
	position:relative;
	margin: 0 auto;
	width: 1200px;
	top: 20rem;
}
.comBack{
	width: 70px;
	cursor: pointer;
   	color: white;
   	border: 0;
   	/* display: flex; */
   	/*align-items: center;
   	justify-content: center;
   	/* position: inherit; */
   	font-size: 16px;
   	/* padding: 8px 16px; */
   	margin: 5px 10px;
   	height: 34px;
   	border-radius: 20px;
   	background-color: #8ba888;
   	border-color: #000;
   	/* text-align: center; */
   	letter-spacing: -0.5px;
   	position: relative;
}
</style>
<body>
	<div class="wrap">
      	<%@include file="/WEB-INF/views/user/common/userHeader.jsp"%>
   	<div class = "NoticeDetailTitle">
   		<h1>공지사항 | ${vo.n_title}</h1>
   	</div>
   	<div id="firstLine">
	   	<hr>
	   	<c:out value="${vo.n_writedate}" />
   	</div>
   	<div class = "textBox">
   		<div class = "subContainer">
   			<input type="text" value="${vo.n_content}" readonly id="realTextBox">
   		</div>
   	</div>
   	<div class = "combackBtn">
  			<button type="button" onclick="location.href='/tobe/user/customer/userCustomer.do'" class="comBack">목록</button></td>
 	</div>
   	<%@include file="/WEB-INF/views/user/common/userFooter.jsp"%>
   	</div>
</body>
</html>