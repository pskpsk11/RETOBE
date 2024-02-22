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
<link rel="stylesheet" href="/retobe/css/chatbot.css"/>
<script src="/tobe/js/script.js"></script>
<script src="/tobe/js/main.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"/>
<script src="../js/script.js"></script>
<script src="../js/main.js"></script>
<!-- <script src="/tobe/js/function.js" type="text/javascript"></script> -->
<!-- <script src="/tobe/js/function_jquery.js" type="text/javascript"></script> -->
<style>
 HEAD
      /* 전체 챗봇 컨테이너 스타일 */
      .chat-container {
        width: 300px;
        height: 400px;
        background-color: #f5f5f5;
        border-radius: 8px;
        overflow-y: auto;
        padding: 20px;
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 10);
      }

      /* 채팅 창 스타일 */
      .chat-messages {
        list-style-type: none;
        padding: 0;
        margin: 0;
      }

      /* 사용자 메시지 스타일 */
      .user-message {
        background-color: #007bff;
        color: #fff;
        padding: 8px 12px;
        border-radius: 20px;
        margin-bottom: 8px;
        max-width: 70%;
        align-self: flex-end;
      }

      /* 챗봇 메시지 스타일 */
      .bot-message {
        background-color: #28a745;
        color: #fff;
        padding: 8px 12px;
        border-radius: 20px;
        margin-bottom: 8px;
        max-width: 70%;
        align-self: flex-start;
      }

      /* 입력 필드 스타일 */
      .input-field {
        width: calc(100% - 40px);
        padding: 10px;
        border: 1px solid #ddd;
        border-radius: 25px;
        margin-top: 20px;
        margin-right: 10px;
        font-size: 16px;
      }

      /* 입력 버튼 스타일 */
      .input-button {
        background-color: #007bff;
        color: #fff;
        border: none;
        padding: 10px 20px;
        border-radius: 25px;
        cursor: pointer;
        font-size: 16px;
      }

      /* x 버튼 스타일 */
      .close-button {
        position: absolute;
        top: 10px;
        right: 10px;
        background-color: transparent;
        border: none;
        font-size: 16px;
        cursor: pointer;
      }

      /* x 버튼 호버 효과 */
      .close-button:hover {
        color: #333;
      }
      #chatIcon {
        position: absolute;
        top: 10px;
        right: 10px;
        width: 50px; /* 이미지 너비 조정 */
        cursor: pointer;
      }
    </style>
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
       var chat = document.querySelector('.chat');
   });
   
   
   // OpenAI API 키
   const apiKey = "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";
   //챗봇
   //$(document).ready(function() {
	    // 이미지를 클릭했을 때
	    //$('.quickMenu img').click(function(e) {
	        //e.preventDefault(); // 기본 링크 동작 방지

   // 요청할 텍스트
   const messages = [
     {
       role: "system",
       content:
         "너는 토익과 토플 영어강사이며, 앞으로 영어학습에 맞는 대답해줘",
     },
   ];

   // OpenAI API에 요청을 보내는 함수
   async function generateText() {
     try {
       const response = await axios.post(
         "https://api.openai.com/v1/chat/completions",
         {
           model: "gpt-3.5-turbo",
           messages: messages,
         },
         {
           headers: {
             "Content-Type": "application/json",
             Authorization: `Bearer ${apiKey}`,
           },
         }
       );

       // API 응답에서 생성된 텍스트를 추출
       const generatedText = response.data.choices[0].message;

       // 결과를 표시할 요소에 결과를 추가
       document.getElementById("text").innerHTML +=
         "<br>" + generatedText.content;
     } catch (error) {
       console.error("Error:", error);
     }
   }
   // 버튼 클릭 이벤트 핸들러
   document.getElementById("btn").addEventListener("click", function (e) {
     e.preventDefault();
     generateText(); // 검색 버튼 클릭 시에만 generateText() 호출
   });

   // 아이콘 클릭 이벤트 핸들러
   document
     .getElementById("chatIcon")
     .addEventListener("click", function () {
       // Ajax를 사용하여 챗봇 창을 가져오고, 보이도록 설정
       const xhttp = new XMLHttpRequest();
       xhttp.onreadystatechange = function () {
         if (this.readyState == 4 && this.status == 200) {
           document.getElementById("chatContainer").style.display = "block";
           document.getElementById("chatContent").innerHTML =
             this.responseText;
         }
       };
       xhttp.open("GET", "chat.html", true);
       xhttp.send();
     });

   // 챗봇 창 닫기 버튼 클릭 이벤트 핸들러
   document
     .getElementById("closeButton")
     .addEventListener("click", function () {
       document.getElementById("chatContainer").style.display = "none";
       // 아이콘 다시 보이게 하기
       document.getElementById("chatIcon").style.display = "block";
     });
   
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
<<<<<<< HEAD
    <!--<div class="chat">
		<div><a href=""><img src="/tobe/img/chat.png" class="chatbot" style="width: 55px; margin-left: 5px;"></a></div>
	</div>    -->
    
	<!-- 아이콘 -->
    <img src="/tobe/img/chat.png" alt="챗봇 아이콘" id="chatIcon" />

    <!-- 챗봇 컨테이너 -->
    <div id="chatContainer" class="chat-container" style="display: none">
      <!-- 챗봇 내용을 가져올 부분 -->
      <div id="chatContent"></div>
      <input type="text" id="msg" class="input-field" />
      <button id="btn" class="input-button">검색</button>
      <!-- 챗봇 창 닫기 버튼 -->
      <button id="closeButton">챗봇 닫기</button>
    </div>  
	
	
=======
    <!--  
    <div class="quickMenu">
		<div><a href=""><img src="/tobe/img/chat.png" class="quick" style="width: 55px; margin-left: 5px;"></a></div>
	</div>  
	<div id="chatbotContainer" style="display: none;">
    	<!-- 챗봇 내용을 담을 컨테이너 -->
    
    
      	
<div>   
>>>>>>> branch 'master' of https://github.com/pskpsk11/RETOBE.git
   <%@include file="/WEB-INF/views/user/common/userFooter.jsp"%>
</div>

</body>
</html>