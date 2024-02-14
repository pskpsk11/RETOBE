<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의</title>
</head>
<body>
<%@include file="/WEB-INF/views/chiefAdmin/common/chiefSideBar_logo.jsp" %>
	<form action="">
			<div class = "qnaDetailTitle">
		   		<h1>1:1문의</h1>
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
		 	</div>
	</form>
</body>
</html>