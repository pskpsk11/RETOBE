<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 등록</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="/tobe/smarteditor/js/HuskyEZCreator.js"></script>	
</head>
<script>
var oEditors = [];
$(function() {
    nhn.husky.EZCreator.createInIFrame({
        oAppRef: oEditors,
        elPlaceHolder: "detail", /*컬럼명또는 아이디*/
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
    	oEditors.getById['detail'].exec('UPDATE_CONTENTS_FIELD',[]);
    	
    }
</script>
<style>
 #detail{
 	width: 
 	margin: -400px 0 0 15px;
 }
 .container{
   position: relative;
   margin: -845px 0 0 160px;
   width : 1340px ;
   height : 850px;
  } 
  .title {
  size: 1000px;
  
  }
  #detail{
  
  }
} 
</style>
<body>
<%@include file="/WEB-INF/views/chiefAdmin/common/chiefSideBar_logo.jsp" %>
<div class="container">
<form name="frm" method="post" action="chiefNoticeInsert.do" enctype="multipart/form-data" onsubmit="return goSave()">   
	제목 : <input name="n_title" tpye="text" class="title"/>
	<textarea name="n_content" id="detail" rows="4" cols="50">  </textarea>
		  <div colspan="2" id="put">
            <input type="submit" value="등록하기" /> 
            <input type="button" value="목록보기" onclick="location.href='/tobe/chiefAdmin/customer/chiefCustomerIndex.do';" />
        </div>
  </form>

</div>  
</body>
</html>