<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

<title>공지사항</title>
</head>
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
	margin: 50px 0 0 -30px;
}
#f:hover{
	 color: #E5D1E3;
    font-weight: bolder;
    cursor:pointer; 
    
}
#fi{
	color:#E5D1E3;
}
#fi:hover{
	cursor:pointer; 
}

#f, #fi, #ff {
	font-size:30px;
}
		/* list */
		.bbs {height:20px;}
		.bbs .list{border-collapse:collapse; border-spacing:0; box-sizing:border-box;}  /* tr에 shadow_down 클래스 사용하는 경우 border-collapse:separate; 으로 변경*/
		.bbs .list thead{border-bottom:2px solid #221f1f;}
		.bbs .list thead th{padding:15px 20px; font-size:13px; height:20px; line-height:14px; color:#333;}
		.bbs .list td{text-align:center; padding:8px 10px; border-bottom:1px solid #d9d9d9;}
		.bbs .list tbody tr:hover{background:#f6f6f6;} /*마우스오버 배경칼라지정*/
		.bbs .list .Faq{background:#f9f9f9; } /*탑공지  배경칼라지정*/
		.bbs .list span.comment{color:#999; font-size:12px !important; font-weight:normal !important;} /*댓글수*/
		.bbs .list .Faq_ico{display:none;}
		.bbs .list .image img{width:80px; height:auto;}
		.bbs .list .title span{font-size:15px; font-weight:bold;}
		/** tr에 shadow_down 클래스 사용하는 경우 -  테두리 박스에 그림자처리 **/
		.bbs .list tr.shadow_down th{height:35px;  background:#fff; box-shadow:0 2px 3px rgba(0, 0, 0, 0.08); -webkit-box-shadow:0 2px 3px rgba(0, 0, 0, 0.08); -moz-box-shadow:0 2px 3px rgba(0, 0, 0, 0.08); border-top:1px solid #d4d4d4; border-bottom:1px solid #d4d4d4; border-left:none; border-right:none; font-size:12px;}
		.bbs .list tr.shadow_down th:first-child{border-left:1px solid #d4d4d4; box-shadow:0;}
		.bbs .list tr.shadow_down th:last-child{border-right:1px solid #d4d4d4; box-shadow:0;}
		/** tr에 bgColor 클래스 사용하는 경우 -  배경칼라처리 **/
		.bbs .list thead.bgColor{border-top:none; border-bottom:none;}
		.bbs .list thead.bgColor th{padding:10px 20px; font-size:13px; height:20px; line-height:14px; color:#fff; background:#404143;}
		
		/* 페이징처리 */
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

		
	.size { /*리스트*/
			margin: 100px 0 0 100px;
			width : 1200px;
		    position: relative;
		}	
		table {/*리스트선*/
			 width:100%; 
			 border-collapse: collapse;
			}
		a, a:link, a:visited, a:hover, a:active { /*작은 글씨들 색*/
			 color:inherit; 
			 text-decoration: none;
			}	

		/*input*/
		input[type="text"]  {border:1px solid #d1d1d1; height:32px; /*padding:0 10px; */vertical-align:middle;}
		select {border:1px solid #d1d1d1; height:24px; padding:3px 3px 3px 4px; vertical-align:middle; line-height:24px;}
		input[type="file"] {vertical-align:middle; height:22px; width:80%; margin-right:6px;}
		
		a[href^=tel]{color:inherit;text-decoration:none;}
		
		legend, caption{display:none;}	
.search-wrap {
	width: 30rem;
	height: 2rem;
	margin: 100px 0px -50px 500px;;
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
		background-color: #E5D1E3;
		cursor: pointer;
		border-radius: 5px;
		font-size: 13px;
}	
</style>
<body>
<%@include file="/WEB-INF/views/chiefAdmin/common/chiefSideBar_logo.jsp" %>
<div class="container">
<div id="top">
	<div id="topb">
		<div id="f">
		<br>
			<b style="text-align:center;" onclick="location.href='/tobe/gmanager/customer.do';">공지사항&nbsp</b><br>
		</div>
		<div id="ff">
		<br>
			<b style="text-align:center;"> | </b><br>
		</div>
		<div id="fi">
		<br>
			<b style="text-align:center;" onclick="location.href='/tobe/gmanager/qnaList.do';">&nbsp 1:1문의 &nbsp</b><br>
		</div>
		<div id="ff">
		<br>
			<b style="text-align:center;"> | </b><br>
		</div>
		<div id="f">
		<br>
			<b style="text-align:center;" onclick="location.href='/tobe/gmanager/faqList.do';">&nbsp FAQ</b><br>
		</div>
	</div>
</div>
	<div class="main">
      <div class="sub">
         <div class="size">
            <div class="bbs" width="50px;">
                <table class="list">
                    <caption>게시판 목록</caption>
                    <colgroup>
                        <col width="15%" />
                        <col width="40%" />
                        <col width="15%" />
                        <col width="15%" />
                    </colgroup>
                    <thead>
                        <tr>
                            <th>번호</th>
                            <th>제목</th>
                            <th>작성일</th>
                            <th>답변여부</th>
                        </tr>
                    </thead>
                    <tbody>
					<c:if test="${empty map.list }">
                        <tr>
                        	<td colspan="10">등록된 글이 없습니다.</td>
                        </tr>
					</c:if>
                    <c:forEach var="qna" items="${map.list}">       
						    <tr>
						        <td>${qna.qna_no}</td>
						        <td class ="tog">${qna.q_title }</td>
						        <td colspan="8">
						            <fmt:formatDate value="${qna.q_writedate}" pattern="yyyy-MM-dd" />
						        </td>
						        <td> 
							        <c:if test="${empty qna.q_reply}"> 미답변</c:if>
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
		                           	 	<form action="/tobe/gmanager/reply.do" method="post" >
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
                
            <div class="pagenate clear">
                    		<ul class='paging'>
			                    <c:if test="${map.prev }">
			                    	<li><a href="qnaList.do?page=${map.startPage-1 }&searchType=${QnaVO.searchType}&searchWord=${QnaVO.searchWord}"> << </a></li>
			                    </c:if>
			                    <c:forEach var="p" begin="${map.startPage}" end="${map.endPage}">
			                    	<c:if test="${p == QnaVO.page}">
			                        <li><a href='#;' class='current'>${p}</a></li>
			                        </c:if>
			                        <c:if test="${p != QnaVO.page}">
			                        <li><a href='qnaList.do?page=${p}&searchType=${QnaVO.searchType}&searchWord=${QnaVO.searchWord}'>${p}</a></li>
			                        </c:if>
			                    </c:forEach>
                    			<c:if test="${map.next }">
                    				<li><a href="qnaList.do?page=${map.endPage+1 }&searchType=${QnaVO.searchType}&searchWord=${QnaVO.searchWord}"> >> </a></li>
                    			</c:if>
                    		</ul> 
                		</div>
  
            <!-- 페이지처리 -->
            <div class="bbsSearch">
              <form method="get" name="searchForm" id="searchForm" action="qnaList.do">
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
                    placeholder="검색어를 입력하세요."
                  />
                  <input type="button" id="" value="검색" title="검색" />
                </span>
              </form>
            </div>
          </div>
        </div>
      </div>
	</div>
 </div>       	
</body>
</html>