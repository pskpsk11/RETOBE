<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head> 
    <meta charset="utf-8">
    <title>수강후기</title>
    <link rel="stylesheet" href="/tobe/css/user_Header_Footer.css" />
    <META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no"> 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
    <!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" /> -->
<script>
</script>
</head> 
<style>

.bbsSearch {width: 75rem; height: 4rem; padding: 0 0 0 45rem;}
.bbs {width: 75rem; height: 48rem;}
.dSelect {width:5rem; height: 2rem; color:#666; font-size: 1rem; text-align:center;}
#sval {width: 20rem; height: 2rem;}
#reviewSeachMain {
	width: 3rem;
	height: 2rem;
	padding: 0;
	border: 1px solid #808080;
	background-color: #E4E6D9;
	cursor: pointer;
	border-radius: 5px;
}
caption {display:none;}

.list{border-collapse:collapse; border-spacing:0; box-sizing:border-box; width: 100%;}  /* tr에 shadow_down 클래스 사용하는 경우 border-collapse:separate; 으로 변경*/
.bbs .list thead{border-bottom:2px solid #221f1f;}
.bbs .list thead th{font-size:1.5rem; height:2rem; line-height:14px; color:#333;}
.bbs .list td{text-align:center; padding:8px 10px; border-bottom:1px solid #d9d9d9; font-size: 1.15rem;}
.bbs .list tbody tr:hover{background:#f6f6f6;}
.bbs .list .title span{font-size:15px; font-weight:bold;}
/** tr에 shadow_down 클래스 사용하는 경우 -  테두리 박스에 그림자처리 **/
.bbs .list tr.shadow_down th{height:35px;  background:#fff; box-shadow:0 2px 3px rgba(0, 0, 0, 0.08); -webkit-box-shadow:0 2px 3px rgba(0, 0, 0, 0.08); -moz-box-shadow:0 2px 3px rgba(0, 0, 0, 0.08); border-top:1px solid #d4d4d4; border-bottom:1px solid #d4d4d4; border-left:none; border-right:none; font-size:12px;}
.bbs .list tr.shadow_down th:first-child{border-left:1px solid #d4d4d4; box-shadow:0;}
.bbs .list tr.shadow_down th:last-child{border-right:1px solid #d4d4d4; box-shadow:0;}
/** tr에 bgColor 클래스 사용하는 경우 -  배경칼라처리 **/
.bbs .list thead.bgColor{border-top:none; border-bottom:none;}
.bbs .list thead.bgColor th{padding:10px 20px; font-size:13px; height:20px; line-height:14px; color:#fff; background:#404143;}

.pagenate {width:100%; clear:both;}
.pagenate {text-align:center; margin:20px auto 0;}
.pagenate li {display:inline-block;}
.pagenate li:first-child { margin-left:0px; }
.pagenate li a{display:inline-block; text-decoration:none; padding:0; width:30px; height:30px; line-height:30px; border:1px solid #c7c8cc; box-sizing:border-box; margin-left:-1px; vertical-align:middle;}
.pagenate li a:hover{background:#f6f6f6; font-weight:bold; text-decoration:none !important;}
.pagenate li a.board { text-indent:-9999em; margin-left:4px; }
.pagenate li a.board.first {background:#f3f3f3 url('/img/ico_first.png') no-repeat center center;}
.pagenate li a.board.prev {margin-right:30px; background:#efefef url('/img/ico_prev.png') no-repeat center center;}
.pagenate li a.board.next {margin-left:30px; background:#efefef url('/img/ico_next.png') no-repeat center center;}
.pagenate li a.board.last {background:#f3f3f3 url('/img/ico_last.png') no-repeat center center;}
.pagenate li a.current {color:#fff; background-color:#221f1f; font-weight:bold;  border:1px solid #221f1f;}
</style>
<body>
   <div class="wrap">
		<div class="headerBox">
			<%@include file="/WEB-INF/views/user/common/userHeader.jsp"%>
		</div>
        <!-- 페이지처리 -->
        <div class="bbsSearch">
            <form method="get" name="searchForm" id="searchForm" action="index.do">
                <span class="srchSelect">
                    <select id="stype" name="searchType" class="dSelect" title="검색분류 선택">
                        <option value="all">전체</option>
                        <option value="title" <c:if test="${replyVO.searchType == 'title'}">selected</c:if>>제목</option>
                        <option value="content" <c:if test="${replyVO.searchType == 'content'}">selected</c:if>>내용</option>
                    </select>
                </span>
                <span class="searchWord">
                    <input type="text" id="sval" name="searchWord" value="${replyVO.searchWord}"  title="검색어 입력">
                </span>
                <span class = "btnSearch">
                    <input type="submit" name="reviewSearch" id="reviewSeachMain" value="검색">
                </span> 
            </form>
        </div>
		<div class="bbs">
		    <table class="list">
		        <caption>게시판 목록</caption>
				<thead>
				    <tr>
				        <th style="width: 20%;">강좌명</th>
				        <th style="width: 40%;">제목</th>
				        <th style="width: 20%;">작성자</th>
				        <th style="width: 20%;">작성일</th>
				    </tr>
				</thead>
				<tbody>
	    			<c:if test="${empty ReviewList}">
						<tr>
						    <td class="first" colspan="8">등록된 글이 없습니다.</td>
						</tr>
					</c:if>
					<c:forEach var="review" items="${ReviewList}">       
						<tr>
						    <td>${review.cname}</td>
							<td>
		    					<a href="/tobe/user/review/userReviewDetail.do?review_no=${review.review_no}" class="SelectBtn" style="text-decoration: none; color: #000;">${review.r_title}</a>
							</td>
							<td>${review.id}</td>
							<td>${review.r_writedate}</td>
						</tr>
					</c:forEach>
	    		</tbody>
			</table>
			<div class="pagenate clear">
   				<ul class='paging'>
			    	<c:if test="${map.prev }">
						<li><a href="index.do?page=${map.startPage-1 }&searchType=${ReviewVO.searchType}&searchWord=${ReviewVO.searchWord}"></a></li>
					</c:if>
					<c:forEach var="p" begin="${map.startPage}" end="${map.endPage}">
						<c:if test="${p == ReviewVO.page}">
							<li><a href='#;' class='current'>${p}</a></li>
						</c:if>
						<c:if test="${p != ReviewVO.page}">
							<li><a href='index.do?page=${p}&searchType=${ReviewVO.searchType}&searchWord=${ReviewVO.searchWord}'>${p}</a></li>
						</c:if>
					</c:forEach>
					<c:if test="${map.next }">
						<li><a href="index.do?page=${map.endPage+1 }&searchType=${ReviewVO.searchType}&searchWord=${ReviewVO.searchWord}"> >> </a></li>
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