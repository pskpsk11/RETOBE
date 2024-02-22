<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<META name="viewport"content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
</head>

<body>
	<div class="wrap">
	<%@include file="/WEB-INF/views/user/common/userSidebar.jsp"%>
		<div class="headerBox">
			<%@include file="/WEB-INF/views/user/common/userHeader.jsp"%>
		</div>
	<div class="main">
      <div class="sub">
        <div class="size">
          <h3 class="sub_title">문의</h3>
          
          <div class="bbs">
            <table class="list">
			<p><span><strong>총 ${map.count }개</strong>  |  ${qnaVO.page }/${map.totalPage }페이지</span></p>
			
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
                   <td>${vo.q_viewcnt }</td>
                   <td class="writer">${vo.member_name }</td>
                   <td class="date"><fmt:formatDate value="${vo.q_writedate }" pattern="YYYY-MM-dd" /></td>
                </tr>
              </c:forEach>
              </tbody>
            </table>
            <div class="btnSet" style="text-align: right">
              <a class="btn" href="userAskForm.do">글작성 </a>
            </div>
            
            <!-- 페이징 -->
            <div class="pagenate clear">
              <ul class="paging">
				<c:if test="${map.prev }">
					<li><a href="qna.do?page=${map.startPage-1 }&searchType=${QnaVO.searchType}&searchWord=${QnaVO.searchWord}"></a></li>
				</c:if>
				<c:forEach var="p" begin="${map.startPage}" end="${map.endPage}">
					<c:if test="${p == QnaVO.page}">
						<li><a href='#;' class='current'>${p}</a></li>
					</c:if>
					<c:if test="${p != QnaVO.page}">
						<li><a href='qna.do?page=${p}&searchType=${QnaVO.searchType}&searchWord=${QnaVO.searchWord}'>${p}</a></li>
					</c:if>
				</c:forEach>
				<c:if test="${map.next }">
					<li><a href="qna.do?page=${map.endPage+1 }&searchType=${QnaVO.searchType}&searchWord=${QnaVO.searchWord}"></a></li>
				</c:if>
              </ul>
            </div>
  
            
            <div class="bbsSearch">
              <form method="get" name="searchForm" id="searchForm" action="qna.do">
                <span class="srchSelect">
                  <select
                    id="stype"
                    name="searchType"
                    class="dSelect"
                    title="검색분류 선택"
                  >
                    <option value="all">전체</option>
                    <option value="q_title"<c:if test="${qnaVO.searchType == 'title'}">selected</c:if>>제목</option>
                    <option value="q_content"<c:if test="${qnaVO.searchType == 'content'}">selected</c:if>>내용</option>
                  </select>
                </span>
                <span class="searchWord">
                  <input
                    type="text"
                    id="sval"
                    name="searchWord"
                    value="${qnaVO.searchWord}"
                    title="검색어 입력"
                    placeholder="검색어를 입력하세요."
                  />
                  <input type="button" id="" value="검색" title="검색"/>
                </span>
              </form>
            </div>
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