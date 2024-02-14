<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
	.paging{
		list-style: none;
	}
	.paging > li{
		float:left;
		display: contents;
	}
	.list {
		margin: 0 auto;
		width: 100%;
		border-top: 1px solid black;
		text-align: center;
	}
	
	.list th {
		border-bottom: 1px solid #222222;
	}
	
	.list a {
		display: inline-block;
		vertical-align: middle;
	}
	
	.context td {
		text-align: center;
		border-bottom: 1px solid black;
	}
	
	.search-wrap {
		margin: 10px;
	}
	
	.page {
		text-align: center;
		margin: 20px auto 0;
	}
	
	.page li {
		display: inline-block;
	}
	button.btn{
		position: relative;
		left: 550px;
		top: 20px;
		cursor: pointer;
	   	color: white;
	   	border: 0;
	   	/* display: flex; */
	   	/*align-items: center;
	   	justify-content: center;
	   	/* position: inherit; */
	   	font-size: 16px;
	   	/* padding: 8px 16px; */
	   	margin: 5px 10px;
	   	height: 34px;
	   	border-radius: 20px;
	   	background-color: #8ba888;
	   	border-color: #000;
	   	/* text-align: center; */
	   	letter-spacing: -0.5px;
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
          	<c:if test="${empty cqnaList }">
                 <tr>
                     <td class="first" colspan="8">등록된 글이 없습니다.</td>
                 </tr>
			</c:if>
			<c:forEach var="vo" items="${cqnaList }">       
                  <tr>
                      <td>${vo.cqna_no }</td>
                      <td><a href='/tobe/user/course/userCourseAskDetail.do?cqna_no=${vo.cqna_no }'>${vo.cq_title }</a></td>                     
                      <td class="date"><fmt:formatDate value="${vo.cq_writedate }" pattern="YYYY-MM-dd"/></td>
                  </tr>
             </c:forEach>
          </tbody>
      </table>
      <div class="btnSet"  style="text-align:center;">
            	<c:if test="${!empty loginInfo}">
					<!-- JSP를 사용하는 경우 -->
					<button type="button" onclick="location.href='/tobe/user/course/userCourseAskForm.do?infoCourse_no=${param.course_no}'" class="btn">작성하기</button>
            	</c:if>

			<div class="pagenate clear">
			    <ul class='paging'>
			        <c:if test="${currentPage > 1}">
					    <li><a href="userCourseDetail.do?page=${currentPage - 1}&course_no=${param.course_no}"> << </a></li>
					</c:if>
					<c:forEach var="p" begin="1" end="${totalPage}">
					    <c:choose>
					        <c:when test="${p == currentPage}">
					            <li><a href='#;' class='current'>${p}</a></li>
					        </c:when>
					        <c:otherwise>
					            <li><a href='javascript:ajaxFuncQna(${p})'>${p}</a></li>
					        </c:otherwise>
					    </c:choose>
					</c:forEach>
					<c:if test="${currentPage < totalPage}">
					    <li><a href="userCourseDetail.do?page=${currentPage + 1}&course_no=${param.course_no}"> >> </a></li>
					</c:if>
			    </ul>
			</div>
			
   	</div>
</div>
