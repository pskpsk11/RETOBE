<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
    <script>
    var oEditors = [];
    $(function() {
        nhn.husky.EZCreator.createInIFrame({
            oAppRef: oEditors,
            elPlaceHolder: "e_content",
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
    	oEditors.getById['e_content'].exec('UPDATE_CONTENTS_FIELD',[]);
    	$("#frm").submit();
    }

</script>
<style>
.container{
	position: relative;
	margin: -845px 0 0 160px;
	width : 1340px ;
	height : 840px;
	
	 
}
.email_sub{
	width : 1340px ;
	height : 840px;
	display: flex;
	flex-direction: column;  
	justify-content :  flex-start;
	align-items: stretch;
}


label {
	display: inline-block;
	width : 100px;
	height : 30px;
	
	font-size: 15px;
}
.title{
	width:1240px;
	border-top : 0px;
	border-left : 0px;
	border-right : 0px;
	 border-bottom : 1px solid #d3d3d3;
	
}

.email_title{
	height : 50px;
	display: flex;
	flex-direction: row;  
	justify-content: space-between;
    align-items: center;
    border-bottom : 1px solid #d3d3d3;

}

.bnt{
     background-color: #E5D1E3;
     padding: 5px 15px;
     margin : 5px;
     text-align: center;
      border: none;
     border-radius: 15px;
}

.btnSet{
	display: flex;
	flex-direction: row;  
    justify-content: flex-end
}

a:hover {
	text-decoration: none;
	background-color : #3F4350;
}

.title_con{
	margin-top : 10px;
	margin-bottom : 10px;
}
	
</style>
</head> 
<body>
<div class="wrap">
<%@include file="/WEB-INF/views/chiefAdmin/common/chiefSideBar_logo.jsp" %>
	<div class="container">
		<div class="email_sub">
			<div class="email_title">
				<h3>메일 쓰기</h3>
				<a class="bnt" href="/tobe/chiefAdmin/email/chiefMemberListEmail.do">회원목록</a>	
			</div>
			<div class="email_form">
				<form method="post" name="frm" id="frm" action="/tobe/chiefAdmin/email/send.do" enctype="multipart/form-data" >
					<div class="title_con">
						<label><b>제 목</b></label><input type="text" name="e_title" value="" class="title"/><br>
						<c:if test="${empty email}">
							<label><b>받는 사람</b></label><input type="text" name="email" id="email" value="" class="title"/>
						</c:if>
						<c:if test="${not empty email}">
							<label><b>받는 사람</b></label><input type="text" name="email" id="email" value="${email }" class="title"/ readonly />
						</c:if>
					</div>
					<textarea name="e_content" id="e_content" style="width:100%; height:580px;"></textarea>
					
					<div class="btnSet" >
						<a class="bnt" href="javascript:goSave();">저장</a> 
						<a class="bnt" href="javascript:;" class="btn" onclick="history.back();">취소</a>
					</div>
				
				</form>	
		
			</div>
		</div>
	</div>
</div>
</body> 
</html>