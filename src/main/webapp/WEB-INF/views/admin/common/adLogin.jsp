<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>학원 관리자 페이지</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

<script>
function loginCheck() {
	if ($("#ad_id").val() == '') {
		alert("아이디를 입력해 주세요");
		$("#ad_id").focus();
		return false;
	}
	if ($("#ad_pwd").val() == '') {
		alert("비밀번호를 입력해 주세요");
		$("#ad_pwd").focus();
		return false;
	}
}

</script>
	


<style>
* {
	box-sizing: border-box;
}

body {
	position: relative;
}
.admin_logo {
	position: absolute;
	width: 40rem;
	height: 5rem;
	top: 2rem;
	left: 15rem;
}

.box {
	position: absolute;
	width: 75rem;
	height: 22rem;
	top: 6rem; 
	left: 15.5rem;
	border: 1px solid #ddd;
	box-shadow: 5px 5px 10px rgba(0, 0, 0, 0.5);
}


</style>

</head>
<body>

		<div class="admin_logo">
			<img src="/tobe/img/logo.png" style="width: 13rem;">
			<span style="position: absolute; top: 0.5rem; left: 14rem; font-size: 2rem;"><b>관리자 로그인 페이지</b></span>
		</div>
	<form action="login.do" method="post" id="board1" name="board1" onsubmit="return loginCheck()">
            <div class="sub">
               	<div class="size">
                    	
                    <div class="member">
                        <div class="box">
                            <fieldset class="login_form">
                                <ul class="no_dot" margin>
                                    <li>TOBE</li>
                                    <li><input type="text" id="ad_id" name="ad_id" placeholder="아이디" style="width:200px"></li>
                                    <li><input type="password" id="ad_pwd" name="ad_pwd" placeholder="비밀번호" style="width:200px"></li>
                                    <li><label><input type="checkbox" name="reg1" id="reg1" style="width:10px;height:10px"/><font size="1px">아이디저장</font></label></li>
                                    <li><a href="userFindMember.do" class="btn" style="font-size:10px">아이디|비밀번호 찾기</a></li>
                                </ul>
                                <div class="login_btn"><input type="submit" value="로그인"/></div>
                            </fieldset>
                            <div class="btnSet_clear">
                                <div style="color: #2F5720"></div>
                            </div>
                        </div>
                    </div>
        
                </div>
            </div>
        </form>
		
</body>
</html>