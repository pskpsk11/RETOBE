<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Tobe 회원정보수정</title>

<META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />

	<script>
		var dupCheck = false;
		function goSave() {
			if ($("#id").val() == '') {
				alert('아이디를 입력하세요');
				$("#id").focus();
				return;
			}
			
			if ($("#pwd").val() == '') {
				alert('비밀번호를 입력하세요');
				$("#pwd").focus();
				return;
			}
			
			if ($("#pwd").val() != $("#pwd_check").val()) {
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
			if ($("#birthday").val() == '') {
    			alert('생년월일을 입력하세요');
    			$("#birthday").focus();
    			return;
    		}
			// 전송
			$("#frm").submit();
			}
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

<style>
.main {
	margin: 0 auto;
	width: 100%;
	height: auto;
	position: relative;
	max-width: 100%;
}

.userMain {
	width: 100%;
	height: 170px;
	margin: 0 auto;
	max-width: 1280px;
}

.userMain a:link, a:visited {
	text-decoration: none;
}

.part1 {
	position: relative;
	width: 100%;
	height: auto;
	text-align: center;
	font-color: #fff;
	font-size: 1.5rem;
	left: 1rem;
}

#userName {
	position: absolute;
	top: 0.75rem;
	left: 1.5rem;
}

#userName > b {
	color: #ff5050;
}
#userId {
	position: absolute;
	top: 4rem;
	left: 1.5rem;
}

.part2 {
	margin: 0 0 0 200px;
    position: absolute;
    /* width: 100%; */
    height: auto;
    font-size: 25px;
}

#set {
	position: relative;
    width: 100%;
    height: auto;
    margin: 0 auto;
    padding: 0;

}

#quit {
	position: relative;
    width: 100%;
    height: auto;
    top: 65px;
    margin: 0 auto;
}

#setImg {
	position: absolute;
	width: 2.5rem;
	top: 1rem;
}

#quitImg {
	position: relative;
	width: 40px;
}

#setText{
	position: absolute;
	text-align: center;
	left: 3.5rem;
	top: 1.35rem;
}

#quitText {
    margin: 56px;
    position: relative;
    text-align: center;
}

.pointContainer {
    margin: 0 0 0 970px;
    width: 100%;
    /* height: 10rem;*/
}

#pointImg {
	margin: 1.9rem 0;
	float: left;
}

#point {
	float: left;
	margin: 3rem 0 0 1rem;
	width: 13rem;
	height: 4rem;
}

#userPointText {
	width: 13rem;
	font-size: 1.25rem;
}

#userPointText > b{
	color: #ff5050;
}
#numPointText {
	width: 11.5rem;
	font-size: 1.25rem;
}

#numPointText > b {
	color: #ff5050;
}

.modifyForm {
    display: flex;
    margin: 0 auto;
    max-width: 1280px;
    position: relative;
    width: 100%;
    color: #ff5050;
    flex-direction: column;
    flex-wrap: wrap;
    align-content: center;
    justify-content: center;
    align-items: center;
}

.frm {
	width: 40rem;
	font-size: 1.25rem;
}

.input {
	width: 15rem;
	text-align: center;
	font-size: 1.15rem;	
	padding: 0.5rem;
	margin: 0.25rem auto;
}

#resetBtn {
	position: absolute;
    border: none;
    background: none;
    padding: 0;
    margin: 0;
    cursor: pointer;
    font-size: 1.5rem;
    top: 36rem;
    left: 19rem;
}

#modBtn {
	position: absolute;
    border: none;
    background: none;
    padding: 0;
    margin: 0;
    cursor: pointer;
    font-size: 1.5rem;
    top: 36rem;
    left: 15rem;
    color: #49654E;
}

table{
		border: 1px solid;
		width: 1080px;
		border-collapse:collapse;
		}
		th, td{
		border:1px solid;
		font-size:15px;
		border-width: thin;
		}
		th{
		background-color:#E4E6D9;
		text-align:left;
		}
		.board_write{
		width:740px;
		}
		.wrap {
		margin: 0 auto;
		position: relative;
		}
		
		.btnSet_clear{
		text-align:right;
		}
		.btnSet_clear .btn{
		background-color:#ff5050;
		border:solid;
		border-radius:10px;
		border-width:thin;
		font-size:15px;
		color:white;
		display:inline-block;
		width:100px;
		text-align:center;
		text-decoration-line:none;
		margin:20px;
		}
		
		table th{
		color:#44546A;
		font-weight:bolder;
		}
		a:link{
		color:black;
		}
		a#zipNum{
		background-color:#E7E7E7;
		border:solid;
		border-radius:7px;
		border-width:thin;
		font-size:13px;
		text-decoration-line:none;
		border-color:#D9D9D9;
		color:#44546A;
		}

#pointul{
	float: right;
}

</style>


</head>
<body>
	<%@include file="/WEB-INF/views/user/common/userSidebar.jsp"%>
    <%@include file="/WEB-INF/views/user/common/userChatBot.jsp"%>	<div class="headerBox">
		<%@include file="/WEB-INF/views/user/common/userHeader.jsp"%>
	</div>
	<div class="wrap">
		<div class="main">
			<div class="userMain">
				<div class="part1">
					<p id="userName"><b>${user.name }</b>님</p>
					<p id="userId">${user.id }</p>
				</div>
				<div class="part2">
					<div id="set">
						<a href="/tobe/user/modify.do">
							<img src="/tobe/img/set.png" id="setImg">
							<span id="setText">회원정보수정</span>
						</a>
					</div>
					<div id="quit">
						<a href="/tobe/user/cancel.do">
							<img src="/tobe/img/quit.png" id="quitImg">
							<span id="quitText">회원탈퇴</span>
						</a>
					</div>
				</div>
				
				<ul id = "pointul">
					<li>
						<div class="pointContainer"><img src="/tobe/img/point.png" id="pointImg">
							<span id="point">
								<span id="userPointText"><b>${user.name }</b>님의 잔여포인트</span><br>
								<span id="numPointText"><b>${user.point } </b> 포인트</span>
							</span>
						</div>
					</li>
				</ul>
			</div>
	
			<div class="modifyForm">
				<h2 class="sub_title">회원정보 수정</h2>
	               <form name="frm" id="frm" method="post" action="modify.do">
	                <table class="board_write" cellspacing = "0" >
	                    <colgroup>
	                        <col width="20%" />
	                        <col width="80%" />
	                    </colgroup>
	                    <tbody>
	                    	<tr>
	                    		<th>&nbsp;이름</th>
	                    		<!-- <td><input type="text" name="name" id="name" class="input" style="float:left;" value="${user.name }" readonly><td></td> -->	                    		
	                    		<td style="font-weight:bolder;">${user.name }</td>
	                    	</tr>
	                        <tr>
	                            <th>&nbsp;아이디</th>
	                            <!--<td><input type="text" name="id" id="id" style="float:left;" value="${vo.id }"></td>-->
	                            <td style="font-weight:bolder;">${user.id }</td>
	
	                        </tr>
	                        <tr>
	                            <th>&nbsp;비밀번호</th>
	                            <td><input type="password" name="pwd" id="pwd"  style="float:left;"><div class="ptxt" style="font-size:15px;">비밀번호는 숫자, 영문 조합으로 8자 이상으로 입력해주세요.</div> </td>
	                        </tr>
	                        <tr>
	                            <th>&nbsp;비밀번호 확인</th>
	                            <td><input type="password" name="pwd_check" id="pwd_check" style="float:left;"></td>
	                        </tr>
	                        <tr>
	                            <th>&nbsp;이메일</th> 
	                               <td><input type="text" name="email" id="email" style="float:left;" value="${user.email }"></td>
	                        </tr>
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
	                            <td><input type="text" name="birthday" id="birthday" style="float:left;" value="${user.birthday }"> </td>
	                        </tr>
	                        <tr>
	                            <th>&nbsp;휴대폰 번호</th>
	                            <td>
	                                <input type="text" name="hp" id="hp" maxlength="15" style="float:left;" value="${user.hp }">
	                            </td>
	                        </tr>
	                        <tr>
	                            <th>&nbsp;주소</th>
	                            
	                            <td>
	                                <input type="text" name="zipcode" id="zipcode" maxlength="6" style="float:left;" value="${user.zipcode }">
	                                <span class="email_check"><a href="javascript:zipcode();"  class="btn" style="float:left; width:auto; clear:none;" id="zipNum">우편번호</a></span>
	                            </td>
	                        </tr>
	
	                     	<tr>
	                     		<th>&nbsp;상세 주소</th>
	                            <td>
	                                <input type="text" name="addr1" id="addr1" maxlength="15" style="float:left;" value="${user.addr1 }">
	                   
	                                <input type="text" name="addr2" id="addr2" maxlength="15" style="float:left;" value="${user.addr2 }">
	                            </td>
	                        </tr>
	                       
	                    </tbody>
	                </table>
	                    <input type="hidden" name="cmd" value="write.do"/>
	                    <input type="hidden" name="member_no" id="member_no" value="${user.member_no }"/> <!-- 강사님 수정해주심 -->
	                    
	                    <!-- 이메일 부분 해야함 -->
	                    <!-- input type="reset" id="resetBtn" value="취소"/> -->
	               </form>
	           		<div class="btnSet_clear">
	                   	<div><a href="javascript:;" class="btn" onclick="goSave();">수정완료</a> <a href="javascript:;" class="btn" onclick="history.back();">취소</a></div>
	               	</div>
			</div>
		</div>
	</div>
	<div class="footerBox">
		<%@include file="/WEB-INF/views/user/common/userFooter.jsp"%>
	</div>
</body>
</html>