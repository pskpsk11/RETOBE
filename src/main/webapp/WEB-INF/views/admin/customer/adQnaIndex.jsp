<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>학원별 문의관리 페이지</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<link rel="stylesheet" href="/tobe/css/bbs.css"/>


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
	height : 840px;
	 
}
.qna_sub{
	margin-left : 20px; 
	margin-right : 20px; 
	width : 1300px ;
	height : 850px;
	display: flex;
	flex-direction: column;  
}
.list{
	width : 100% ;

	align-items: center;
}
.bbs{

	
}
.title_con{
	margin-bottom: 23px;
	display : flex;
	justify-content: space-between;
}
.bbs .list td.content {
	text-align: left;
	
}

.con_content {
	margin : 30px;
	font-size : 15px;
}

.viewData {
	padding-top: 25px;
	
}

.view_content{

	padding-bottom: 25px;
	border-bottom : 1px solid #dfdfdf;
}

.bnt{
     background-color: #E5D1E3;
     padding: 5px 15px;
     margin-top : 10px;
     margin-left : 1200px;
     text-align: center;
     border-radius: 15px;
     border : none;
}

.bnt_a{
     background-color: #E5D1E3;
     padding: 5px 15px;
     margin-top : 10px;
     margin-left : 1100px;
     text-align: center;
     border-radius: 15px;
     border : none;
}

.bnt_b{
	display : inline ;
     background-color: #E5D1E3;
     padding: 5px 15px;
     margin-top : 10px;
     text-align: center;
     border-radius: 15px;
     border : none;
}

textarea {
    width: 100%;
    height: 10em;
    border: none;
    resize: none;
  }
}
</style>

</head>
<body>
	<%@include file="/WEB-INF/views/admin/common/adSideBar_logo2.jsp" %>
	<div class="container">
		<div class="qna_sub">
           <div class="title_con">
               <h3 class="sub_title" style="font-size: 25px;">답변게시판</h3>
               <p><span><strong>총 ${map.count }개</strong>  |  ${cqnaVO.page }/${map.totalPage }페이지</span></p>
             </div>  
               <div class="bbs">
                   <table class="list" >
                   
                       <colgroup>
                           <col width="15%" />
                           <col width="40%" />
                           <col width="15%" />
                           <col width="15%" />
                           <col width="15%" />
                       </colgroup>
                       <thead>
                           <tr>
                               <th>번호</th>
                               <th>제목</th>
                               <th>작성자</th>
                               <th>작성일</th>
                               <th>답변여부</th>
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
                               <td>${vo.cqna_no }</td>
                               <td class ="tog">${vo.cq_title }</td>

                               <td class="writer">
                                   ${vo.member_name }
                               </td>
                               <td class="date"><fmt:formatDate value="${vo.cq_writedate }" pattern="YYYY-MM-dd"/></td>
                               <td> <c:if test="${empty vo.cq_reply}"> 미답변</c:if>
                               		<c:if test="${!empty vo.cq_reply}"> 답변 완료</c:if>
                               </td>
                           </tr>
                           <tr>
                           	<td class="content" style="display:none;" colspan="8">
                           		<div class="con_content">
	                           		<div class="view_content">
		                           		<p>${vo.cq_content }</p>
	                           		
	                           		</div>
	                           		<c:if test="${!empty vo.cq_reply}">
	                           			<div class="replytitle">
		                           			
		                           			<div class=" viewData">${vo.cq_reply }<button class="viewEdit bnt_a">수정</button></div>
		                           			
		                           			
		                         			 <div class="edit" style="display:none;">
			                         			 <form action="/tobe/admin/customer/edit.do" method="post" >
				                           	 		  <input type="hidden" id="cqna_no" name="cqna_no" value="${vo.cqna_no} ">
												      <textarea class="cq_reply" name="cq_reply" cols="500" rows="10">${vo.cq_reply }</textarea><br>
												      <input type="submit" value="수정" class="bnt_a" >
												      <button class="viewRe bnt_b">취소</button>
											    </form>
												
		                         			 </div>
	                           			</div>	
                           			                         			 
                           			</c:if>
                       			</div>
                           	 		
                           	 	<c:if test="${empty vo.cq_reply}">
	                           	 	<form action="/tobe/admin/customer/reply.do" method="post" >
	                           	 		  <input type="hidden" id="cqna_no" name="cqna_no" value="${vo.cqna_no} ">
									      <textarea name="cq_reply" cols="100" rows="10"></textarea>
									      <input type="submit" value="등록" class="bnt">
								    </form>
                           	 	</c:if>
                           	</td>
                            </tr>

                      </c:forEach>
                       </tbody>
                   </table> 
                   <table>
                   
                   </table>
            
                    <div class="pagenate clear">
                       <ul class='paging'>
                       <c:if test="${map.prev }">
                       	<li><a href="/tobe/admin/customer/adQnaIndex.do?page=${map.startPage-1 }"> << </a></li>
                       </c:if>
                       <c:forEach var="p" begin="${map.startPage}" end="${map.endPage}">
                       	<c:if test="${p == cqnaVO.page}">
                           <li><a href='#;' class='current'>${p}</a></li>
                           </c:if>
                           <c:if test="${p != cqnaVO.page}">
                           <li><a href='/tobe/admin/customer/adQnaIndex.do?page=${p}'>${p}</a></li>
                           </c:if>
                       </c:forEach>
                       <c:if test="${map.next }">
                       	<li><a href="/tobe/admin/customer/adQnaIndex.do?page=${map.endPage+1 }"> >> </a></li>
                       </c:if>
                       </ul> 
                   </div> 
               
                </div>
                         
               </div>
           </div>

</body>
</html>