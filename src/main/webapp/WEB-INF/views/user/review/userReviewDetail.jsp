<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강후기</title>
<link rel="stylesheet" href="/tobe/css/reset.css" />
<link rel="stylesheet" href="/tobe/css/common.css" />
<link rel="stylesheet" href="/tobe/css/main.css" />
<link rel="stylesheet" href="/tobe/css/contents.css" />
<link rel="stylesheet" href="/tobe/css/swiper.css" />
<META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
</head>
<body>
   	<div class="wrap">
		<div class="headerBox">
			<%@include file="/WEB-INF/views/user/common/userHeader.jsp"%>
		</div>
   		<div class="main">
	      <div class="sub">
	        <div class="size">
	            <h3 class="sub_title">수강후기</h3>
	            <div class="bbs">
	                <div class="view">
	                    <div class="title">
	                        <dl>
	                            <dt>${review.r_title}</dt>
	                            <dd class="date"><c:out value="${review.r_writedate}" /></dd>
	                        </dl>
	                    </div>
	                    <div class="cont"><p>${review.r_content}</p> </div>
	                    <dl class="file">
	                        <dt>첨부파일 </dt>
	                        <dd>
	                        <a href="#" 
	                        target="_blank">첨부파일.pptx [38.07KB] </a></dd>
	                    </dl>
	                                
	                    <div class="btnSet clear">
	                        <div class="fl_l"><a href="index.html" class="btn">목록으로</a></div>
	                    </div>
	            
	                </div>
	                <div>
	                  <form method="post" name="frm" id="frm" action="" enctype="multipart/form-data" >
	                      <table class="board_write">
	                          <colgroup>
	                              <col width="*" />
	                              <col width="100px" />
	                          </colgroup>
	                          <tbody>
	                          <tr>
	                              <td>
	                                  <textarea name="contents" id="contents" style="height:50px;"></textarea>
	                              </td>
	                              <td>
	                                  <div class="btnSet"  style="text-align:right;">
	                                      <a class="btn" href="javascript:goSave();">저장 </a>
	                                  </div>
	                              </td>
	                          </tr>
	                          </tbody>
	                      </table>
	                      </form>
	
	                      <p><span><strong>총 2개</strong>  |  1/1페이지</span></p>
	                  <table class="list">
	                      <colgroup>
	                          <col width="80px" />
	                          <col width="*" />
	                          <col width="100px" />
	                          <col width="100px" />
	                      </colgroup>
	                      <tbody>
	
	                          <tr>
	                              <td class="first" colspan="8">등록된 글이 없습니다.</td>
	                          </tr>
	
	                                  
	                          <tr>
	                              <td>10</td>
	                              <td class="txt_l">
	                                  <a href="board_view.html">게시글 제목</a>
	                              </td>
	                              <td class="writer">
	                                  홍길동
	                              </td>
	                              <td class="date">2021-01-01</td>
	                          </tr>
	                      </tbody>
	                  </table>
	                  </div>
		            </div>
		        </div>
		    </div>
			

		<div class="footerBox">
			<%@include file="/WEB-INF/views/user/common/userFooter.jsp"%>
		</div>
	</div>
</body>
</html>