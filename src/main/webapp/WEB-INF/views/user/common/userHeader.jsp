<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="kr.co.retobe.util.CodeToString"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<title>Insert title here</title>
<style>
.wrap {
	width: 85rem;
	margin: 0 auto;	
	position: relative;
}

*{
	box-sizing: border-box;
}
.headerBox {
	width: 75rem;
	height: 13rem;
}
.header { 
	width: 75rem;
	height: 12rem;
	position: absolute;
	
	top: 0;
	left: 0rem;
}

.header_memberBar {
	position: absolute;
	color: #000;
	right: 0;
	top:10%;
	font-family: Inter;
	text-align: center;
	font-size: 1rem;
	letter-spacing: 0;
}

.tobe_logo {
	position: absolute;
	top: 6rem;
	width: 15rem;	
	margin: 0 0 0 50px;
}

.menu_container{
	position: absolute;
	width: 50rem;
	right: 0;
	top: 6.5rem;
	font-size: 
}


.menu_container a:link, .menu_container a:visited {
	text-decoration: none;
	color: #49654E;
	
}

.header_memberBar a:link, .header_memberBar a:visited {
	text-decoration: none;
	color: #49654E;
}
a:hover {
	text-decoration: none;
	color: #d3d3d3;
}

.menu_container > ul > li {
    list-style: none;
    float: left;        
    height: 3rem;
    line-height: 3rem;
    width: 25%;
    text-align: center;
    color: #d3d3d3;
    font-size: 2rem;
}

.menu_container > ul > li > a:hover {
    color: #49654E;
    font-weight: bolder;
    cursor:pointer; 
}

.quickMenu {
	position: absolute;
	width: 4rem;
	top: 30rem;
	right: -5rem;
	z-index:99999;
}

.quick {
	width: 4rem;
}

#goTop {
    cursor: pointer;
}

#goBottom {
    cursor: pointer;
}

.modal{
	max-width: 900px;
	height: 900px;
	text-align: center;
	margin: 0 auto;
	background-color : #E4E6D9; 
	pont-size : 15px;
}
    
.main {
	width: 75rem;

}
</style>
<script type="text/javascript">
$(document).ready(function(){
  var currentPosition = parseInt($(".quickMenu").css("top"));
  $(window).scroll(function() {
    var position = $(window).scrollTop(); 
    $(".quickMenu").stop().animate({"top":position+currentPosition+"px"},500);
  });
  
});

function courseView() {
	$.ajax({
		type: 'GET',
		url:'/tobe/user/common/modal.do',
		data:{
			a : 1
		},
		success:function(res) {
			console.log(res);
			$('#ex1').html(res);
			
			$('#ex1').modal();
			
		}
	})
}

// $("#goTop").click(function() {
// 	$('html').animate({scrollTop:0}, 2000);
// });

//document.querySelect("#goTop").onclick = () => {
//	window.scroppTop({top:0, behavior:"smooth"});
//};
//$('#ex1').modal({
//  closeExisting: false
//});


	
</script>

</head>
<body>

<div class="header">
	<span class="header_memberBar">
		<c:if test="${empty loginInfo }">
		    <a href="/tobe/user/member/userLogin.do">로그인</a> |
		    <a href="/tobe/user/member/userJoinPolicy.do">회원가입</a>
		</c:if>
		
		<c:if test="${!empty loginInfo }">
		    <a href="/tobe/user/member/userLogout.do">로그아웃</a> |
		    <a href="/tobe/user/member/userMyPageMain.do">마이페이지</a>
		</c:if>
	</span>
	
	
	<span><a href="/tobe/user/common/userIndex.do"><img src="/tobe/img/header_tobe_logo.png" class="tobe_logo"></a></span>
	<div class="menu_container">
		<ul>
			<li><a href="/tobe/user/course/userCourseIndex.do">수강신청</a></li>
			<li><a href="/tobe/user/common/userTestSchedule.do">시험일정</a></li>
			<li><a href="/tobe/user/review/userReviewIndex.do">수강후기</a></li>
			<li><a href="/tobe/user/customer/userCustomer.do">고객센터</a></li>
		</ul>
	</div>


	<span class="quickMenu">
		<span><img src="/tobe/img/top.png" class="quick" id="goTop" style="width: 27px; height: 20px; margin-left: 17px;"></span>
		<span><a href="/tobe/user/customer/userCustomer.do"><img src="/tobe/img/customer.png" class="quick" style="width: 55px; margin-left: 5px;"></a></span>
		<span><a href="/tobe/user/common/userBasket.do"><img src="/tobe/img/basket.png" class="quick" style="width: 55px; margin-left: 5px;"></a></span>
<!-- 		<span><a href="/tobe/user/common/modal.do" id="manual-ajax" ><img src="/tobe/img/compare.png" class="quick" style="width: 50px; margin-left: 8px;"></a></span> -->
		<span>
		<img src="/tobe/img/compare.png" class="quick" style="width: 50px; margin-left: 8px;" onclick="courseView();"></span>
		<span><img src="/tobe/img/bottom.png" class="quick" id="goBottom" style="width: 28px; height: 20px; margin-left: 18px;" onclick=""></span>
	</span>

</div>
	<div id="ex1" class="modal">
		
	</div> 

</body>
</html>