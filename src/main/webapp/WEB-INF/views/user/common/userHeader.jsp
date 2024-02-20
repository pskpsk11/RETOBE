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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="/tobe/js/function.js" type="text/javascript"></script>
<script src="/tobe/js/function_jquery.js" type="text/javascript"></script>
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
	                  <a href = "/tobe/user/joinForm.do">회원가입</a>
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
                     <input type="checkbox" id="reg" name="reg"/>
                     <label for="reg">아이디 저장</label>
                     &emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;
                     <a href="#;">아이디 찾기</a>&nbsp;/&nbsp;<a href="#;">비밀번호 찾기</a>
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