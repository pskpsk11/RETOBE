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
</head>
<style>

.NoticeDetailTitle {
	width: 70rem;
	margin: 0 auto;
}

#firstLine{
	width: 70rem;
	margin: 0 auto;
}
#secondLine{
	width: 70rem;
	margin: 0 auto;
}

hr{
	border: 1px solid #000;
}
.textBox{
	width: 70rem;
	margin: 0 auto;

}
#realTextBox{
	width: 70rem;
	margin: 0 auto;
	height: 350px;
	background-color: #f1f3f5;
	border: 0;
}

.correction{
	width: 70rem;
	margin: 0 auto;
	padding-left: 65rem;
}

.textBoxAnswer{
	width: 70rem;
	margin: 0 auto;
}
.combackBtn{
	margin: 0 auto;
	width: 70rem;
}
.comBack{
	width: 70px;
	cursor: pointer;
   	color: white;
   	border: 0;
   	font-size: 16px;
   	margin: 5px 10px;
   	height: 34px;
   	border-radius: 20px;
   	background-color: #8ba888;
   	border-color: #000;
   	letter-spacing: -0.5px;
}


</style>
<body>
	<div class="wrap">
		<div class="headerBox">
			<%@include file="/WEB-INF/views/user/common/userHeader.jsp"%>
		</div>
		<div class="main">
		   	<div class = "NoticeDetailTitle">
		   		<h1>문의 | ${vo.q_title}</h1>
		   	</div>
		   	<div id="firstLine">
			   	<hr>
			   	<c:out value="${vo.q_writedate}" />
		   	</div>
		   	<div class = "textBox">
	   			<input type="text" value="${vo.q_content}" readonly id="realTextBox">
		   	</div>
		   	
		   	<div class="btnSet clear">
               <div class="fl_l">
               	<a href="qna.do" class="btn">목록</a>
               </div>
       		</div>
	   	
		   	<div class="correction">
		   		<table>
		   			<tr>
		   				<td>
			   				<c:if test="${!empty loginInfo and loginInfo.member_no == vo.member_no}">
			                     <a class="btn" href="userModAskForm.do?qna_no=${vo.qna_no }">수정</a>
			                </c:if>
		                </td>
		   				<td>
		   					<c:if test="${!empty loginInfo}">
			                     <a class="btn" href="/tobe/user/customer/qna/delete.do?qna_no=${vo.qna_no }">삭제</a>
			                </c:if>
		                </td>
		   			</tr>
		   		</table>
		   	</div>
	   	
		   	
		<div class="footerBox">
			<%@include file="/WEB-INF/views/user/common/userFooter.jsp"%>
		</div>
   	</div>
</body>
</html>