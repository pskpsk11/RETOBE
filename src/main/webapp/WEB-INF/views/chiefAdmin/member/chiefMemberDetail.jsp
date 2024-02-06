<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원정보수정</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

<script>
   function goSave(){
	   $("#frm").submit();
   }

</script>
<style>
		
	

        
		table{
		border: 1px solid;
		width: 1080px;
		}
		th, td{
		border:1px solid;
		font-size:20px
		
		}
		th{
			background-color:#D9D9D9;
			text-align:left;
		}
		.container{
	   position: relative;
	   margin: -845px 0 0 160px;
	   width : 1340px ;
	   height : 850px;  
	   }
	   	.size{
	    position:absolute;
	    top:45%;
	    left:50%;
	    transform:translate(-50%, -50%);
        } 
	   
	   	.board_write{
		width:700px;
		}
		.btnSet_clear{
		text-align:right;
		}
		.btnSet_clear .btn{
		background-color:#F0F5F8;
		border:solid;
		border-radius:7px;
		border-width:thin;
		font-size:13px;
		display:inline-block;
		width:50px;
		text-align:center;
		}
		.sub_title{
		color:#8B6858;
		}
		.btnSet_clear : hover{
		text-decoration: none;
		background-color : #3F4350;
		color:white;
		cursor:pointer;		
		}

		

	</style>

</head>
<body>

    <div class="wrap">
       <%@include file="/WEB-INF/views/chiefAdmin/common/chiefSideBar_logo.jsp" %>
       </div>
       <div class="container">
        <div class="sub">
            <div class="size">
                <h2 class="sub_title">회원정보</h2>
               	<br></br>
                <form name="frm" id="frm" method="post" action="chiefMemberIndex.do">
                <table class="board_write" cellspacing = "0">
                    <!-- <caption style="float:left;">필수입력</caption> -->
                    <colgroup>
                        <col width="20%" />
                        <col width="80%" />
                    </colgroup>
                    <tbody>
                    	<tr>
                    		<th>&nbsp;이름</th>
                    		<td>&nbsp;${map.name}</td>
                    	</tr>
                        <tr>
                    		<th>&nbsp;아이디</th>
                    		<td>&nbsp;${map.id }</td>
                    	</tr>
                        <tr>
                            <th>&nbsp;성별</th>
                            <td>&nbsp;${map.gender }</td>
                        </tr>
                        <tr>
                            <th>&nbsp;가입일</th>
                            <td>&nbsp;${map.registdate }</td>
                        </tr>
                        <tr>
                    		<th>&nbsp;생년월일</th>
                    		<td>&nbsp;${map.birthday }</td>
                    	</tr>
                    	<tr>
                    		<th>&nbsp;이메일</th>
                    		<td>&nbsp;${map.email }</td>
                    	</tr>
                    	<tr>
                    		<th>&nbsp;전화번호</th>
                    		<td>&nbsp;${map.hp }</td>
                    	</tr>
                    	<tr>
                    		<th>&nbsp;포인트</th>
                    		<td><input type="text" name="point" id="point" style="margin-left:10px;" value="${map.point }">&nbsp;point
                    		<input type="hidden" name="member_no" value="${map.member_no }"/></td>
                    	</tr>
                        <tr>
                            <th>&nbsp;주소</th>
							<td>&nbsp;${map.addr1 }</td>
                        </tr>
                     	<tr>
                     		<th>&nbsp;상세 주소</th>
							<td>&nbsp;${map.addr2 }</td>
                        </tr>
                    </tbody>
                </table>
                        <input type="hidden" name="cmd" value="write.do"/>
                        <input type="hidden" name="checkEmail" id="checkEmail" value="0"/>
                </form>
                <!-- //write--->
                <div class="btnSet_clear">
                	<br>
                    <div><a href="javascript:;" class="btn" onclick="goSave();">수정</a> <a href="javascript:;" class="btn" onclick="history.back();">취소</a></div>
                </div>
            </div>
        </div>
		
</div>
 
</body> 
</html>