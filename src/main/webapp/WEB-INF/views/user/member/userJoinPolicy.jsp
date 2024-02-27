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

  
    <script>

   
    function loginCheck() {
    	if ($("#id").val() == '') {
    		alert("아이디를 입력해 주세요");
    		$("#id").focus();
    		return false;
    	}
    	if ($("#pwd").val() == '') {
    		alert("비밀번호를 입력해 주세요");
    		$("#pwd").focus();
    		return false;
    	}
    }
    
    
    
    function selectAll() {
        const selectAllCheckbox = document.getElementById('selectAllCheckbox');
        const checkboxes = document.getElementsByName('select');

        checkboxes.forEach((checkbox) => {
            checkbox.checked = selectAllCheckbox.checked;
        });
    }
    
 // 폼 제출 전 체크 확인 및 페이지 이동 함수
    function checkAgree() {
	 	if (!$("#agree1").prop("checked")) {
	 		alert('개인정보 수집/이용을 확인하세요.');
	 		return;
	 	}
	 	if (!$("#agree2").prop("checked")) {
	 		alert('개인정보 제3자 제공을 확인하세요.');
	 		return;
	 	}
	 	location.href="joinForm.do";
	}
		
    </script>
</head> 
<body>
    <div class="wrap">
    <%@include file="/WEB-INF/views/user/common/userSidebar.jsp"%>
    <%@include file="/WEB-INF/views/user/common/userChatBot.jsp"%>
		<div class="headerBox">
			<%@include file="/WEB-INF/views/user/common/userHeader.jsp"%>
		</div>
		<div class="wrap">
	    	<div class="main">
			<div class="all">
	    	  	<form onsubmit="return validateForm()">
	    			<li class="checkBox check1">
	    				<ul class="clearfix">
		    				<ul class="first">
		    					<br>
		    					<li><font color="red" style="font-weight:bold">2020년 07월 1일</font>부로 이용약관이 개정되었습니다.</li>
		    					<li class="checkAllBtn">
		    						<input type="checkbox" id="selectAllCheckbox" onclick="selectAll()">
		    						<label for="selectAllCheckbox"><b>전체 동의</b></label> 
		    					</li>
		    				</ul>
		  
							
		    
		    				<textarea rows="30" cols="153" style="background-color:#EBEBEB">
		    						         	</textarea>		        	    				
			    	</ul>
		    		<li class="checkbox check2">
	    	<ul class="clearfix">
		    	<li><b>[필수동의]</b>개인정보 수집/이용 동의</li><br>
		    	<table class="check2">
		    		<tr style="text-align:center" bgcolor="#EBEBEB">
			    		<td>수집 및 이용하는 개인정보 항목</td>
			    		<td>수집 및 이용 목적</td>
			    		<td>보유 및 이용기간</td>
			    	</tr>
			    	<tr>
			    		<td><b>[필수 정보]</b><br>한글이름, 아이디, 비밀번호, 생년월일, 이메일, 휴대전화번호</td>
			    		<td style="text-align:center">가입 신청 및 수강 신청</td>
			    		<td style="text-align:center"><font color="red" style="font-weight:bold">회원탈퇴</font></td>
			    	</tr>
		    	</table><br>
		    	
		    	
		    	<div>위 동의 안내에 거부할 권리가 있습니다.<br>그러나 동의 거부할 경우 실명 확인이 되지 않음에 따라 가입 신청 및 수강 신청을 하실 수 없습니다.<br><strong>위와 같은 개인정보의 수집/이용에 동의하십니까?</strong></div>
		    	<input type="checkbox"  name="select" id="agree1"><label for="agree1">동의함</label>
		    	
	
	    	</ul>
	    	</li>
	    	<li class="checkbox check3">
	    	<ul class="clearfix">
		    	<li><b>[필수동의]</b> 개인정보 제3자 제공</li><br>
		    	<table class="check3">
		    		<tr style="text-align:center" bgcolor="#EBEBEB">
			    		<td>제공받는 자</td>
			    		<td>제공받는 자의 이용 목적</td>
			    		<td>제공하는 개인정보 항목</td>
			    		<td>보유 및 이용기간</td>
			    	</tr>
			    	<tr>
			    		<td style="text-align:center">(주)토비</td>
			    		<td style="text-align:center">토비 회원가입</td>
			    		<td><b>[필수정보]</b><br>한글이름, 아이디, 비밀번호, 생년월일,<br>이메일, 휴대전화번호</td>
			    		<td style="text-align:center"><font color="red" style="font-weight:bold">회원탈퇴</font></td>
			    	</tr>
		    	</table><br>
		    	
		    	<div>위 동의 안내에 거부할 권리가 있습니다.<br>그러나 동의 거부할 경우 실명 확인이 되지 않음에 따라 가입 신청 및 수강 신청을 하실 수 없습니다.<br><strong>위와 같은 개인정보의 제3자 제공에 동의하십니까?</strong></div>
		    	<input type="checkbox" name="select" id="agree2"> <label for="agree2">동의함</label>
		    	
	
	    	</ul>
	    	</li>
	    			<div class="btnSet_clear">
	                    <div><a href="javascript:;" class="btn" onclick="history.back();">이전</a>
	                    <input type="button" class="next" onclick="checkAgree();" value="다음">
	                </div>
	    	</form>
	    	
				</div>
	    	</div>
		    				
			<div class="footerBox">
				<%@include file="/WEB-INF/views/user/common/userFooter.jsp"%>
			</div>
		</div>
</div>
  	


	
</body> 
</html>