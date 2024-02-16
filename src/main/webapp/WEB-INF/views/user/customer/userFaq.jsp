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
		
	<div class="main">
      <div class="sub">
        <div class="size">
          <h3 class="sub_title">FAQ</h3>
    
          <div class="bbs">
            <table class="list">
            <p><span><strong>총 ${map.count }개</strong>  |  ${qnaVO.page }/${map.totalPage }페이지</span></p>
              <caption>질문 목록</caption>
              <colgroup>
                <col width="80px" />
                <col width="100px" />
                <col width="*" />
              </colgroup>
              
              <thead>
                <tr>
                  <th>번호</th>
                  <th>질문</th>
                </tr>
              </thead>
              <tbody>
              
                <c:forEach var="vo" items="${map.list }">
                <tr style='cursor:pointer;' onclick="showTr('tr0');">
                	<td>${vo.faq_no }</td>
					<td class="t">${vo.f_title }</td>
				</tr>
                <tr>
                	<td colspan="2"></td>
					<td class="content" style="display: none;">${vo.f_content }</td>
				</tr>
				</c:forEach>
              </tbody>
            </table>
          
            <div class="pagenate clear">
				<ul class='paging'>
					<c:if test="${map.prev }">
						<li><a href="faq.do?page=${map.startPage-1 }"></a></li>
					</c:if>
					<c:forEach var="p" begin="${map.startPage}" end="${map.endPage}">
						<c:if test="${p == FaqVO.page}">
							<li><a href='#;' class='current'>${p}</a></li>
						</c:if>
						<c:if test="${p != FaqVO.page}">
							<li><a href='faq.do?page=${p}'>${p}</a></li>
						</c:if>
					</c:forEach>
					<c:if test="${map.next }">
						<li><a href="faq.do?page=${map.endPage+1 }"></a></li>
					</c:if>
				</ul>
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