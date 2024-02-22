<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" >
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>TOBE</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
<META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no"> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>   
<script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
<script src="../js/script.js"></script>
<script src="../js/main.js"></script>
<!-- <script src="/tobe/js/function.js" type="text/javascript"></script> -->
<!-- <script src="/tobe/js/function_jquery.js" type="text/javascript"></script> -->
<style>
 .quickMenu {
        position: fixed;
        top: 950px; /* 초기 위치 */
        left:2000px; /* 초기 위치 */
        transition: top 0.9s ease; /* 부드러운 이동을 위한 transition 효과 */
    }

</style>
<script>
   $(function(){
       // swiper
       var swiper = new Swiper('.swiper-visual',{
          loop:true,
           autoplay : {
               delay:3000
           },
           navigation: {
              nextEl: ".swiper-button-next",
              prevEl: ".swiper-button-prev",
           },
           pagination: {
              el:".swiper-pagination",
           },
       });
   });
  
   window.addEventListener('scroll', function() {
       var quickMenu = document.querySelector('.quickMenu');
      // if (window.scrollY > 0) { // 스크롤이 100px 이상 내려갔을 때
      //   quickMenu.style.top = '0'; // 퀵 메뉴를 화면 상단으로 이동
      // } else {
      //    quickMenu.style.top = '50px'; // 퀵 메뉴를 초기 위치로 이동
      // }
   });
   
   //챗봇
   //$(document).ready(function() {
	    // 이미지를 클릭했을 때
	    //$('.quickMenu img').click(function(e) {
	        //e.preventDefault(); // 기본 링크 동작 방지

	        // AJAX 요청을 통해 챗봇 내용을 가져오고, 가져온 내용을 챗봇 컨테이너에 추가
	        //$.ajax({
	            //url: '/path/to/your/chatbot', // 여기에는 실제 챗봇 데이터를 제공하는 URL을 입력하세요.
	            //type: 'GET',
	            //success: function(response) {
	                //$('#chatbotContainer').html(response); // 챗봇 내용을 챗봇 컨테이너에 추가
	                //$('#chatbotContainer').slideDown(); // 챗봇 컨테이너를 보여줍니다.
	            //},
	            //error: function(xhr, status, error) {
	                //console.error('AJAX Error:', error);
	            //}
	        //});
	    //});
	//});
</script>
</head>
<body>

<div class="wrap">
<%@include file="/WEB-INF/views/user/common/userSidebar.jsp"%>
<%@include file="/WEB-INF/views/user/common/userChatBot.jsp"%>
   <div class="headerBox">
      <%@include file="/WEB-INF/views/user/common/userHeader.jsp"%>
   </div>
   
   <div class="main">
      <div class="visual animate">
         <div class="swiper swiper-visual">
            <div class="swiper-wrapper">
                 <img class="swiper-slide" style="background-image:url('/tobe/img/ybm.png');">
                 <img class="swiper-slide" style="background-image:url('/tobe/img/ha.png');">
                 <img class="swiper-slide" style="background-image:url('/tobe/img/papa.png');">
             </div>
             
             <div class="swiper-pagination"></div>
              <div class="swiper-button-prev"></div>
              <div class="swiper-button-next"></div>
         </div>
      </div>

      <div class="course">
        <div class="review">
          <div class="tit"><h4>리뷰 많은 강좌</h4></div>
          <div class="list">
            <a href="">
              <img src="/tobe/img/hackers1.png" />
              <div class="subject">아침 정규반</div>
            </a>
          </div>
          <div class="list">
            <a href="">
              <img src="/tobe/img/hackers2.png" />
              <div class="subject">아침 정규반</div>
            </a>
          </div>
          <div class="list">
            <a href="">
              <img src="/tobe/img/hackers1.png" />
              <div class="subject">아침 정규반</div>
            </a>
          </div>
        </div>
        <div class="review">
          <div class="tit"><h4>베스트 강좌</h4></div>
          <div class="list">
            <a href="">
              <img src="/tobe/img/hackers2.png" />
              <div class="subject">아침 정규반</div>
            </a>
          </div>
          <div class="list">
            <a href="">
              <img src="/tobe/img/hackers1.png" />
              <div class="subject">아침 정규반</div>
            </a>
          </div>
          <div class="list">
            <a href="">
              <img src="/tobe/img/hackers2.png" />
              <div class="subject">아침 정규반</div>
            </a>
          </div>
        </div>
      </div>
      <div class="live">
        <div class="tit"><h4>리얼 생생 후기</h4></div>
      </div>
    </div>
    <div class="main">
      <div class="bbs">
        <div class="course">
          <ul>
            <li>
              <a href="javascript:;">
                <dl>
                  <dd class="subject">아침 정규반A</dd>
                  <dd class="title">후기 제목</dd>
                  <dd class="contents">
                    너무너무 좋은 강의입니다 감사합니다...
                  </dd>
                </dl>
              </a>
            </li>
            <li>
              <a href="javascript:;">
                <dl>
                  <dd class="subject">아침 정규반A</dd>
                  <dd class="title">후기 제목</dd>
                  <dd class="contents">
                    너무너무 좋은 강의입니다 감사합니다...
                  </dd>
                </dl>
              </a>
            </li>
            <li>
              <a href="javascript:;">
                <dl>
                  <dd class="subject">아침 정규반A</dd>
                  <dd class="title">후기 제목</dd>
                  <dd class="contents">
                    너무너무 좋은 강의입니다 감사합니다...
                  </dd>
                </dl>
              </a>
            </li>
          </ul>
        </div>
      </div>
    </div>
    <!--  
    <div class="quickMenu">
		<div><a href=""><img src="/tobe/img/chat.png" class="quick" style="width: 55px; margin-left: 5px;"></a></div>
	</div>  
	<div id="chatbotContainer" style="display: none;">
    	<!-- 챗봇 내용을 담을 컨테이너 -->
    
    
      	
<div>   
   <%@include file="/WEB-INF/views/user/common/userFooter.jsp"%>
</div>

</body>
</html>