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
		
		<div class="main">
      <div class="sub">
        <div class="size">
          <h3 class="sub_title">1:1문의</h3>
  
          <div class="bbs">
            <table class="list">
              <p>
                <span><strong>총 100개</strong> | 1/10페이지</span>
              </p>
              <caption>
                게시판 목록
              </caption>
              <colgroup>
                <col width="80px" />
                <col width="*" />
                <col width="100px" />
                <col width="100px" />
                <col width="100px" />
              </colgroup>
              <thead>
                <tr>
                  <th>번호</th>
                  <th>제목</th>
                  <th>조회수</th>
                  <th>작성자</th>
                  <th>작성일</th>
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
                   <td><a href="qnaDetail.do?qna_no=${vo.qna_no }">${vo.q_title }</a></td>
                   <td>조회수</td>
                  <td class="writer">${vo.member_no }</td>
                   <td class="date"><fmt:formatDate value="${vo.q_writedate }" pattern="YYYY-MM-dd" /></td>
                </tr>
              </c:forEach>
              </tbody>
            </table>
            <div class="btnSet" style="text-align: right">
              <a class="btn" href="userAskForm.do">글작성 </a>
            </div>
            <div class="pagenate clear">
              <ul class="paging">
                <li><a href="javascript:;" class="current">1</a></li>
                <li><a href="javascript:;">2</a></li>
                <li><a href="javascript:;">3</a></li>
              </ul>
            </div>
  
            <!-- 페이지처리 -->
            <div class="bbsSearch">
              <form method="get" name="searchForm" id="searchForm" action="">
                <span class="srchSelect">
                  <select
                    id="stype"
                    name="stype"
                    class="dSelect"
                    title="검색분류 선택"
                  >
                    <option value="all">전체</option>
                    <option value="title">제목</option>
                    <option value="contents">내용</option>
                  </select>
                </span>
                <span class="searchWord">
                  <input
                    type="text"
                    id="sval"
                    name="sval"
                    value=""
                    title="검색어 입력"
                  />
                  <input type="button" id="" value="검색" title="검색" />
                </span>
              </form>
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