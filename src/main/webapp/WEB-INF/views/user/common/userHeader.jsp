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
<link rel="stylesheet" href="/tobe/css/reset.css" />
<link rel="stylesheet" href="/tobe/css/common.css" />
<link rel="stylesheet" href="/tobe/css/main.css" />
<link rel="stylesheet" href="/tobe/css/contents.css" />
<link rel="stylesheet" href="/tobe/css/swiper.css" />
<link
     href="https://fonts.googleapis.com/css?family=Sintony:400,700"
     rel="stylesheet"
/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script> -->
<script src="/tobe/js/function.js" type="text/javascript"></script>
<script src="/tobe/js/function_jquery.js" type="text/javascript"></script>
<style>
	/* 커스텀 시작 */
	.side-bar > ul ul {
	  display: none;
	}
	
	/* 사이드바 시작 */
	
	/* 사이드바의 너비와 높이를 변수를 통해 통제 */
	:root {
	  --side-bar-width: 270px;
	  --side-bar-height: auto;
	}
	
	.side-bar {
	  position: fixed;    /* 스크롤을 따라오도록 지정 */
	  background-color: #ff5050;
	  width: var(--side-bar-width);
	  min-height: var(--side-bar-height);   /* 사이드바의 높이를 전체 화면 높이의 90%로 지정 */
	  margin-top: calc((100vh - var(--side-bar-height)) / 2);    /* 사이드바 위와 아래의 마진을 동일하게 지정 */
	  right: 0;
	  transform: translate(calc(var(--side-bar-width) * 0.2), 0); /*변경된 위치 조정*/
	  z-index:999999;
	}
	
	/* 아이콘 시작 */
	.side-bar__icon-box {
	  display: flex;
	  justify-content: flex-start;
	}
	
	.side-bar__icon-1 {
	  position: relative;
	  width: 23px;
	  height: 17px;
	  margin: 15px;
	  margin-top: 20px;
	  transition: .5s;
	}
	
	:root {
	  --side-bar__icon: .5s;
	}
	
	.side-bar__icon-1 > div {
	  position: absolute;
	  width: 100%;
	  height: 20%;
	  background-color: white;
	  transition: all var(--side-bar__icon);
	}
	
	.side-bar__icon-1 > div:nth-of-type(1) {
	  top: 0;
	  width: auto;
	  left: 0;
	  right: 0;
	  transition: all var(--side-bar__icon), left calc(var(--side-bar__icon) / 2) calc(var(--side-bar__icon) / 2), right calc(var(--side-bar__icon) / 2) calc(var(--side-bar__icon) / 2), height calc(var(--side-bar__icon) / 2) 0s;
	}
	
	.side-bar__icon-1 > div:nth-of-type(2) {
	  top: 40%;
	  transform-origin:bottom left;
	}
	
	.side-bar__icon-1 > div:nth-of-type(3) {
	  top: 80%;
	  left: auto;
	  right: 0;
	  transform-origin:bottom right;
	}
	
	
	.side-bar:hover .side-bar__icon-1 {
	  transform: translate(198px, 0);
	}
	
	.side-bar:hover .side-bar__icon-1 > div:nth-of-type(2) {
	  transform:rotate(45deg);
	  width: 70.5%;
	  height: 25%;
	}
	
	.side-bar:hover .side-bar__icon-1 > div:nth-of-type(3) {
	  top: 40%;
	  transform:rotate(-45deg);
	  width: 70.5%;
	  height: 25%;
	}
	
	.side-bar:hover .side-bar__icon-1 > div:nth-of-type(1) {
	  left: 41%;
	  right: 41%;
	  height: 100%;
	  transition: all var(--side-bar__icon), left calc(var(--side-bar__icon) / 2) 0s, right calc(var(--side-bar__icon) / 2) 0s, height calc(var(--side-bar__icon) / 2) calc(var(--side-bar__icon) / 2);
	}
	/* 아이콘 끝 */
	
	/* 모든 메뉴의 a에 속성값 부여 */
	.side-bar ul > li > a {
	  display: block;
	  color: white;
	  font-size: 1.4rem;
	  font-weight: bold;
	  padding-top: 20px;
	  padding-bottom: 20px;
	  padding-left: 50px;
	  transition: .5s;
	}
	
	/* 자식의 position이 absolute일 때 자식을 영역 안에 가두어 준다 */
	.side-bar > ul > li {
	  position: relative;
	}
	
	/* 모든 메뉴가 마우스 인식 시 반응 */
	.side-bar ul > li:hover > a {
	  background-color: #fa0318f0;
	  border-bottom: 1px solid #fa0318f0;
	}
	
	/* 1차 메뉴의 항목이 마우스 인식 시에 2차 메뉴 등장 */
	.side-bar > ul > li:hover > ul {
	  display: block;
	  position: absolute;
	  background-color: #888;
	  top: 0;         /* 2차 메뉴의 상단을 1차 메뉴의 상단에 고정 */
	  left: 100%;     /* 2차 메뉴를 1차 메뉴의 너비만큼 이동 */
	  width: 100%;    /* 1차 메뉴의 너비를 상속 */
	}
	
	/* 사이드바 너비의 80%만큼 왼쪽으로 이동 */
	.side-bar {
	  border-radius: 20px;
	  transform: translate(calc(var(--side-bar-width) * 0.84), 0);
	  transition: .5s;
	}
	
	/* 마우스 인식 시 원래의 위치로 이동 */
	.side-bar:hover {
	  transform: translate(20px, 0);   /* 둥근 모서리의 너비만큼 숨겨주기 */
	}
	/* 사이드바 끝 */
	
	/* 커스텀 끝 */
	
	.bottom_area a{
	cursor:pointer;
	}
	
	
</style>
</head>
<body>

   <script type="text/javascript" src="/tobe/js/swiper.min.js"></script>
   <script>
      $(function() {
         $(".depth1 > li").mouseover(function() {
            $(this).find(".depth2").stop().slideDown(300);
         });
         $(".depth1 > li").mouseleave(function() {
            $(this).find(".depth2").stop().slideUp(300);
         });
         $("#login_click").click(function() {
            $(".login_info").toggle();
            useremail_chk();
         });
         $(".login_info > .top_area > img").click(function() {
            $(".login_info").hide();
         });
      });
      
      function loginCheck() {
         if($("#loginEmail").val().length < 1) {
            alert("아이디를 입력해주세요.");
            $("#loginEmail").focus();
            return false;
         }
         var f = document.loginFrm;
         if(f.reg.checked){
            document.cookie=
               "cookie_usermail=" +
               $("#loginEmail").val() +
               ";path=/;expires=Sat, 31 Dec 2050 23:59:59 GMT;";
          } else{
             var now = new Date();
             document.cookie="cookie_useremail=null;path=/;expires="+now;
          }
         return true;
      }
      
      function useremail_chk(){
         var f = document.loginFrm;
         var useremail = CookieVal("cookie_useremail");
         
         if(useremail=="null"){
            f.loginEmail.focus();
            f.loginEmail.value="";
         } else{
            f.loginPw.focus();
            f.loginEmail.value=useremail;
            f.reg.checked=true;
            $("#loginPw").focus();
         }
      }
      
      function CookieVal(cookieName) {
         thisCookie=document.cookie.split("; ");
         for(var i = 0; i < thisCookie.length; i++){
            if(cookieName==thisCookie[i].split("=")[0]){
               return thisCookie[i].split("=")[1];
            }
         }
         return "null";
         
      }
      
      function openPopup(url, name, width, height) {
    	    // 팝업 창의 가로, 세로 크기를 가져옴
    	    var popupWidth = width || 450;
    	    var popupHeight = height || 380;

    	    // 팝업 창이 화면 중앙에 위치하도록 계산
    	    var left = (screen.width - popupWidth) / 2;
    	    var top = (screen.height - popupHeight) / 2;
    	    
    	    top -= 50; // 조정할 수 있는 값

    	    // 팝업 창을 가운데에 띄우기
    	    window.open(url, name, 'width=' + popupWidth + ',height=' + popupHeight + ',left=' + left + ',top=' + top + ',resizable=yes');
    	}
   </script>
      <div id = "header">
         <div class = "head_top">
            <div class = "size">
               <div class = "header_call">
                  <div class = "txt">
                     <a href = ""></a>
                  </div>
               </div>
               <h1 class = "logo">
                  <a href = "/tobe/user/main.do"><img src = "/tobe/img/logo.png"/></a>
               </h1>
               <div class = "util clear">
	               <c:if test ="${empty loginInfo }"> 
	                  <a href = "#;" id = "login_click">로그인</a>
	                  <a href = "/tobe/user/joinPolicy.do">회원가입</a>
	               </c:if>
                  <c:if test ="${!empty loginInfo }">
	                  <a href="/tobe/user/logout.do">로그아웃</a>
	                  <a href="/tobe/user/mypage.do">마이페이지</a>
                  </c:if>
               </div>
               
               
               <form 
                 action = "/tobe/user/login.do"
                 id = "loginFrm"
                 name = "loginFrm"
                 method = "post"
                 onsubmit="return loginCheck();"
               >
               <div class = "login_info">
                  <div class = "top_area"><img src = "/tobe/img/btn_del.gif"/></div>
                  <div class = "title_area"><span>TOBE 로그인</span></div>
                  <div class = "middle_area">
                     <div class="input_area">
                        <input 
                           type = "text"
                           id="loginId"
                           name="id"
                           value=""
                           placeholder="아이디"
                        />
                        <input
                           type = "password"
                           id="loginPw"
                           name="pwd"
                           value=""
                           placeholder="비밀번호"
                        />
                     </div>
                     <div class = "login_btn">
                        <input type = "submit" value = "로그인"/>
                     </div>
                  </div>
                  <div class = "bottom_area">
					<a onclick="openPopup('find.do', '아이디/비밀번호 찾기', 450, 380)">아이디 찾기 / 비밀번호 찾기</a>
                  </div>
               </div>
               </form>
            </div>
         </div>
         <div class="head_bot">
            <div class="size">
               <div class="gnb">
                  <ul class="depth1 clear">
                     <li>
                        <a href="/tobe/user/course.do">수강신청</a>
                     </li>
                     <li>
                        <a href="#;">일정</a>
                        <ul class="depth2">
                           <li><a href="/tobe/user/schedule.do">시험일정</a></li>
                           <li><a href="#;">개강일정</a></li>
                        </ul>
                     </li>
                     <li>
                        <a href = "#;">수강후기</a>
                        <ul class="depth2">
                           <li><a href = "/tobe/user/reviewIndex.do">수강후기</a></li>
                        </ul>
                     </li>
                     <li>
                        <a href = "#;">고객센터</a>
                        <ul class="depth2">
                           <li><a href="/tobe/user/notice.do">공지사항</a></li>
                           <li><a href="/tobe/user/qna.do">1:1문의</a></li>
                           <li><a href="/tobe/user/faq.do">FAQ</a></li>
                        </ul>
                     </li>
                  </ul>
               </div>
            </div>
         </div>      
      </div>
      
</body>
</html>