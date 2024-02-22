<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="kr.co.retobe.util.CodeToString"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Tobe 마이페이지</title>

<META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />

<script type="text/javascript">

$(function(){
	
	$('.mainMenu').click(function(){
		
	    $('.mainMenu').removeClass('on');
	    $(this).addClass('on');
	    if($(this).text() == '현재 수강 중인 강좌') {
	        $('.currentCourseIndex').show();
	        $('.pastCourseIndex').hide();
	        $('.askIndex').hide();
	        $('.myReviewIndex').hide();
	    } else if($(this).text() == '수강 신청 내역'){
	        $('.currentCourseIndex').hide();
	        $('.pastCourseIndex').show();
	        $('.askIndex').hide();
	        $('.myReviewIndex').hide();
	    } else if($(this).text() == '나의 문의'){
	        $('.currentCourseIndex').hide();
	        $('.pastCourseIndex').hide();
	        $('.askIndex').show();
	        $('.myReviewIndex').hide();
	    } else if($(this).text() == '나의 후기'){
	        $('.currentCourseIndex').hide();
	        $('.pastCourseIndex').hide();
	        $('.askIndex').hide();
	        $('.myReviewIndex').show();
	    }
	})
})
</script>
<script>
$(document).ready(function() {
	$('.currentCourseIndex').show();
});
</script>

<style>
.main {
	display: flex;
	margin: 0 auto;
	width: 100%;
	height: auto;
	position: relative;
	max-width: 100%;
	flex-direction: column;
    flex-wrap: wrap;
    align-content: center;
    align-items: center;
}

.userMain {
	width: 100%;
	height: auto;
	margin: 0 auto;
	max-width: 1280px;
}

.userMain a:link, a:visited {
	text-decoration: none;
}

.part1 {
	position: relative;
	width: 600px;
	height: auto;
	text-align: center;
	font-color: #fff;
	font-size: 1.5rem;
	left: 1rem;
}

#userName {
	position: absolute;
	top: 0.75rem;
	left: 1.5rem;
}

#userName > b {
	color: #ff5050;
}
#userId {
	position: absolute;
	top: 4rem;
	left: 1.5rem;
}

.part2 {
	margin: 0 0 0 200px;
    position: absolute;
    width: 600px;
    height: auto;
    font-size: 25px;
}

#set {
	position: relative;
    width: 100%;
    height: auto;
    margin: 0 auto;
    padding: 0;

}

#quit {
	position: relative;
    width: 100%;
    height: auto;
    top: 65px;
    margin: 0 auto;
}

#setImg {
	position: absolute;
	width: 2.5rem;
	top: 1rem;
}

#quitImg {
	position: relative;
	width: 40px;
}

#setText{
	position: absolute;
	text-align: center;
	left: 3.5rem;
	top: 1.35rem;
}

#quitText {
    margin: 56px;
    position: relative;
    text-align: center;
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
}

#userPointText {
	width: 13rem;
	font-size: 1.25rem;
}

#userPointText > b{
	color: #ff5050;
}
#numPointText {
	width: 11.5rem;
	font-size: 1.25rem;
}

#numPointText > b {
	color: #ff5050;
}
.myPageMenu {
	width: 60rem;
	height: 2.25rem;
	margin: 0 auto;
	font-size: 1.75rem;
}

.mainMenu_bar {
	border-radius: 15px;
	max-width: 1280px;
    width: 100%;
    height: auto;
    margin: 0 auto;
    display: flex;
    flex-direction: column;
    flex-wrap: wrap;
    align-content: stretch;
    justify-content: center;
    background-color: #ff5050;
}

.mainMenu_bar>ul>li {
	list-style: none;
    float: left;
    height: 60px;
    line-height: 55px;
    width: 25%;
    text-align: center;
    font-size: 25px;
    color: #fff;
}

.mainMenu_bar>ul>li:hover {
	font-weight: bolder;
	cursor: pointer;
}


.mainMenu.on {
	font-weight: bolder;
	cursor: pointer;
}

.content_area {
	width: 100%;
    margin: 0 auto;
    max-width: 1280px;
    height: 500px;
}

.currentCourseIndex, .pastCourseIndex, .askIndex, .myReviewIndex {
	display: none;
}

.url {
	cursor: pointer;
}

input[type="button"], input[type="submit"] {
	background-color: #F0F5F8;
	border: #F0F5F8;
	cursor: pointer;
}

table {
	border: 1px solid #ddd;
	width: 100%;
	text-align: center;
}

.myReviewIndex a {
	text-decoration: none;
	color: #000;
}

#pointul{
	float: right;
}
</style>



</head>
<body>
<div class="wrap">
	<%@include file="/WEB-INF/views/user/common/userSidebar.jsp"%>
    <%@include file="/WEB-INF/views/user/common/userChatBot.jsp"%>	<div class="headerBox">
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
					<a href="/tobe/user/modify.do">
						<img src="/tobe/img/set.png" id="setImg">
						<span id="setText">회원정보수정</span>
					</a>
				</div>
				<div id="quit">
					<a href="/tobe/user/cancel.do">
						<img src="/tobe/img/quit.png" id="quitImg">
						<span id="quitText">회원탈퇴</span>
					</a>
				</div>
			</div>
			<ul id = "pointul">
				<li>
					<div class="pointContainer"><img src="/tobe/img/point.png" id="pointImg">
						<span id="point">
							<span id="userPointText"><b>${user.name }</b>님의 잔여포인트</span><br>
							<span id="numPointText"><b>${user.point } </b> 포인트</span>
						</span>
					</div>
				</li>
			</ul>
		</div>
		
		<div class="mainMenu_bar">
			<ul>
				<li class="mainMenu">현재 수강 중인 강좌</li>
				<li class="mainMenu">수강 신청 내역</li>
				<li class="mainMenu">나의 문의</li>
				<li class="mainMenu">나의 후기</li>
			</ul>
		</div>
		<div class="line"></div>

		<div class="content_area">
			<div class="currentCourseIndex">
				<c:if test="${empty cci}">
                       <tr>
                           <td class="noIndex">현재 수강 중인 강좌가 없습니다.</td>
                       </tr>
                   </c:if>
                   <c:if test="${!empty cci}">
                   	<table>
                   		<tr style="font-weight: bolder; font-size: 1.25rem;">
                   			<td style="width: 20%;">강좌번호</td>
							<td colspan="2" style="width: 40%;">강좌명</td>
							<td style="width: 20%;">개강일</td>
							<td style="width: 20%;">종강일</td>
						</tr>
	                    <c:forEach var="vo" items="${cci}">
							<tr style="text-align: center;">
                        		<td>${vo.course_no }</td>
	                            <td class="url" onclick="location.href='/tobe/user/userCourseDetail.do?course_no=${vo.course_no}'">
	                            	<img src="/tobe/img/course_img/${vo.teacher_img}" style="width: 7rem;">
                            	</td>
	                            <td class="url" onclick="location.href='/tobe/user/userCourseDetail.do?course_no=${vo.course_no}'">
	                            	<b style="font-size: 1.25rem;">${vo.i_cname}</b>
                            	</td>    
	                            <td>${vo.i_startday}</td>
	                            <td>${vo.i_endday}</td>
	                        </tr>
	                    </c:forEach>
                   	</table>
                   </c:if>
			</div>
			
			<div class="pastCourseIndex">
				<c:if test="${empty pci}">
                       <tr>
                           <td class="noIndex">수강 신청한 내역이 없습니다.</td>
                       </tr>
                   </c:if>
                   <c:if test="${!empty pci }">
                   	 <table>
						 <tr style="font-weight: bolder; font-size: 1.25rem; "> 
								<td style="width: 12%;">결제일</td>
								<td style="width: 12%;">주문번호</td>
								<td style="width: 28%;">강좌명</td>
								<td style="width: 12%;">가격</td>
								<td style="width: 12%;">강좌개강일</td>
								<td style="width: 12%;">강좌종강일</td>
								<td style="width: 12%;">비고</td>
						</tr>
	                    <c:forEach var="vo" items="${pci}">
		                   	<c:if test="${vo.pay_cancel eq 0}">
	                        <tr style="font-size: 1rem;">
		                    	<td>${vo.pay_date }</td> 
	                            <td>${vo.detail_no}<input type="button" onclick="location.href='/tobe/user/userPayCompleteDetail.do?detail_no=${vo.detail_no}'" value="주문상세보기"/></td>    
	                            <td class="url" onclick="location.href='/tobe/user/userCourseDetail.do?course_no=${vo.course_no}'">
	                            	<b>${vo.i_cname}</b>
                            	</td> 
	                            <td>${vo.i_price}</td>
	                            <td>${vo.i_startday}</td>
	                            <td>${vo.i_endday}</td>
	                            <td><form action="/tobe/user/reviewWrite.do" method="get">
	                            	<input type="hidden" name="infoCourse_no" value="${vo.course_no }">
	                            	<input type="hidden" name="infoDetail_no" value="${vo.detail_no }">
	                            	<input type="hidden" name="infoCourseName" value="${vo.i_cname }">
	                            	
									<%
									    // 현재 시간을 가져오기
									    Date currentDate = new Date();
									    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
									    String currentTime = sdf.format(currentDate);
									    pageContext.setAttribute("currentTime", currentTime);
									%>
									
									<c:if test="${vo.review_cnt gt 0 }">
										<input type="button" value="나의 후기" onclick="location.href='/tobe/user/reviewDetail.do?review_no=${vo.review_no}'" >
									</c:if>
									<c:if test="${currentTime gt vo.i_endday and vo.review_cnt eq 0}">
										<input type="submit" value="후기작성">
									</c:if>
								</form></td>
							</tr>
                     			</c:if>
                          	</c:forEach>
                        </table>
                        <br><br>
                          	
                        <table>
						 <tr style="font-weight: bolder; font-size: 1.25rem; "> 
								<td style="width: 12%;">결제취소일</td>
								<td style="width: 12%;">주문번호</td>
								<td style="width: 28%;">강좌명</td>
								<td style="width: 12%;">가격</td>
								<td style="width: 12%;">강좌개강일</td>
								<td style="width: 12%;">강좌종강일</td>
								<td style="width: 12%;">비고</td>
						</tr>  	
	                    <c:forEach var="vo" items="${pci}">
		                   	<c:if test="${vo.pay_cancel eq 1}">
		                        <tr style="font-size: 1rem;">
			                    	<td>${vo.pay_cancel_date }</td> 
		                            <td>${vo.detail_no}<input type="button" onclick="location.href='/tobe/user/userPayCancelDetail.do?detail_no=${vo.detail_no}'" value="취소상세보기"/></td>    
		                            <td class="url" onclick="location.href='/tobe/user/userCourseDetail.do?course_no=${vo.course_no}'"><b>${vo.i_cname}</b></td> 
		                            <td>${vo.i_price}</td>
		                            <td>${vo.i_startday}</td>
		                            <td>${vo.i_endday}</td>
			                        <c:set var="pay_refund" value="${CodeToString.payRefundToString(pcdi.pay_refund)}" />
									<td>${pay_refund }</td>
								</tr>
							</c:if>
                          	</c:forEach>                           	
                    </table>
                   </c:if>
			</div>

			<div class="askIndex" style="overflow-y:scroll; height: 30rem;">
				<c:if test="${empty mcai && empty ai}">
                       <tr>
                           <td class="noIndex">문의한 내역이 없습니다.</td>
                       </tr>
                   </c:if>
                   <c:if test="${!empty mcai || !empty ai}">
                    <table>
						<tr style="font-weight: bolder; font-size: 1.25rem; ">
							<td>문의번호</td>
							<td>제목</td>
							<td>작성일</td>
						</tr>
	                    <c:forEach var="vo" items="${mcai}">
	                        <tr>
	                            <td>${vo.cqna_no}</td>
	                            <td class="url" onclick="location.href='/tobe/user/userCourseAskDetail.do?cqna_no=${vo.cqna_no}'" >${vo.cq_title}</td>    
	                            <td>${vo.cq_writedate}</td>
	                            <td><input type="button" onclick="location.href='/tobe/user/userCourseModAskForm.do?cqna_no=${vo.cqna_no}'" value="수정하기"/></td>    		                            
	                        </tr>
	                    </c:forEach>
	                    <tr></tr>
	                    <c:forEach var="vo" items="${ai}">
	                        <tr>
	                            <td>${vo.qna_no}</td>
	                            <td class="url" onclick="location.href='/tobe/user/userModAskForm.do?qna_no=${vo.qna_no}'">${vo.q_title}</td>    
	                            <td>${vo.q_writedate}</td>
	                            <td><input type="button" onclick="location.href='/tobe/user/userModAskForm.do?qna_no=${vo.qna_no}'" value="수정하기"/></td>    		                            
	                        </tr>
                        </c:forEach>
                    </table>
                   </c:if>
			</div>

			<div class="myReviewIndex">
				<c:if test="${empty mri}">
                       <tr>
                           <td class="noIndex">작성한 후기 내역이 없습니다.</td>
                       </tr>
                   </c:if>
                   <c:if test="${!empty mri }">
                    <table>
						<tr style="font-weight: bolder; font-size: 1.25rem; ">
							<td>후기번호</td>
							<td>강좌명</td>
							<td>제목</td>
							<td>작성일</td>
						</tr>
	                    <c:forEach var="vo" items="${mri}">
	                        <tr>
	                            <td>${vo.review_no}</td>
	                            <td><a class="url" href="/tobe/user/userCourseDetail.do?course_no=${vo.course_no}">${vo.cname}</a></td>
	                            <td><a class="url" href="/tobe/user/reviewDetail.do?review_no=${vo.review_no}">${vo.r_title}</a></td> 
	                            <td>${vo.r_writedate}</td>  
	                        </tr>
	                    </c:forEach>
                    </table>
                   </c:if>
			</div>
		</div>
	</div>
	<div class="footerBox">
		<%@include file="/WEB-INF/views/user/common/userFooter.jsp"%>
	</div>
</div>
</body>
</html>