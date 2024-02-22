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
	display:flex;
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
	<%@include file="/WEB-INF/views/user/common/userSidebar.jsp"%>
	<%@include file="/WEB-INF/views/user/common/userChatBot.jsp"%>
    	<%@include file="/WEB-INF/views/user/common/userHeader.jsp"%>
   	</div>
   	<div class="main">
      <div class="sub">
        <div class="size">
            <h3 class="sub_title">문의</h3>
            <div class="bbs">
                <div class="view">
                    <div class="title">
                        <dl>
                            <dt>문의| ${vo.q_title}</dt>
                            <dd class="date"><c:out value="${vo.q_writedate}" /> </dd>
                        </dl>
                    </div>
                    <div class="cont"><p>${vo.q_content}</p></div>
                    <dl class="file">
                        <dt>첨부파일 </dt>
                        <dd>
                        <a href="#" 
                        target="_blank">첨부파일.pptx [38.07KB] </a></dd>
                    </dl>
                                
                    <div class="btnSet clear">
                        <div class="fl_l"><a href="/tobe/user/qna.do" class="btn">목록으로</a></div>
                    </div>
            		<div class="btnSet">
			   				<c:if test="${!empty loginInfo and loginInfo.member_no == vo.member_no}">
			                     <a class="btn" href="/tobe/user/customer/userModAskForm.do?qna_no=${vo.qna_no }">수정</a>
			                </c:if>
		   					<c:if test="${!empty loginInfo and loginInfo.member_no == vo.member_no}">
			                     <a class="btn" href="/tobe/user/customer/qna/delete.do?qna_no=${vo.qna_no }">삭제</a>
			                </c:if>
		   			</div>
                </div>
            </div>
        </div>
       </div>
      </div>
  
		   	
	<div class="footerBox">
		<%@include file="/WEB-INF/views/user/common/userFooter.jsp"%>
	</div>
</body>
</html>