<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="kr.co.retobe.util.CodeToString"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
 <link rel="stylesheet" href="/tobe/css/bbs.css"/>
<title>1:1문의</title>
<script>
$(function(){
	//console.log(${map});
    $(".tog").click(function(){
    	console.log("dddd");
        var idx = $(this).index(".tog");
	     //$(".tog").
        // 현재 클릭한 토글 외의 다른 토글 닫기
        $(".content").not(":eq("+idx+")").slideUp(0);
        //$(".content").slideUp(300);
        // 클릭한 토글 열기 또는 닫기
        $(".content").eq(idx).slideToggle(300);
        
    });
    
$('.viewEdit').click(function () {
	console.log("aaa");
    // 현재 클릭된 viewEdit 버튼이 속한 부모 tr에서 edit 클래스를 가진 요소를 찾아 보이게 하고,
    // viewData 클래스를 가진 부분을 숨깁니다.
    $(this).closest('tr').find('.edit').show();
    $(this).closest('tr').find('.viewData').hide();
});

$('.viewRe').click(function () {
    // 현재 클릭된 viewRe 버튼이 속한 부모 tr에서 viewData 클래스를 가진 요소를 찾아 보이게 하고,
    // edit 클래스를 가진 부분을 숨깁니다.
    $(this).closest('tr').find('.viewData').show();
    $(this).closest('tr').find('.edit').hide();
});

})
</script>
<style>
.container{
   position: relative;
   margin: -845px 0 0 160px;
   width : 1340px ;
   height : 850px;
} 

#top{
	position: relative;
	margin: -580px 0 0 570px; 
}
#topb{
	display: flex;
	margin: 50px 0 -50px -160px;
}
#f{
	border: solid 0.5px;
	width:170px; 
	height:140px;
}

#f> img{
	margin: 10px 0 0 0;
}
#f:hover{
	 color: #49654E;
    font-weight: bolder;
    cursor:pointer; 
    background-color: #F1F8E0;
}
#fi{
	border: solid 0.5px;
	width:170px; 
	height:140px;
	background-color:#F1F8E0;
}

#fi> img{
	margin: 10px 0 0 0;
}
.search-wrap {
	width: 30rem;
	height: 2rem;
	margin: 60px 0 -180px 450px;;
}

.dSelect {
	font-size: 1.1rem;
	float: left;
}

#searchBtn {
		margin-left: 10px;
		border: 1px solid #808080;
		text-align: center;
		width: 50px;
		height: 23px;
		background-color: #E4E6D9;
		cursor: pointer;
		border-radius: 5px;
		font-size: 13px;
}

.list{
	width : 100% ;
	align-items: center;
}

</style>
</head>
<body>
<%@include file="/WEB-INF/views/chiefAdmin/common/chiefSideBar_logo.jsp" %>
<div class="container">
<div id="top">
	<div id="topb">
		<div id="f">
		<br>
			<b style="margin-left:55px;" onclick="location.href='/tobe/gmanager/customer.do';">공지사항</b><br>
		</div>
		<div id="fi">
		<br>
			<b style="margin-left:55px;" onclick="location.href='/tobe/gmanager/qnaList.do';">1:1문의</b><br>
		</div>
		<div id="f">
		<br>
			<b style="margin-left:65px;" onclick="location.href='/tobe/gmanager/faqList.do';">FAQ</b><br>
		</div>
	</div>
</div>
<!-- 페이지처리 -->
<div id="search">
				<div class="search-wrap">
					<span class="dSelect" style="margin: 0 1rem 1rem;"></span>
					<form method="get" name="searchForm" id="searchForm" action="qnaList.do">    
						<span class="srchSelect">
							<select class="dSelect" name="searchType" title="검색분류 선택" style="margin: 0 0.25rem;">
								<option value="all">전체</option>
								<option value="q_title">
									<c:if test="${QnaVO.searchType == 'q_title'}">selected</c:if>제목
								</option>
								<option value="n_writedate">
									<c:if test="${QnaVO.searchType == 'q_writedate'}">selected</c:if>작성일
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
        <div class="size">
            <div class="bbs" style="overflow-y:scroll; height: 35rem; position: absolute; left: 2rem; top: 12rem;">
                <table class="list">
                     <colgroup>
                           <col width="15%" />
                           <col width="40%" />
                           <col width="15%" />
                           <col width="15%" />
                       </colgroup>
                    <thead>
                    <div style="margin-bottom: 10px;"></div>
                        <tr>
                            <th>번호</th>
                            <th>제목</th>
                            <th>작성일</th>
                            <th>답변여부</th>
                        </tr>
                    </thead>
                    <tbody>
					<c:if test="${empty map.list }"></c:if>
                    <c:forEach var="qna" items="${list}">      
						    <tr>
						        <td>${qna.qna_no}</td>
						        <td><a href="qnaDetail.do?qna_no=${qna.qna_no}">${qna.q_title}</a></td>
						        
                               <td class="date"><fmt:formatDate value="${qna.q_writedate }" pattern="YYYY-MM-dd"/></td>
                               <td> <c:if test="${empty qna.q_reply}"> 미답변</c:if>
                               		<c:if test="${!empty qna.q_reply}"> 답변 완료</c:if>
                               </td>
							</tr>  
							   <tr>
                           	<td class="content" style="display:none;" colspan="6">
                           		<p>${qna.q_content }</p>
                           		<c:if test="${!empty qna.q_reply}">
                           			<div class="title">
	                           			<div class=" viewData">${qna.q_reply }<button class="viewEdit">수정</button></div>
	                         			<div class="edit" style="display:none;">
		                         			 <form action="/tobe/gmanager/edit.do" method="post" >
			                           	 		  <input type="hidden" id="qna_no" name="qna_no" value="${qna.qna_no} ">
											      <textarea name="q_reply" cols="100" rows="10">${qna.q_reply }</textarea>
											      <input type="submit" value="수정">
										    </form>
											<button class="viewRe">취소</button>
	                         			 </div>
                           			</div>	
                           		</c:if>
                           	 		
                           	 	<c:if test="${empty qna.q_reply}">
	                           	 	<form action="/tobe/chiefAdmin/customer/reply.do" method="post" >
	                           	 		  <input type="hidden" id="qna_no" name="qna_no" value="${qna.qna_no} ">
									      <textarea name="q_reply" cols="100" rows="10"></textarea>
									      <input type="submit" value="등록">
								    </form>
                           	 	</c:if>
                           	</td>
                            </tr>
						</c:forEach>
                   </tbody>
                   
                </table>
               		</div>
        		</div>
        	</div>	
</div>
</body>
</html>