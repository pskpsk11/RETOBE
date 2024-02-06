<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<META name="viewport"
	content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
<link rel="stylesheet" href="/tobe/css/bbs.css"/>
<style>

.top {
	width: 75rem;
	height: 50rem;
}

.main {
	width: 75rem;
	height: 18rem;
	padding: 2rem 0;
	
}

.select {
	width: 48rem;
	height: 14rem;
	border: 1px solid black;
	border-collapse: collapse;
	margin: 0 auto;
}

.select tr td {
	border: 1px solid black;
	text-align: center;
	font-weight: bold;
	width: 33.3%;
	font-size: 1.25rem;
}

.select img{
	width: 5rem;
}

.search-wrap {
	width: 30rem;
	height: 2rem;
	margin: 0 0 0 4rem;
}

.dSelect {
	font-size: 1.1rem;
	float: left;
}

#searchBtn {
	background-color: #ECEDE8;
	color: #44546A;
	border-width: 1px;
	border-radius: 7px;
	margin: 0 0.25rem;
}

.board_head {
	width: 65rem;
	margin: 0 auto;
}

.list {
	width: 65rem;
	border-top: 1px solid black;
	text-align: center;
}

.list th {
	border-bottom: 1px solid black;
	background: #ECEDE8;
}

.list a {
	display: inline-block;
	vertical-align: middle;
	text-decoration: none;
	color: #000;
}

.context td {
	text-align: center;
	border-bottom: 1px solid black;
}

.page {
	text-align: center;
}

.page li {
	display: inline-block;
}
#click1:hover, #click2:hover, #click3:hover{
    color: #49654E;
    font-weight: bolder;
    cursor:pointer; 
    background-color: #F1F8E0;
}
#click2{
    background-color: #F1F8E0;
}


</style>
</head>

<body>
	<div class="wrap">
		<div class="headerBox">
			<%@include file="/WEB-INF/views/user/common/userHeader.jsp"%>
		</div>
		<div class="top">
			<div class="main">
				<table class="select">
					<tr>
						<td id="click1">
							<p>공지사항</p>
							<a href="/retobe/user/customer/userCustomer.do"><img src="/retobe/img/chiefAdmin_notice.png"></a>
						</td>
						<td id="click2">
							<p>1:1 문의사항</p>
							<a href="/retobe/user/customer/userQna.do"><img src="/retobe/img/chiefAdmin_qna.png"></a>
						</td>
						<td id="click3">
							<p>FAQ</p>
							<a href="/retobe/user/customer/userFaq.do"><img src="/retobe/img/chiefAdmin_faq.png"></a>
						</td>
					</tr>
				</table>
			</div>

			<!-- <h3 class="sub_title" style="border-bottom:1px solid; width: 200px;">공지사항</h3> -->

			<div class="container">
				<div class="search-wrap">
					<span class="dSelect" style="margin: 0 1rem 1rem;"><strong>문의사항</strong></span>
					<form method="get" name="searchForm" id="searchForm" action="userQna.do">    
						<span class="srchSelect">
							<select class="dSelect" name="searchType" title="검색분류 선택" style="margin: 0 0.25rem;">
								<option value="all">전체</option>
								<option value="n_title">
									<c:if test="${NoticeVO.searchType == 'n_title'}">selected</c:if>제목
								</option>
								<option value="n_writedate">
									<c:if test="${NoticeVO.searchType == 'n_writedate'}">selected</c:if>작성일
								</option>
							</select>
						</span>
						<span class="searchWord">
							<input class="dSelect" type="search" name="searchWord" value="${QnaVO.searchWord }" placeholder="검색어를 입력하세요.">
							<button type="submit" class="dSelect" id="searchBtn">검색</button>
						</span>
					</form>
				</div>
			</div>


			<div class="board_head">
				<table class="list">
					<thead>
						<tr>
							<th style="width: 20%;">번호</th>
							<th style="width: 50%;">제목</th>
							<th style="width: 30%;">작성일</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${empty map.list }">
							<tr>
								<td class="first" colspan="8">등록된 글이 없습니다.</td>
							</tr>
						</c:if>
						<c:forEach var="vo" items="${map.list }">
							<tr>
								<td>${vo.qna_no }</td>
								<td><a href="userQnaDetail.do?qna_no=${vo.qna_no }">${vo.q_title }</a></td>
								<td class="date"><fmt:formatDate value="${vo.q_writedate }" pattern="YYYY-MM-dd" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

				<div class="btnSet" style="text-align: right;">
					<c:if test="${!empty loginInfo}">
						<a class="btn" href="userAskForm.do">작성하기</a>
					</c:if>
					
					<div class="pagenate clear">
						<ul class='paging'>
							<c:if test="${map.prev }">
								<li><a href="index.do?page=${map.startPage-1 }&searchType=${QnaVO.searchType}&searchWord=${QnaVO.searchWord}"> << </a></li>
							</c:if>
							<c:forEach var="p" begin="${map.startPage}" end="${map.endPage}">
								<c:if test="${p == QnaVO.page}">
									<li><a href='#;' class='current'>${p}</a></li>
								</c:if>
								<c:if test="${p != QnaVO.page}">
									<li><a href='userQna.do?page=${p}&searchType=${QnaVO.searchType}&searchWord=${QnaVO.searchWord}'>${p}</a></li>
								</c:if>
							</c:forEach>
							<c:if test="${map.next }">
								<li><a href="userQna.do?page=${map.endPage+1 }&searchType=${QnaVO.searchType}&searchWord=${QnaVO.searchWord}"> >> </a></li>
							</c:if>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="footerBox">
			<%@include file="/WEB-INF/views/user/common/userFooter.jsp"%>
		</div>
	</div>
</body>
</html>