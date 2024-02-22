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
  <link rel="stylesheet" href="/tobe/css/user_Header_Footer.css"/>
  <script>
  	var dupCheck = false;
  	function goSave() {
  		if ($("#id").val() == '') {
  			alert('아이디를 입력하세요');
  			$("#id").focus();
  			return;
  		}
  		var isCon = true;
  		$.ajax({
		url:'idCheck.do',
		data:{id:$('#id').val()},
		async:false,
		success:function(res) {
			console.log(res);
			if (res == 'true') {
				alert('아이디가 중복되었습니다.');
				$("#id").val('');
				$("#id").focus();
				isCon = false;
				return;
			}
		}
	})
	if (!isCon) return;
  		if ($("#pwd").val() == '') {
  			alert('비밀번호를 입력하세요');
  			$("#pwd").focus();
  			return;
  		}
  		if ($("#pwd").val() != $("#pw_check").val()) {
  			alert('비밀번호를 확인하세요');
  			return;
  		}
  		var reg = /^[A-Za-z0-9]{8,}$/;
  		var txt = $("#pwd").val();
  		if( txt.match(reg) == null ) {
  		    alert("비밀번호는 영문+숫자 조합해서 8자이상 입력하세요");
  		    return false;
  		}
  		if ($("#name").val() == '') {
  			alert('이름을 입력하세요');
  			$("#name").focus();
  			return;
  		}
  		if ($("#email").val() == '') {
  			alert('이메일을 입력하세요');
  			$("#email").focus();
  			return;
  		}
  		if ($("#birthday").val() == '') {
  			alert('생년월일을 입력하세요');
  			$("#birthday").focus();
  			return;
  		}
  		// 전송
  		$("#frm").submit();
  	}
  	$(function() {
  		$("#idCheck").click(function() {
  			$.ajax({
  				url:'/tobe/user/idCheck.do',
  				data:{id:$('#id').val()},
  				success:function(res) {
  					console.log(res);
  					if (res == 'true') {
  						alert('아이디가 중복되었습니다.');
  						$("#id").val('');
  						$("#id").focus();
  					} else {
  						dupCheck = true;
  						alert('사용가능한 아이디입니다.');
  						$("#id").attr();
  					}
  				}
  			})
  		})
  	})
  </script>
   <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
  
   function zipcode() {
       new daum.Postcode({
           oncomplete: function(data) {
              
               var roadAddr = data.roadAddress; 
               var extraRoadAddr = ''; 

               if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                   extraRoadAddr += data.bname;
               }
               if(data.buildingName !== '' && data.apartment === 'Y'){
                  extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
               }
            
               if(extraRoadAddr !== ''){
                   extraRoadAddr = ' (' + extraRoadAddr + ')';
               }

               $('#zipcode').val(data.zonecode);
               $('#addr1').val(roadAddr);
           }
       }).open();
   }
</script>
</head> 
<body>
     <div class="wrap">
     <%@include file="/WEB-INF/views/user/common/userSidebar.jsp"%>
		<div class="headerBox">
			<%@include file="/WEB-INF/views/user/common/userHeader.jsp"%>
		</div>
    	<div class="main">
	        <div class="sub">
	            <div class="size">
	                <h2 class="sub_title">회원가입</h2>
	                <form name="frm" id="frm" action="join.do" method="post">
	                	<h4>필수입력</h4>
	                	<table class="board_write" cellspacing = "0">
	                    	<!-- <caption style="float:left;">필수입력</caption> -->
	                    	<colgroup>
	                        	<col width="20%" />
	                        	<col width="80%" />
	                    	</colgroup>
	                    	<tbody class="content">
	                    		<tr>
	                      			<th>&nbsp;이름</th>
	                    			<td>&nbsp;<input type="text" name="name" id="name" style="float:left;"></td>
	                    		</tr>
	                        	<tr>
	                            	<th>&nbsp;아이디</th>
	                            	<td>
	                                	<input type="text" name="id" id="id" class="inNextBtn" style="float:left;">
	                                	<span class="id_check"><a href="javascript:;"  class="btn_duplication" style="float:left; width:auto; clear:none;" id="idCheck", name="idCheck">&nbsp;중복확인&nbsp;</a></span>
	                            	</td>
	                        	</tr>
		                        <tr>
		                            <th>&nbsp;비밀번호</th>
		                            <td><input type="password" name="pwd" id="pwd" style="float:left;"> <span class="ptxt">비밀번호는 숫자, 영문 조합으로 8자 이상으로 입력해주세요.</span> </td>
		                        </tr>
		                        <tr>
		                            <th>&nbsp;비밀번호 확인</th>
		                            <td><input type="password" name="pw_check" id="pw_check" style="float:left;"></td>
		                        </tr>
		                            <th>&nbsp;이메일</th>
		                            <td>
		                                <input type="text" name="email" id="email" style="float:left;">
		                            </td>
		                        <tr>
		                            <th>&nbsp;성별</th>
		                            <td>
		                            <select name="gender" id="gender">
		                            <option value="1">남성</option>
		                            <option value="2">여성</option>
		                            </select> 
		                            </td>
		                        </tr>
		                        <tr>
		                            <th>&nbsp;생년월일</th>
		                            <td><input type="text" name="birthday" id="birthday" style="float:left;"> </td>
		                        </tr>
		                        <tr>
		                            <th>&nbsp;휴대폰 번호</th>
		                            <td>
		                                <input type="text" name="hp" id="hp" value=""  maxlength="15" style="float:left;">
		                            </td>
		                        </tr>
		                        <tr>
		                            <th>&nbsp;주소</th>
		                            
		                            <td>
		                                <input type="text" name="zipcode" id="zipcode" value=""  maxlength="6" style="float:left;" readonly>
		                                <span class="email_check"><a href="javascript:zipcode();"  class="btn_duplication" id="zipNum">&nbsp;우편번호&nbsp;</a></span>
		                            </td>
		                        </tr>
		                     	<tr>
		                     		<th>&nbsp;상세 주소</th>
		                            <td>
		                                <input type="text" name="addr1" id="addr1" value=""  maxlength="15" style="float:left;" readonly>
		                                <input type="text" name="addr2" id="addr2" value=""  maxlength="15" style="float:left;">
		                            </td>
		                        </tr>
	                    	</tbody>
	                	</table>
                        <input type="hidden" name="cmd" value="write.do"/>
                        <input type="hidden" name="checkEmail" id="checkEmail" value="0"/>
	                </form>
	                <!-- //write--->
	                <div class="btnSet_clear">
	                    <div style="text-align:center; margin:20px"><a href="javascript:;" class="btn" onclick="goSave();">가입</a> <a href="javascript:;" class="btn" onclick="history.back();">취소</a></div>
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