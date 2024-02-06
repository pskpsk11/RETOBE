<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
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
}

.context td {
	text-align: center;
	border-bottom: 1px solid black;
	cursor: pointer;
}

.dSelect {
	font-size: 1.1rem;
	margin: 0 1rem 1rem;
}

.page {
	text-align: center;
	margin: 20px auto 0;
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
#click3{
    background-color: #F1F8E0;
}
.content{
background-color: #F1F8E0;
}
td.t{
font-weight: bolder;
}
td.content{
text-align:center;
}
</style>
<script>
	$(function() {
		$(".t").click(function() {
			var idx = $(this).index(".t");

			// 현재 클릭한 토글 외의 다른 토글 닫기
			//$(".content").not(":eq("+idx+")").slideUp(300);
			$(".content").slideUp(300);
			// 클릭한 토글 열기 또는 닫기
			$(".content").eq(idx).slideToggle(300);
		});
	});
</script>


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
							<a href="/tobe/user/customer/userCustomer.do"><img src="/tobe/img/chiefAdmin_notice.png"></a>
						</td>
						<td id="click2">
							<p>1:1 문의사항</p>
							<a href="/tobe/user/customer/userQna.do"><img src="/tobe/img/chiefAdmin_qna.png"></a>
						</td>
						<td id="click3">
							<p>FAQ</p>
							<a href="/tobe/user/customer/userFaq.do"><img src="/tobe/img/chiefAdmin_faq.png"></a>
						</td>
					</tr>
				</table>
			</div>

			<!-- <h3 class="sub_title" style="border-bottom:1px solid; width: 200px;">공지사항</h3> -->


			<!--
			<div class="container">
				<div class="search-window">
					<form action="">
						<div class="search-wrap">
							<!-- <label for="search" class="blind" style="font-weight: bold;">FAQ</label> 
							
							<select>
								<option value="제목">제목</option>
								<option value="제목">작성일</option>
							</select> <input id="search" type="search" name=""
								placeholder="검색어를 입력하세요." value="">
							<button type="submit" class="btn"
								style="background-color: #ECEDE8; color: #44546A; border-width: 1px; border-radius: 7px; padding: 3x 10px;">검색</button>
						</div>
					</form>
				</div>
			</div>
			-->
			<div class="container">
				<div class="search-wrap">
					<span class="dSelect"><strong>FAQ</strong></span>
				</div>
			</div>
			<div class="board_head">
				<table class="list">
					<tbody class="context">
						<c:forEach var="vo" items="${map.list }">
							<tr>
								<td class="t">${vo.f_title }</td>
							</tr>
							<tr>
								<td class="content" style="display: none;">${vo.f_content }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

			<div class="pagenate clear">
				<ul class='paging'>
					<c:if test="${map.prev }">
						<li><a href="index.do?page=${map.startPage-1 }&searchType=${QnaVO.searchType}&searchWord=${QnaVO.searchWord}"></a></li>
					</c:if>
					<c:forEach var="p" begin="${map.startPage}" end="${map.endPage}">
						<c:if test="${p == FaqVO.page}">
							<li><a href='#;' class='current'>${p}</a></li>
						</c:if>
						<c:if test="${p != FaqVO.page}">
							<li><a href='userFaq.do?page=${p}&searchType=${FaqVO.searchType}&searchWord=${FaqVO.searchWord}'>${p}</a></li>
						</c:if>
					</c:forEach>
					<c:if test="${map.next }">
						<li><a href="userFaq.do?page=${map.endPage+1 }&searchType=${FaqVO.searchType}&searchWord=${FaqVO.searchWord}"></a></li>
					</c:if>
				</ul>
			</div>
			
			
		</div>
		<div class="footerBox">
			<%@include file="/WEB-INF/views/user/common/userFooter.jsp"%>
		</div>
	</div>
</body>
</html>