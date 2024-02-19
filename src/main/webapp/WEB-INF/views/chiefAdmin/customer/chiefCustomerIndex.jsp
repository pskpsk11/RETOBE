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
		/* list */
		.bbs {height:20px;}
		.bbs .list{border-collapse:collapse; border-spacing:0; box-sizing:border-box;}  /* tr에 shadow_down 클래스 사용하는 경우 border-collapse:separate; 으로 변경*/
		.bbs .list thead{border-bottom:2px solid #221f1f;}
		.bbs .list thead th{padding:15px 20px; font-size:13px; height:20px; line-height:14px; color:#333;}
		.bbs .list td{text-align:center; padding:8px 10px; border-bottom:1px solid #d9d9d9;}
		.bbs .list tbody tr:hover{background:#f6f6f6;} /*마우스오버 배경칼라지정*/
		.bbs .list .notice{background:#f9f9f9; } /*탑공지  배경칼라지정*/
		.bbs .list span.comment{color:#999; font-size:12px !important; font-weight:normal !important;} /*댓글수*/
		.bbs .list .notice_ico{display:none;}
		.bbs .list .image img{width:80px; height:auto;}
		.bbs .list .title span{font-size:15px; font-weight:bold;}
		
		.bbs .postSection {width:100%; }
		.bbs .postSection .postList {width:100%; margin-left:-2%; margin-top:-2%; }
		.bbs .postSection .postList li {float:left; width:100%; margin-left:2%; margin-top:2%; }
		.bbs .postSection .postList li .postObj {display:block; width:100%; height:350px; box-sizing:border-box; padding:10px; border:1px solid #dadada; position:relative; overflow:hidden; transition:all .2s; -webkit-transition:all .2s; letter-spacing:-.5px;}
		.bbs .postSection .postList li .postObj .reserveNum {width:100%; font-size:16px; padding:10px 0;}
		.bbs .postSection .postList li .postObj .imgs {display:block; position:absolute; left:0; top:50; vertical-align:middle; width:220px; height:100%;  }
		.bbs .postSection .postList li .postObj .imgs img { width:195px; height:280px; margin:10px;}
		.bbs .postSection .postList li .postObj .imgs i {display:block; position:absolute; left:0; top:0px; }
		.bbs .postSection .postList li .postObj .txt {display:block; width:100%; padding-left:220px;  padding-top:10px; box-sizing:border-box;  vertical-align:top; position:relative;  padding-right:15px; padding-bottom:25px;}
		.bbs .postSection .postList li .postObj .txt .category {font-size:18px; color:#1091ff; font-weight:600; position:relative; height:30px; line-height:30px;  margin-bottom:5px;}
		.bbs .postSection .postList li .postObj .txt .category:after {clear:both; content:''; ;display:block; position:absolute; left:0; bottom:-.5px; width:25px; height:1px; background:#1091ff; }
		.bbs .postSection .postList li .postObj .txt .title {font-size:18px; color:#333; height:25px; line-height:25px; overflow:hidden; display:block; -webkit-line-clamp:1; white-space:nowrap; text-overflow:ellipsis;  word-break:keep-all; max-width:100%; margin-bottom:10px;}
		.bbs .postSection .postList li .postObj .txt .detail {width:100%; margin-right:10px;}
		.bbs .postSection .postList li .postObj .txt .detail table {border-collapse:collapse; border-spacing:0; box-sizing:border-box;}
		.bbs .postSection .postList li .postObj .txt .detail table tr {height:50px;border-top:1px solid #221f1f; border-bottom:1px solid #221f1f;}
		.bbs .postSection .postList li .postObj .txt .detail table tr th {width:100px;font-size:14px;}
		.bbs .postSection .postList li .postObj .txt .btn_area {display:block; position:absolute; height:100px; width:100%; text-align:right; top:250px; right:0px; bottom:0;}
		.bbs .postSection .postList li .postObj .wdate { box-sizing:border-box; position:absolute; bottom:0; left:32%; color:#999; font-size:15px; overflow:hidden;}
		.bbs .postSection .postList li .postObj .wdate span {display:block; float:left; line-height:20px; height:20px; position:relative; padding:0 7.5px;}
		.bbs .postSection .postList li .postObj .wdate span:first-child {padding-left:0;}
		.bbs .postSection .postList li .postObj .wdate span:before {position:absolute; width:1px; height:12px; margin-top:-6px; top:50%; left:-.5px; background:#ccc; clear:both; content:''; display:block; }
		.bbs .postSection .postList li .postObj .wdate span:first-child:before {display:none; }
		
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
		
		a[href^=tel]{color:inherit;text-decoration:none;}
		
		legend, caption{display:none;}
		
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
.btn{
	background-color: #000;
	color: #fff;
	border-radius: 5px;
	text-align: center;
	width: 60px;
	height: 27px;
	margin-left: 10px;
}	
</style>
<body>
<%@include file="/WEB-INF/views/chiefAdmin/common/chiefSideBar_logo.jsp" %>
<div class="container">
<div id="top">
	<div id="topb">
		<div id="fi">
		<br>
			<b style="margin-left:55px;">공지사항</b><br>
		</div>
		<div id="f">
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
					<form method="get" name="searchForm" id="searchForm" action="customer.do">    
						<span class="srchSelect">
							<select class="dSelect" name="searchType" title="검색분류 선택" style="margin: 0 0.25rem;">
								<option value="all">전체</option>
								<option value="n_title">
									<c:if test="${NoticeVO.searchType == 'n_title'}">selected</c:if>제목
								</option>
								<option value="n_writedate">
									<c:if test="${NoticeVO.searchType == 'n_writedate'}">selected</c:if>작성일
								</option>
							</select>
						</span>
						<span class="searchWord">
							<input class="dSelect" type="search" name="searchWord" value="${notice.searchWord }" placeholder="검색어를 입력하세요.">
							<button type="submit" class="dSelect" id="searchBtn">검색</button>
						</span>
					</form>
				</div>
			</div>
        <div class="size">
            <div class="bbs" width="50px;">
                <table class="list">
                    <caption>게시판 목록</caption>
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
                            <th style="margin-left: 50px;">작성일</th>
                        </tr>
                    </thead>
                    <tbody>
					<c:if test="${empty map.list }">
                        <tr>
                        	<td colspan="10">등록된 글이 없습니다.</td>
                        </tr>
					</c:if>
                    <c:forEach var="notice" items="${map.list}">       
						    <tr>
						        <td>${notice.notice_no}</td>
						        <td>
						            <a href="/tobe/gmanager/noticeDetail.do?noticeNo=${notice.notice_no}" class="SelectBtn">${notice.n_title}</a>
						        </td>
						        <td colspan="8">
						            <fmt:formatDate value="${notice.n_writedate}" pattern="yyyy-MM-dd" />
						        </td>
						    </tr>
						</c:forEach>
                   </tbody>
                </table>
                <div class="btnSet"  style="text-align:right;">
                    <a class="btn" href="/tobe/gmanager/noticeForm.do">글작성 </a>
           		</div>
                		<div class="pagenate clear">
                    		<ul class='paging'>
			                    <c:if test="${map.prev }">
			                    	<li><a href="customer.do?page=${map.startPage-1 }&searchType=${NoticeVO.searchType}&searchWord=${NoticeVO.searchWord}"> << </a></li>
			                    </c:if>
			                    <c:forEach var="p" begin="${map.startPage}" end="${map.endPage}">
			                    	<c:if test="${p == NoticeVO.page}">
			                        <li><a href='#;' class='current'>${p}</a></li>
			                        </c:if>
			                        <c:if test="${p != NoticeVO.page}">
			                        <li><a href='customer.do?page=${p}&searchType=${NoticeVO.searchType}&searchWord=${NoticeVO.searchWord}'>${p}</a></li>
			                        </c:if>
			                    </c:forEach>
                    			<c:if test="${map.next }">
                    				<li><a href="customer.do?page=${map.endPage+1 }&searchType=${NoticeVO.searchType}&searchWord=${NoticeVO.searchWord}"> >> </a></li>
                    			</c:if>
                    		</ul> 
                		</div>
               		</div>
        		</div>
        	</div>	
 </div>       	
</body>
</html>