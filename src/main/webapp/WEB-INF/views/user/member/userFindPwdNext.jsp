<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<style>
	.id_title {
	float:left;
	}
	.pwd_contents > .pwd_class {
	border : 1px, solid #black;
	}
	</style>
<script>
$(function(){
	//
	$('.id_title').click(function(){
		$('.pwd_title').removeClass('on');
		$(this).addClass('on');
		$(".pwd_contents").hide();
		$(".id_contents").show();
	});
	$('.pwd_title').click(function(){
		$('.id_title').removeClass('on');
		$(this).addClass('on');
		$(".pwd_contents").show();
		$(".id_contents").hide();
	});
	
});
</script>
<style>
div {
margin-top:50px;
display:flex;
justify-content:center;
text-align:center;
}
</style>
</head>

<body>


	
	<!--<div class="id_title">아이디 찾기</div>
		<div class="pwd_title">비밀번호 찾기</div>
		
			<form action="userFindMember.do" method="post" id="board1" name="board1" onsubmit="">
				<div class="id_contents" id="id_data">  -->

					<div style="font-weight:bolder">
						<div style="list-style: none;">해당 이메일로<br>임시 비밀번호를 전송하였습니다.<br><br><br>
						이메일 : ${user.email }</div>
					</div>				
										
				</div>
			</form>

			<!-- <form action="userLogin.do" method="post" id="login" name="login" onsubmit="">  -->			
			<!-- <div class="ok_btn"><input type="submit" value="비밀번호 찾기"/></div>  -->
		</div>
	</div>




</body>
</html>