<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의</title>
<style>
.container{
   position: relative;
   margin: -845px 0 0 160px;
   width : 1340px ;
   height : 850px;
} 

#top{
	position: relative;
	margin: -580px 0 0 570px; 
}
#topb{
	display: flex;
	margin: 50px 0 -50px -160px;
}
#f{
	border: solid 0.5px;
	width:170px; 
	height:140px;
}

#f> img{
	margin: 10px 0 0 0;
}
#f:hover{
	 color: #49654E;
    font-weight: bolder;
    cursor:pointer; 
    background-color: #F1F8E0;
}
#fi{
	border: solid 0.5px;
	width:170px; 
	height:140px;
	background-color:#F1F8E0;
}

#fi> img{
	margin: 10px 0 0 0;
}
.search-wrap {
	width: 30rem;
	height: 2rem;
	margin: 60px 0 -180px 450px;;
}

.dSelect {
	font-size: 1.1rem;
	float: left;
}

#searchBtn {
		margin-left: 10px;
		border: 1px solid #808080;
		text-align: center;
		width: 50px;
		height: 23px;
		background-color: #E4E6D9;
		cursor: pointer;
		border-radius: 5px;
		font-size: 13px;
}

.list{
	width : 100% ;
	align-items: center;
}

</style>
</head>
<body>
<%@include file="/WEB-INF/views/chiefAdmin/common/chiefSideBar_logo.jsp" %>
	<div class="container">
	<form action="">
			<div class = "qnaDetailTitle">
		   		<h1>문의</h1>
		   	</div>
		   	<div id="firstLine">
			   	<hr>
		   	</div>
		   	<div>
		   		<table>
				    <tr>
				        <td>${qna.q_title}</td>
				        <td><c:out value="${qna.q_writedate}" /></td>
				    </tr>
				</table>
		   	</div>
		   	<div id="secondLine">
		   		<hr>
		   	</div>
		   	<div class = "textBox">
		   		<div class = "subContainer">
		   			<input type="text" value="${qna.q_content}" readonly id="realTextBox">
		   		</div>
		   	</div>
		   	<div class = "combackBtn">
		  			<button type="button" onclick="location.href='/tobe/gmanager/qnaList.do'" class="comBack">목록</button></td>
		  			<a href="replyForm.do?no=${vo.qna_no}" class="btn">답변</a>
		 	</div>
	</form>
	</div>
</body>
</html>