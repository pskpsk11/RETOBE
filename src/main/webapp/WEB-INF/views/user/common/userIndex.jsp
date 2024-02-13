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
<script src="/tobe/js/script.js"></script>
<script src="/tobe/js/main.js"></script>
<!-- <script src="/tobe/js/function.js" type="text/javascript"></script> -->
<!-- <script src="/tobe/js/function_jquery.js" type="text/javascript"></script> -->
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
</script>
</head>
<body>

<div class="wrap">
   <div class="headerBox">
      <%@include file="/WEB-INF/views/user/common/userHeader.jsp"%>
   </div>
   
   <div class="main">
      <div class="visual animate">
         <div class="swiper swiper-visual">
            <div class="swiper-wrapper">
                 <img class="swiper-slide" style="background-image:url('/tobe/img/ybm.png');">
                 <img class="swiper-slide" style="background-image:url('/tobe/img/ha.png');">
                 <img class="swiper-slide" style="background-image:url('/tobe/img/pa.png');">
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
             
   <%@include file="/WEB-INF/views/user/common/userFooter.jsp"%>
</div>

</body>
</html>