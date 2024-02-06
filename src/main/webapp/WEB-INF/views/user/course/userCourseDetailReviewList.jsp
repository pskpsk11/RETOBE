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
<link rel="stylesheet" href="/tobe/css/user_Header_Footer.css" />
    
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
	.list{
		margin: 0 auto;
	}
</style>
  <div class="board_head">
      <table class="list">
          <thead>
              <tr>
                  <th>번호</th>
                  <th>제목</th>
                  <th>작성일</th>
              </tr>
          </thead>
          
          <!-- <tbody>
          	<tr>
	        <td>${Cqna.cq_title}</td>
	        <td><c:out value="${Cqna.cq_writedate}" /></td>
	    	</tr>
          </tbody>  -->
          <tbody>
          	<c:if test="${empty reviewList }">
                 <tr>
                     <td class="first" colspan="8">등록된 글이 없습니다.</td>
                 </tr>
			</c:if>
			<c:forEach var="vo" items="${reviewList }">       
                  <tr>
                      <td>${vo.review_no }</td>
                      <td><a href ="/tobe/user/review/userReviewDetail.do?review_no=${vo.review_no}">${vo.r_title }</a></td>                     
                      <td class="date"><fmt:formatDate value="${vo.r_writedate }" pattern="YYYY-MM-dd"/></td>
                  </tr>
             </c:forEach>
          </tbody>
      </table>
      <div class="btnSet"  style="text-align:center;">

			<!-- <div class="pagenate clear">
			    <ul class='paging'>
			        <c:if test="${currentPage > 1}">
					    <li><a href="userCourseDetailReviewList.do?page=${currentPage - 1}&course_no=${course_no}"> << </a></li>
					</c:if>
					<c:forEach var="p" begin="1" end="${totalPage}">
					    <c:choose>
					        <c:when test="${p == currentPage}">
					            <li><a href='#;' class='current'>${p}</a></li>
					        </c:when>
					        <c:otherwise>
					            <li><a href='userCourseDetailReviewList.do?page=${p}&course_no=${course_no}'>${p}</a></li>
					        </c:otherwise>
					    </c:choose>
					</c:forEach>
					<c:if test="${currentPage < totalPage}">
					    <li><a href="userCourseDetailReviewList.do?page=${currentPage + 1}&course_no=${course_no}"> >> </a></li>
					</c:if>
			    </ul>
			</div> -->
			
			<div class="pagenate clear">
			    <ul class='paging'>
			        <c:if test="${currentPage > 1}">
					    <li><a href="userCourseDetailReviewList.do?page=${currentPage - 1}&course_no=${param.course_no}"> << </a></li>
					</c:if>
					<c:forEach var="p" begin="1" end="${totalPage}">
					    <c:choose>
					        <c:when test="${p == currentPage}">
					            <li><a href='#;' class='current'>${p}</a></li>
					        </c:when>
					        <c:otherwise>
					            <li><a href='javascript:ajaxFuncReview(${p})'>${p}</a></li>
					        </c:otherwise>
					    </c:choose>
					</c:forEach>
					<c:if test="${currentPage < totalPage}">
					    <li><a href="userCourseDetailReviewList.do?page=${currentPage + 1}&course_no=${param.course_no}"> >> </a></li>
					</c:if>
			    </ul>
			</div>
   	</div>
</div>
