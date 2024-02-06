<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세페이지</title>
</head>
<script>realTextBox.innerHTML = realTextBox.innerHTML.replace(/<p>/g, "").replace(/<\/p>/g, "");</script>
<style>
.container{
   position: relative;
   margin: -845px 0 0 160px;
   width : 1340px ;
   height : 850px;
   
    
} 
.noticeDetailTitle{
	width: 75rem;
	margin: 0 auto;
}
table{
	width: 75rem;
	text-align: center;

}

#Line{
	border: 0.5px solid #000;
	width : 75rem;
}
.textBox{
	width: 75rem;
	height: 45rem;

}

#realTextBox{
	width: 75rem;
	height: 40rem;
	background-color: #f1f3f5;
	border: 0;
}
a:hover {
	text-decoration: none;
	background-color : #3F4350;
}
.bnt{
     background-color: #E5D1E3;
     padding: 5px 15px;
     margin : -2px 0 0 1100px;
     text-align: center;
     border-radius: 15px;
     
}

</style>
<body>
<%@include file="/WEB-INF/views/chiefAdmin/common/chiefSideBar_logo.jsp" %>
<div class="container">
	<form action="">
			<div class = "noticeDetailTitle">
		   		<h1>공지사항</h1><br>
		   	</div>
		   	<div id="Line">
			   	<hr>
		   	</div>
		   	<div>
		   		<table>
				    <tr>
				        <td>${notice.n_title}</td>
				        <td><c:out value="${notice.n_writedate}" /></td>
				    </tr>
				</table>
		   	</div>
		   	<div id="Line">
		   		<hr>
		   	</div>
		   	<div class = "textBox">
		   		<div id = "subContainer">
		   			<input type="text" value="${notice.n_content}" readonly id="realTextBox">
		   		</div>
		   	</div>
		   	<div id="comBack">
		  			<!-- <a type="button" style="background-color: #E5D1E3; border-radius: 15px; width: 70px; padding: 5px 15px;" onclick="location.href='/tobe/chiefAdmin/customer/chiefCustomerIndex.do'">목록</a> -->
					<a class="bnt" class="btn" onclick="location.href='/tobe/chiefAdmin/customer/chiefCustomerIndex.do'">목록</a>
		 	
		 	</div>
	</form>
</div>	
</body>
</html>