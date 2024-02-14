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
    
    
    
})
	
</script>


<style>

.container{
	position: relative;
	margin: -845px 0 0 160px;
	width : 1340px ;
	height : 840px;
	 
}
.email_sub{
	margin-left : 20px; 
	margin-right : 20px; 
	width : 1300px ;
	height : 850px;
	display: flex;
	flex-direction: column;  
}
.list{
	width : 100%  ;

	align-items: center;
}
.bbs{
	font-size: 12px;
	
}
.title_con{
	margin-top: 10px;
	margin-bottom: 23px;
	display : flex;
	justify-content: space-between;
	align-items: center;
}
</style>

</head>
<body>
	<%@include file="/WEB-INF/views/chiefAdmin/common/chiefSideBar_logo.jsp" %>
	<div class="container">
          <div class="email_sub">
       		<div class="title_con">
               <h3 class="sub_title" style="font-size: 25px;">보낸 메일함</h3>
               <p><span><strong>총 ${map.count }개</strong>  |  ${emailVO.page }/${map.totalPage }페이지</span></p>
        	</div>
              <div class="bbs">
                  <table class="list" >
                  
                      <colgroup>
                          <col width="10%" />
                          <col width="50%" />
                          <col width="20%" />
                          <col width="20%" />
                      </colgroup>
                      <thead>
                          <tr>
                              <th>번호</th>
                              <th>제목</th>
                              <th>받는이 </th>
                              <th>보낸 날짜</th>
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
                              <td>${vo.email_no }</td>
                              <td class ="tog">${vo.e_title }</td>

                              <td class="writer">
                                  ${vo.member_name }
                              </td>
                              <td class="date"><fmt:formatDate value="${vo.e_senddate }" pattern="YYYY-MM-dd"/></td>
                           
                          </tr>
                          <tr>
                          	<td class="content" style="display:none;  " colspan="5">
                           		<p>${vo.e_content }</p>
                           </tr>

                          <tr>
                          	 	
                          </tr>
                     </c:forEach>
                      </tbody>
                  </table> 
                  <table>
                  	
                  </table>
           	
                   <div class="pagenate clear ">
                   	
                      <ul class='paging'>
                      <c:if test="${map.prev }">
                      	<li><a href="/tobe/gmanager/emailBox.do?page=${map.startPage-1 }"> << </a></li>
                      </c:if>
                      <c:forEach var="p" begin="${map.startPage}" end="${map.endPage}">
                      	<c:if test="${p == emailVO.page}">
                          <li><a href='#;' class='current'>${p}</a></li>
                          </c:if>
                          <c:if test="${p != emailVO.page}">
                          <li><a href='/tobe/gmanager/emailBox.do?page=${p}'>${p}</a></li>
                          </c:if>
                      </c:forEach>
                      <c:if test="${map.next }">
                      	<li><a href="/tobe/gmanager/emailBox.do?page=${map.endPage+1 }"> >> </a></li>
                      </c:if>
                      </ul> 
                     
                  </div> 
               
                
                         
               </div>
           </div>
        </div>

</body>
</html>