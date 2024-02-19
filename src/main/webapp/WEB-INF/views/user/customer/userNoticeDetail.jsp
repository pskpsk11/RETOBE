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

<body>
	<div class="wrap">
    	<%@include file="/WEB-INF/views/user/common/userHeader.jsp"%>
   	</div>
   	<div class="main">
      <div class="sub">
        <div class="size">
            <h3 class="sub_title">공지사항</h3>
            <div class="bbs">
                <div class="view">
                    <div class="title">
                        <dl>
                            <dt>공지사항 | ${vo.n_title}</dt>
                            <dd class="date"><c:out value="${vo.n_writedate}" /> </dd>
                        </dl>
                    </div>
                    <div class="cont"><p>${vo.n_content}</p></div>
                    <dl class="file">
                        <dt>첨부파일 </dt>
                        <dd>
                        <a href="#" 
                        target="_blank">첨부파일.pptx [38.07KB] </a></dd>
                    </dl>
                                
                    <div class="btnSet clear">
                        <div class="fl_l"><a href="/tobe/user/notice.do" class="btn">목록으로</a></div>
                    </div>
            
                </div>
            </div>
        </div>
    </div>
    
   		<%@include file="/WEB-INF/views/user/common/userFooter.jsp"%>
   	</div>
</body>
</html>