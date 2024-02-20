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
    <link rel="stylesheet" href="/tobe/css/reset.css" />
    <link rel="stylesheet" href="/tobe/css/common.css" />
    <link rel="stylesheet" href="/tobe/css/main.css" />
    <link rel="stylesheet" href="/tobe/css/contents.css" />
    <link rel="stylesheet" href="/tobe/css/swiper.css" />
<script>
</script>
</head> 

<body>
   <div class="wrap">
      <div class="headerBox">
         <%@include file="/WEB-INF/views/user/common/userHeader.jsp"%>
      </div>
      
        <div class="main">
         <div class="sub">
           <div class="size">
             <h3 class="sub_title">수강후기</h3>
     
             <div class="bbs">
               <table class="list">
				<p><span><strong>총 ${map.count }개</strong>  |  ${reviewVO.page }/${map.totalPage }페이지</span></p>
                 <caption>
                   게시판 목록
                 </caption>
                 <colgroup>
                   <col width="80px" />
                   <col width="*" />
                   <col width="100px" />
                   <col width="100px" />
                 </colgroup>
                 <thead>
                   <tr>
                     <th>번호</th>
                     <th>제목</th>
                     <th>작성자</th>
                     <th>작성일</th>
                   </tr>
                 </thead>
                 <tbody>
                   <c:if test="${empty map.list}">
                     <tr>
                         <td class="first" colspan="8">등록된 글이 없습니다.</td>
                     </tr>
                   </c:if>
                   <c:forEach var="review" items="${map.list}">       
                      <tr>
                         <td>${review.review_no}</td>
                         <td>
                            <a href="/tobe/user/reviewDetail.do?review_no=${review.review_no}" class="SelectBtn" style="text-decoration: none; color: #000;">${review.r_title}</a>
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
                   		<li><a href="reviewIndex.do?page=${map.startPage-1 }&searchType=${ReviewVO.searchType}&searchWord=${ReviewVO.searchWord}"></a></li>
				   </c:if>
	                   <c:forEach var="p" begin="${map.startPage}" end="${map.endPage}">
							<c:if test="${p == ReviewVO.page}">
								<li><a href='#;' class='current'>${p}</a></li>
							</c:if>
							<c:if test="${p != ReviewVO.page}">
								<li><a href='reviewIndex.do?page=${p}&searchType=${ReviewVO.searchType}&searchWord=${ReviewVO.searchWord}'>${p}</a></li>
							</c:if>
						</c:forEach>
					<c:if test="${map.next }">
						<li><a href="ReviewIndex.do?page=${map.endPage+1 }&searchType=${ReviewVO.searchType}&searchWord=${ReviewVO.searchWord}"></a></li>
					</c:if>
                   </ul> 
             </div>
     
               <!-- 페이지처리 -->
               <div class="bbsSearch">
                 <form method="get" name="searchForm" id="searchForm" action="reviewIndex.do">
                   <span class="srchSelect">
                     <select
                       id="stype"
                       name="stype"
                       class="dSelect"
                       title="검색분류 선택"
                     >
                       <option value="all">전체</option>
                       <option value="r_title" <c:if test="${replyVO.searchType == 'title'}">selected</c:if>>제목</option>
                         <option value="r_content" <c:if test="${replyVO.searchType == 'content'}">selected</c:if>>내용</option>
                     </select>
                   </span>
                   <span class="searchWord">
                     <input
                       type="text"
                       id="sval"
                       name="sval"
                       value="${replyVO.searchWord}"
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