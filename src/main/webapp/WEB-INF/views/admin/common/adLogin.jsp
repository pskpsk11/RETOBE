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

.sub{
	width: 100%;
	max-width: 1280px;
	margin: 200px auto;
}
.admin_logo {
    display: flex;
    max-width: 1280px;
    position: relative;
    width: 100%;
    height: auto;
    /* top: 2rem; */
    /* left: 15rem; */
    margin: 0 auto;
    flex-direction: row;
    justify-content: flex-start;
    align-content: center;
    align-items: center;
}

.login_form{
	width: 400px;
}

.no_dot{
	list-style: none;
}
.box {
    display: flex;
    position: relative;
    height: auto;
    /* top: 6rem; */
    /* left: 15.5rem; */
    /*border: 1px solid #ddd;
    box-shadow: 5px 5px 10px rgba(0, 0, 0, 0.5);*/
    margin: 0 auto;
    flex-direction: row;
    align-content: center;
    justify-content: center;
    align-items: center;
}

input[type="submit"]{
    bottom: 130px;
    position: relative;
    float: right;
    font-size: 17px;
    width: 100px;
    cursor: pointer;
    height: 34px;
    border-radius: 20px;
    background-color: #e5d1e3;
    border: thin;
    color: white;
}

</style>

</head>
<body>

	<div class="admin_logo">
		<img src="/tobe/img/logo.png" style="width: 13rem;">
		<span style="position: relative; font-size: 2rem; color: #e5d1e3;"><b>관리자 로그인 페이지</b></span>
	</div>
	<form action="login.do" method="post" id="board1" name="board1" onsubmit="return loginCheck()">
            <div class="sub">
               	<div class="size">
                    	
                    <div class="member">
                        <div class="box">
                            <fieldset class="login_form">
                                <ul class="no_dot">
                                    <li><input type="text" id="ad_id" name="ad_id" placeholder="아이디" style="width:200px; height: 30px;"></li>
                                    <li><input type="password" id="ad_pwd" name="ad_pwd" placeholder="비밀번호" style="width:200px; margin: 10px 0; height: 30px;"></li>
                                    <li><label><input type="checkbox" name="reg1" id="reg1" style="width:15px; height:15px; margin: 10px 3px;"/><font size="3px">아이디저장</font></label></li>
                                    <li><a href="userFindMember.do" class="btn" style="font-size:15px">아이디|비밀번호 찾기</a></li>
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