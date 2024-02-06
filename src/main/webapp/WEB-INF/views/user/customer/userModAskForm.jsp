<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head> 
    <meta charset="utf-8">
    <title></title>
    <META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no"> 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
    <script src="/tobe/smarteditor/js/HuskyEZCreator.js"></script>
    <link rel="stylesheet" href="/tobe/css/user_Header_Footer.css" />
    <link rel="stylesheet" href="/tobe/css/bbs.css"/>
    <script>
    var oEditors = [];
    $(function() {
        nhn.husky.EZCreator.createInIFrame({
            oAppRef: oEditors,
            elPlaceHolder: "q_content",
            sSkinURI: "/tobe/smarteditor/SmartEditor2Skin.html",    
            htParams : {
                bUseToolbar : true,                // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
                bUseVerticalResizer : true,        // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
                bUseModeChanger : true,            // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
                fOnBeforeUnload : function(){
                }
            }, //boolean
            fOnAppLoad : function(){
                //예제 코드
                //oEditors.getById["contents"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
            },
            fCreator: "createSEditor2"
        });
    })
    function goSave() {
    	oEditors.getById['q_content'].exec('UPDATE_CONTENTS_FIELD',[]);
    	$("#frm").submit();
    }
    
    function updateInputValue(selectstar) {
    	var ratingVal =$(selectstar).val();
        document.getElementById('q_rating').value = ratingVal;
    }
</script>
<style>
.main {
	width: 75rem;
	height: 50rem;
}
.size{
	
}
	
</style>
</head> 
<body>
    <div class="wrap">
    	<div class="headerBox">
       		<%@ include file="/WEB-INF/views/user/common/userHeader.jsp" %>
       	</div>
       	<div class="main">
	        <div class="sub">
    	        <div class="size">
        	        <h3 class="sub_title">문의 수정</h3>
                	<div class="bbs">
	                	<form method="post" name="frm" id="frm" action="/tobe/user/customer/qna/update.do" enctype="multipart/form-data" >
	                	 	<input type="hidden" name="qna_no" value="${vo.qna_no}">
	                    	<table class="board_write">
		                        <tbody>
		                        <tr>
		                        	<th>제목</th>
		                            <td>
		                                <input type="text" name="q_title" id="q_title" style="width:100%;"value="${vo.q_title}"/>
		                            </td>
		                        </tr>
		                        <tr>
		                        	<th>작성자</th>
		                            <td>
		                                ${loginInfo.name }
		                            </td>
		                        </tr>
		                                    
		                        <tr>
		                        	<th>문의 내용</th>
		                            <td>
		                                <textarea name="q_content" id="q_content" style="width:100%;">${vo.q_content }</textarea>
		                            </td>
		                        </tr>
		                        </tbody>
	                		</table>
	                		<div class="btnSet"  style="text-align:right;">
	                        	<a class="btn" href="javascript:goSave();">저장</a>
	                        	<a href="javascript:;" class="btn" onclick="history.back();">취소</a></div>
	                       	</div>
	                    </form>
                </div>
            </div>
        </div>
        <div class="footerBox">
		<%@include file="/WEB-INF/views/user/common/userFooter.jsp"%>
		</div>
    </div>
  </div>
</body> 
</html>