<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
</head>
<style>
* {
    box-sizing: border-box;
    margin:0;
    padding:0;
}

#contain{
   width: 125px;
   background-color: #3F4350;
}

#logo {
   background-color: #3F4350;
   img_size: 30px;
   height: 125px;
   width: 125px;
}

#logo>img {
   width: 90%;
   margin-left: 5px;
   margin-top: 12px;
   cursor:pointer;
}

#btn>img {
   max-width: 75px;
   max-height: 75px;
   display: block;
   margin-left: 10px;
   cursor:pointer;
}

#btno>img {
   max-width: 100px;
   max-height: 100px;
   display: block;
   margin-left: 10px;
   cursor:pointer;
}

#btne>img {
   max-width: 70px;
   max-height: 70px;
   display: block;
   margin-left: 10px;
   cursor:pointer;
}

#btna>img {
   max-width: 80px;
   max-height: 80px;
   display: block;
   margin-left: 10px;
   cursor:pointer;
}

#btn {
   background-color: #3F4350;
   height: 75px;
   width: 125px;
   border: 0px;
}

#btno {
   background-color: #3F4350;
   height: 75px;
   width: 125px;
   border: 0px;
}

#btne {
   background-color: #3F4350;
   height: 75px;
   width: 125px;
   border: 0px;
}

#btna {
   background-color: #3F4350;
   height: 75px;
   width: 125px;
   border: 0px;
}

#mainlogo>img {
   background-color: #fff;
   max-width: 500px;
   max-height: 500px;
   cursor:pointer;
}
#main {
   display: flex;
/*    height: 100vh; */
	height: 950px;
    width: 1500px;
/*    width: 100vW; */
}

a:link, a:visited {
	text-decoration: none;
	color: #000;
}
a:hover {
	text-decoration: none;
	color: #d3d3d3;
}
.logout{
	margin-top: 25px;
	margin-left: 750px;
	font-size: 90%;

}

#mainlogo {
	margin : 20px;
}
</style>
<body>
<div id="main">
	<div id="contain">
    	<div id="logo">
        	<img src="/tobe/img/admin_logo.png" onclick="location.href='/tobe/chiefAdmin/common/chiefIndex.do';">
			<hr style="border: solid 1px pink;">
		</div>
	
		<div>
		   	<button id="btn" onclick="location.href='/tobe/chiefAdmin/member/chiefMemberIndex.do';">
		    	<img src="/tobe/img/admin_user.png">
		    </button>
	   	</div>
		<div>
			<button id="btn" onclick="location.href='/tobe/chiefAdmin/course/chiefCourseIndex.do';">
				<img src="/tobe/img/admin_course.png">
			</button>
		</div>
		<div>
		   	<button id="btno" onclick="location.href='/tobe/chiefAdmin/pay/chiefPayIndex.do';">
				<img src="/tobe/img/admin_order.png">
			</button>
		</div>
		<div>
		   	<button id="btne" onclick="location.href='/tobe/chiefAdmin/email/chiefEmailIndex.do';">
	      		<img src="/tobe/img/admin_email.png">
		   	</button>
		</div>
		<div>
		   	<button id="btno" onclick="location.href='/tobe/chiefAdmin/customer/chiefCustomerIndex.do';">
		      	<img src="/tobe/img/admin_qna.png">
		   	</button>
		</div>
		<div>
	   		<button id="btn" onclick="location.href='/tobe/chiefAdmin/sales/chiefSalesIndex.do';">
	      		<img src="/tobe/img/admin_account.png">
		   	</button>
		</div>
		<div>
	   		<button id="btna" onclick="location.href='';">
	       		
		    </button>
	 	</div>
	 	<div id="btna"></div>
	</div> 
	<div id="mainlogo">
	      <img src="/tobe/img/admin_logoa.png" onclick="location.href='/tobe/chiefAdmin/common/chiefIndex.do';">
	</div>
	<div class="logout">
		<a href="/tobe/admin/common/adLogout.do"> 로그아웃</a>
	</div>
	
</div>
</body>
</html>