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
<link rel="stylesheet" href="/tobe/css/bbs.css"/>
<style>

.top {
	width: 75rem;
	height: 52rem;
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
	background-color: #fa0318f0;
	color:  #fff;
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
	background: #fa0318f0;
	
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
#click1{
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
          <h3 class="sub_title">공지사항</h3>
  
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
                  <th style="color:white">번호</th>
                  <th style="color:white">제목</th>
                  <th style="color:white">조회수</th>
                  <th style="color:white">작성자</th>
                  <th style="color:white">작성일</th>
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
                   <td>${vo.notice_no }</td>
                   <td><a href="noticeDetail.do?notice_no=${vo.notice_no }">${vo.n_title }</a></td>
                   <td>${vo.n_viewcnt }</td>
                  <td class="writer">관리자</td>
                   <td class="date"><fmt:formatDate value="${vo.n_writedate }" pattern="YYYY-MM-dd" /></td>
                </tr>
              </c:forEach>
              </tbody>
            </table>

            <div class="pagenate clear">
              <ul class="paging">
				<c:if test="${map.prev }">
					<li><a href="notice.do?page=${map.startPage-1 }&searchType=${NoitceVO.searchType}&searchWord=${NoticeVO.searchWord}"></a></li>
				</c:if>
				<c:forEach var="p" begin="${map.startPage}" end="${map.endPage}">
					<c:if test="${p == NoticeVO.page}">
						<li><a href='#;' class='current'>${p}</a></li>
					</c:if>
					<c:if test="${p != NoticeVO.page}">
						<li><a href='notice.do?page=${p}&searchType=${NoticeVO.searchType}&searchWord=${NoticeVO.searchWord}'>${p}</a></li>
					</c:if>
				</c:forEach>
				<c:if test="${map.next }">
					<li><a href="notice.do?page=${map.endPage+1 }&searchType=${NoticeVO.searchType}&searchWord=${NoticeVO.searchWord}"></a></li>
				</c:if>
              </ul>
            </div>
  
            <!-- 페이지처리 -->
            <div class="bbsSearch">
              <form method="get" name="searchForm" id="searchForm" action="notice.do">
                <span class="srchSelect">
                  <select
                    id="stype"
                    name="searchType"
                    class="dSelect"
                    title="검색분류 선택"
                  >
                    <option value="all">전체</option>
                    <option value="n_title"<c:if test="${noticeVO.searchType == 'title'}">selected</c:if>>제목</option>
                    <option value="n_content"<c:if test="${noticeVO.searchType == 'content'}">selected</c:if>>내용</option>
                  </select>
                </span>
                <span class="searchWord">
                  <input
                    type="text"
                    id="sval"
                    name="searchWord"
                    value="${noticeVO.searchWord}"
                    placeholder="검색어를 입력하세요."
                  />
                  <button type="submit" class="dSelect" id="searchBtn">검색</button>
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