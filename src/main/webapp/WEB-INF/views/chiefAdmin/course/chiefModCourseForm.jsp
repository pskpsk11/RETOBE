<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>tobe 강좌수정</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="/tobe/smarteditor/js/HuskyEZCreator.js"></script>
<script>
   function backToList(obj) {
      obj.action = "list.do";
      obj.submit();
   }
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
	   if ($("#cname").val() == "") {
		   alert('과목명을 입력하세요');
		   $("#cname").focus();
		   return false;
	   }
	   if ($("#teacher1").val() == "") {
		   alert('강사명을 입력하세요');
		   $("#teacher1").focus();
		   return false;
	   }
	   if ($("#price").val() == "") {
		   alert('가격을 입력하세요');
		   $("#price").focus();
		   return false;
	   }
	   if ($("#time").val() == "") {
		   alert('상세시간을 입력하세요');
		   $("#time").focus();
		   return false;
	   }
	   if ($("#startday").val() == "") {
		   alert('개강일을 입력하세요');
		   $("#startday").focus();
		   return false;
	   }
	   if ($("#endday").val() == "") {
		   alert('종강일을 입력하세요');
		   $("#endday").focus();
		   return false;
	   }
	   if ($("#level").val() == "") {
		   alert('수준을 선택하세요');
		   $("#endday").focus();
		   return false;
	   }
	   if ($("#file").val() == "") {
		   alert('강사사진을 첨부하세요');
		   $("#file").focus();
		   return false;
	   }

   	oEditors.getById['detail'].exec('UPDATE_CONTENTS_FIELD',[]); /*getById에 컬럼명또는 아이디*/
   	
   }
   function readURL(input) {
	   if (input.files && input.files[0]) {
	     var reader = new FileReader();
	     reader.onload = function(e) {
	       document.getElementById('preview').src = e.target.result;
	     };
	     reader.readAsDataURL(input.files[0]);
	   } else {
	     document.getElementById('preview').src = "";
	   }
	 }
   
   
   
   </script>
<style>
#in{
  display: flex;
}
#con{
	margin: -870px 0 0 150px; 
}
#boxa{
	display: flex;
	width:1200px; 
	height:610px; 
}
.filebox {
 	height: 200px;
}
.filebox .upload-name {
    display: inline-block;
    height: 200px;
    padding: 0 10px;
    vertical-align: middle;
    border: 1px solid #81BEF7;
    width: 45%;
    color: #999999;
    margin: 10px 0 0 20px;
    text-align: center;
}
.filebox label {
    display: inline-block;
    padding: 10px 20px;
    color: #fff;
    vertical-align: middle;
    background-color: #999999;
    cursor: pointer;
    height: 20px;
    margin: 10px 0 0 60px;
}
.filebox input[type="file"] {
    position: absolute;
    width: 0;
    height: 0;
    padding: 0;
    overflow: hidden;
    border: 0;
}
#boxb{
 	border: solid 1px;
	width:750px; 
	height:400px;
	margin: -600px 0 0 260px;
	position: relative; /*부모 div에 설정 후 자식 div에 display: flex하면 가로정렬*/
}
#box_a{
	display: flex;
	flex-basis: auto;
	margin: 10px 0 0 -50px;
	justify-content: space-around; /*select간 간격*/
}
#cn{
	display: flex;
}
#te{
	margin: 15px 0 0 10px;
}
#pr{
	margin: 15px 0 0 -35px;
}
#sub{
	display: flex;
	margin: 10px 0 0 17px;
	justify-content: space-evenly;
}
.edu{
	margin: 5px;
}
.br{
	margin: 5px;
}
.ar{
	margin: 5px;
}
#da{
	display: flex;
	justify-content: space-evenly;
}
#st{
	margin: 15px 0 0 0px;
}
#en{
	margin: 15px 0 0 0px;
}
#le{
	margin: 15px 0 0 35px;
}
#mo{
	margin: 15px 0 0 35px;
}
#tt{
	position: absolute;
	justify-content: space-evenly;
}
#ti{
	display: flex;
	margin: 10px 0 0 35px;
}
#dti{
	display: flex;
	margin: -20px 0 0 300px;
}
#put{
	margin: 30px 0 0 -520px;
}
#de{
	margin: 0 0 0 260px;
	width: 1300px;
}
</style>
</head>
<body>
<%@include file="/WEB-INF/views/chiefAdmin/common/chiefSideBar_logo.jsp" %>
  
  
   <form name="cheifModForm" method="post" action="course.do" enctype="multipart/form-data" onsubmit="return goSave()">   
	  <div id="con">
	    <div id="boxa">      
	        <div class="filebox">
	        <input type="file" onchange="readURL(this);"> 
			<img id="preview" class="upload-name" value="강사이미지" />
			    <label for="file">파일첨부</label> 
			    <input type="file" id="teacher_img_orgS" name="file" onchange="readURL(this);">
			</div>
		</div>
		<div id="boxb">
			<div id="box_a">
				<div class="edu">
			
					<b>학원명</b>
					<select name="education" id="educationS">
	                  <option value="1" <c:if test="${map.education == 1 }">selected</c:if>>해커스</option>
	                  <option value="2" <c:if test="${map.education == 2 }">selected</c:if>>파고다</option>
	                  <option value="3" <c:if test="${map.education == 3 }">selected</c:if>>YBM</option>
	            	</select>
				</div>
				<div class="br">
					<b>지점명</b>
					 <select name="branch" id="branchS">
		                  <option value="1" <c:if test="${map.branch == 1 }">selected</c:if>>강남</option>
		                  <option value="2" <c:if test="${map.branch == 2 }">selected</c:if>>종로</option>
		                  <option value="3" <c:if test="${map.branch == 3 }">selected</c:if>>종로e4u</option>
		                  <option value="4" <c:if test="${map.branch == 4 }">selected</c:if>>신촌</option>
		                  <option value="5" <c:if test="${map.branch == 5 }">selected</c:if>>건대</option>
		                  <option value="6" <c:if test="${map.branch == 6 }">selected</c:if>>대구동성로</option>
		                  <option value="7" <c:if test="${map.branch == 7 }">selected</c:if>>서면</option>
		                  <option value="8" <c:if test="${map.branch == 8 }">selected</c:if>>부산대</option>
		                  <option value="9" <c:if test="${map.branch == 9 }">selected</c:if>>대연</option>
		                  <option value="10" <c:if test="${map.branch == 10 }">selected</c:if>>부산광복</option>
		                  <option value="11" <c:if test="${map.branch == 11 }">selected</c:if>>인천센터</option>
	           		 </select>		
				</div>
				<div class="ar">
					<b>지역</b>
					<select name="area" id="areaS">
	                  <option value="2" <c:if test="${map.area == 2 }">selected</c:if>>서울</option>
	                  <option value="32" <c:if test="${map.area == 32 }">selected</c:if>>인천</option>
	                  <option value="51" <c:if test="${map.area == 51 }">selected</c:if>>부산</option>
	                  <option value="53" <c:if test="${map.area == 53 }">selected</c:if>>대구</option>
	            	</select>
				</div>				
			</div>
			<div id="sub">
				<div id="su">
					<b>과목</b>
					<select name="subject" id="subjectS">
		                 <option value="1" <c:if test="${map.subject == 1 }">selected</c:if>>토익</option>
		                 <option value="2" <c:if test="${map.subject == 2 }">selected</c:if>>토스</option>
		                 <option value="3" <c:if test="${map.subject == 3 }">selected</c:if>>토플</option>
		                 <option value="4" <c:if test="${map.subject == 4 }">selected</c:if>>아이엘츠</option>
		                 <option value="5" <c:if test="${map.subject == 5 }">selected</c:if>>텝스</option>
		                 <option value="6" <c:if test="${map.subject == 6 }">selected</c:if>>오픽</option>
		                 <option value="7" <c:if test="${map.subject == 7 }">selected</c:if>>gre</option>
		                 <option value="8" <c:if test="${map.subject == 8 }">selected</c:if>>g-telp</option>
	        		 </select>
				</div>	
				<div id="cn">
					<b style="margin-right:10px">과목명</b>  <input type="text" name="cname" id="cnameS" size="70" value="${map.cname}">  
				</div>
			</div>
			<div>
				<div id="le" >
					<b>수준</b> <b>토익</b>
					<label><input type="checkbox" name="level" value="1500" <c:if test="${map.level == 1500 }">checked</c:if>> 500</label>
					<label><input type="checkbox" name="level" value="1600" <c:if test="${map.level == 1600 }">checked</c:if>> 600</label> 
					<label><input type="checkbox" name="level" value="1700" <c:if test="${map.level == 1700 }">checked</c:if>> 700</label> 
					<label><input type="checkbox" name="level" value="1800" <c:if test="${map.level == 1800 }">checked</c:if>> 800</label> 
					<label><input type="checkbox" name="level" value="1900" <c:if test="${map.level == 1900 }">checked</c:if>> 900</label><br>
					<b style="margin-left:37px">토스</b>
					<label><input type="checkbox" name="level" value="21" <c:if test="${map.level == 21 }">checked</c:if>>입문</label> 
					<label><input type="checkbox" name="level"  value="22" <c:if test="${map.level == 22 }">checked</c:if>>기본</label> 
					<label><input type="checkbox" name="level"  value="23" <c:if test="${map.level == 23 }">checked</c:if>>중급</label> 
					<b style="margin-left:37px">토플</b>
					<label><input type="checkbox" name="level"  value="360" <c:if test="${map.level == 360 }">checked</c:if>> 60</label> 
					<label><input type="checkbox" name="level"  value="370" <c:if test="${map.level == 370 }">checked</c:if>> 70</label> 
					<label><input type="checkbox" name="level"  value="380" <c:if test="${map.level == 380 }">checked</c:if>> 80</label> 
					<label><input type="checkbox" name="level"  value="390" <c:if test="${map.level == 390 }">checked</c:if>> 90</label><br>
					<b style="margin-left:37px">ielts</b>
					<label><input type="checkbox" name="level"  value="45" <c:if test="${map.level == 45 }">checked</c:if>>5</label> 
					<label><input type="checkbox" name="level"  value="46" <c:if test="${map.level == 46 }">checked</c:if>>6</label>
					<label><input type="checkbox" name="level"  value="47" <c:if test="${map.level == 47 }">checked</c:if>>7</label><br>
				    <b style="margin-left:37px">텝스</b>
				    <label><input type="checkbox" name="level"  value="5300" <c:if test="${map.level == 5300 }">checked</c:if>> 300</label>
				    <label><input type="checkbox" name="level"  value="5350" <c:if test="${map.level == 5350 }">checked</c:if>> 350</label> 
				    <label><input type="checkbox" name="level"  value="5400" <c:if test="${map.level == 5400 }">checked</c:if>> 400</label> 
				    <label><input type="checkbox" name="level"  value="5500" <c:if test="${map.level == 5500 }">checked</c:if>> 500</label><br>
				    <b style="margin-left:37px">오픽</b>
					<label><input type="checkbox" name="level"  value="61" <c:if test="${map.level == 61 }">checked</c:if>>입문</label>
					<label><input type="checkbox" name="level"  value="62" <c:if test="${map.level == 62 }">checked</c:if>>기본</label>
					<label><input type="checkbox" name="level"  value="63" <c:if test="${map.level == 63 }">checked</c:if>>중급</label><br>
				    <b style="margin-left:37px">gre</b>
					<label><input type="checkbox" name="level"  value="71" <c:if test="${map.level == 71 }">checked</c:if>> 기본</label>
					<label><input type="checkbox" name="level"  value="72" <c:if test="${map.level == 72 }">checked</c:if>> 정규</label> 
					<label><input type="checkbox" name="level"  value="73" <c:if test="${map.level == 73 }">checked</c:if>> 실전</label><br>
					<b style="margin-left:37px">g-telp</b>
					<label><input type="checkbox" name="level"  value="81" <c:if test="${map.level == 81 }">checked</c:if>> 30</label> 
					<label><input type="checkbox" name="level"  value="82" <c:if test="${map.level == 82 }">checked</c:if>> 40</label>
				</div>
			</div>
			<div id="te">
				<b>강사명1</b> <input type="text" name="teacher1" id="teacher1S" value="${map.teacher1}"><b style="margin-left:10px" style="margin-right:10px" >강사명2</b> <input type="text" name="teacher2" value="${map.teacher2}"> 
			</div>
			<div id="da">
				<div id="pr">
					<b style="margin-right:10px">가격</b> <input type="text" name="price" value="${map.price}">원
				</div>
				<div id="st">
					<b>개강일</b>	<input type="date" name="startday" id="startdayS">			
				</div>
				<div id="en">
					<b>종강일</b> <input type="date" name="endday" id="enddayS">
				</div>
			</div>
			<div>
				<div id="mo">
					<B>요일</B>
					<label><input type="checkbox" name="mon" value="1" <c:if test="${map.mon == 1 }">checked</c:if>>월</label> 
					<label><input type="checkbox" name="tue" value="2" <c:if test="${map.tue == 2 }">checked</c:if>>화</label> 
		            <label><input type="checkbox" name="wed" value="3" <c:if test="${map.wed == 3 }">checked</c:if>>수</label> 
		            <label><input type="checkbox" name="thu" value="4" <c:if test="${map.thu == 4 }">checked</c:if>>목</label> 
		            <label><input type="checkbox" name="fri" value="5" <c:if test="${map.fri == 5 }">checked</c:if>>금</label> 
		            <label><input type="checkbox" name="sat" value="6" <c:if test="${map.sat == 6 }">checked</c:if>>토</label> 
		            <label><input type="checkbox" name="sun" value="7" <c:if test="${map.sun == 7 }">checked</c:if>>일</label>
				</div>
			</div>
			<div id="tt">
				<div id="ti">
					<b style="margin-right:10px">수업시간대</b>
					<select name="timezone">
	                  <option value="9" <c:if test="${map.timezone == 9 }">selected</c:if>>오전(9시이전)</option>
	                  <option value="912" <c:if test="${map.timezone == 912 }">selected</c:if>>오전(9시~12시)</option>
	                  <option value="1218" <c:if test="${map.timezone == 1218 }">selected</c:if>>오후(12시~18시)</option>
	                  <option value="18" <c:if test="${map.timezone == 18 }">selected</c:if>>저녁(18시이후)</option>
	            	</select>
				</div>
				<div id="dti">
					<b style="margin-right:10px">상세시간</b> <input type="text" name="time" value="${map.time}">
				</div>
			</div>
		</div>
		<div id="de">
			<textarea name="detail" id="detail" value="${map.detail}"></textarea> <!-- name이랑 id는 컬럼명 -->
		</div>
	 </div>
	 
	       	 <div >
	            <div align="center">
		            <div colspan="2" id="put">
			            <input type="submit" value="수정하기"> 
			            <input type="button" value="목록보기" onclick="backToList(this.form)">
		            </div>
	            </div>
	         </div>
   </form>
 </div>  
</body>
</html>